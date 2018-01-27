class Article < ApplicationRecord
 mount_uploader :banner, BannerUploader

	has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User"
  has_many :likes
  has_many :users, through: :likes
  
	validates :title, presence: true, length: {minimum: 5}


  def tags=(value)
    if value.is_a?(String)
      super(sanitize_tags(value))
    else
      super
    end
  end

  private

  def sanitize_tags(value)
    value.split.map { |tag| tag.downcase }.uniq
  end


end