class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :image, presence: true
    validates :image, size: {less_than: 5.megabytes, message: "Must be less than 5MB."}
    validates :image, content_type: [:png, :jpg, :jpeg]

    has_one_attached :image
    # has_one_attached :image, styles: { :medium => "640x" }
    # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
