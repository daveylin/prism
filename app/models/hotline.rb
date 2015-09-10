class Hotline
  include Mongoid::Document
  #embedded_in :person
  
  field :city, type: String
  field :zip, type: String
  field :client, type: Boolean
end
