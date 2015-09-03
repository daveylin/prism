class Person < ActiveRecord::Base
 
def self.search(search)
  #where(first_name: LIKE ("%#{search}%")) 
  #where("last_name LIKE ?", "%#{search}%")
  where("first_name like ?", "%#{search}%") 
end
end
