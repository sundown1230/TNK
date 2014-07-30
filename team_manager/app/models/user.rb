class User < ActiveRecord::Base
  include Authority::Abilities
  include Authority::UserAbilities
  rolify
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :description, presence: true
  validates :generation, presence: true
  validates :name, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "60x60>" }, :default_url => "defaults/avatar.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  after_create :assign_default_role
  self.authorizer_name = 'AdminAuthorizer'
  def assign_default_role
    self.add_role(:editor)
  end


end
