class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable
  
  def admin?
    role == 'admin'
  end
  
  def genuser?
    role == 'genuser'
  end
 
  def viewonly?
    role == 'viewonly'
  end
end
