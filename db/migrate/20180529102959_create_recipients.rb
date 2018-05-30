class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :dob
      t.text :bio
      t.string :phone_number
      t.string :photo

      t.timestamps
    end
  end
end
