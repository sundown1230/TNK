class User < ActiveRecord::Base
  include Authority::Abilities
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :description, presence: true
  validates :generation, presence: true
  validates :name, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "60x60>" }, :default_url => "defaults/avatar.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  
  # 権限の設定は、/app/authorizers/user_authorizer.rbを参照する
  self.authorizer_name = 'UserAuthorizer'

  # roleを適用したいmodelの中に記載
  resourcify

  #以下のコールバックが利用できるようになる。
  rolify
  # Userを追加した際にデフォルトでeditor roleを割り当てるための設定。
  # 他にも、削除する前、削除した後、作成する前、作成した後といったコールバックが用意されている。
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:editor)
  end



end
