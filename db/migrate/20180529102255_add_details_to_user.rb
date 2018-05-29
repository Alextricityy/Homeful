class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :date
    add_column :users, :volunteer, :boolean, default: false
    add_column :users, :bio, :text
    add_column :users, :gender, :string
    add_column :users, :postcode, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :photo, :string
  end
end
