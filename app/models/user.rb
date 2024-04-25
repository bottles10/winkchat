class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :username, presence: true, length: { minimum: 4, maximum: 16}

  has_one_attached :avatar
  validates :avatar, presence: true
  validates :avatar, size: {less_than: 5.megabytes, message: "Must be less than 5MB."}
  validates :avatar, content_type: [:png, :jpg, :jpeg]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
