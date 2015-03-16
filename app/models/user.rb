class User < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :groups, through: :members


  has_secure_password
  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  has_attached_file :userphoto,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
 
end
