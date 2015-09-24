# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new(
  first_name:   'Admin',
  last_name:    'Test',
  email:        'admin@testdl.com',
  password:     'helloworld',
  active:       true,
  role:         'admin'
  )
admin.save!

genuser = User.new(
  first_name:   'General',
  last_name:    'Test',
  email:        'general@testdl.com',
  password:     'helloworld',
  active:       true,
  role:         'genuser'
  )
genuser.save!

viewonly = User.new(
  first_name:   'ViewOnly',
  last_name:    'Test',
  email:        'viewonly@testdl.com',
  password:     'helloworld',
  active:       true,
  role:         'viewonly'
  )
viewonly.save!

person1 = Person.new(
  first_name:      'Test1',
  last_name:       'Last1',
  address_line_1:  '123 Main St',
  city:            'San Jose',
  state:           'CA',
  zip:             '95133'
  )
person1.save!

person2 = Person.new(
  first_name:      'Test2',
  last_name:       'Last2',
  address_line_1:  '456 1st Street',
  city:            'Milpitas',
  state:           'CA',
  zip:             '95035'
  )
person2.save!