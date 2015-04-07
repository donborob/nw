class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :uniqueness => true
  has_attached_file :avatar
  has_many :posts
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "inage/gif"]
end
