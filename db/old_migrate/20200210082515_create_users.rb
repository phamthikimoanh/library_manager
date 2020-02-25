class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.string :phone
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
