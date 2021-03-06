class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :editor], multiple: false)                                      ##
  ############################################################################################


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  validates_presence_of :name
  has_many :comments, dependent: :destroy

  def first_name
    self.name.split.first #เอาเฉพาะชื่อจริง first คือ ตำแหน่งแรกบน array
  end
  def last_name
    self.name.split.last
  end
  after_create :welcome_send
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
  end

end
