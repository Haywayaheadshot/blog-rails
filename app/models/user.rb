class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  validates_presence_of :name
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  has_one_attached :photo

validate :photo_validation

def photo_validation
  if photo.attached?
    if !photo.content_type.in?(%w(image/jpeg image/png))
      errors.add(:photo, "must be a JPEG or PNG")
    end
  else
    errors.add(:photo, "must be attached")
  end
end

  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
