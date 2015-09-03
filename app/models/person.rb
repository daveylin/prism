class Person < ActiveRecord::Base
  def self.search(first_name, last_name)
    where("first_name ilike ?", "%#{first_name}%").where("last_name ilike ?", "%#{last_name}%")
  end
  
  def self.searchdob(first_name, last_name, dob)
    where("first_name ilike ?", "%#{first_name}%").where("last_name ilike ?", "%#{last_name}%").where("dob = ?", "%#{dob}%")
  end
end
