class Hotline
  include Mongoid::Document
  #embedded_in :person
  
  field :person_id, type: Integer
  field :city, type: String
  field :zip, type: String
  field :client, type: Boolean
end
