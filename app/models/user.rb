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
  
  #default_scope { order(first_name: :asc, last_name: :asc) }
  default_scope { order('LOWER(first_name)', 'LOWER(last_name)') }
end
