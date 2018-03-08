class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy

    belongs_to :user
  
    validates :title, presence: true, length: { minimum: 3 }
    validates :body, presence: true, length: { minimum: 30 }

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

#     has_attached_file :avatar, styles: {
#     thumb: '100x100>',
#     square: '200x200#',
#     medium: '300x300>'
#   }

#   # Validate the attached image is image/jpg, image/png, etc
#   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
  end