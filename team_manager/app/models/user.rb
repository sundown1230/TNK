class User < ActiveRecord::Base
  has_many :material_users
  has_many :materials, through: :material_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :description, presence: true
  validates :generation, presence: true
  validates :name, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "60x60>" }, :default_url => "defaults/avatar.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
