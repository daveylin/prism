class AddSsnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :ssn, :string
  end
end
