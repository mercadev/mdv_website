class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :activity
      t.string :profession
      t.string :email
      t.string :mobile_phone
      t.string :fixed_phone
      t.text :address
      t.string :website
      t.string :source

      t.timestamps
    end
  end
end
