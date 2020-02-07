class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.date :birthday
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
