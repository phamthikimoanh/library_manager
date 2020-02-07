class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :name
      t.string :desc
      t.string :author
      t.string :image
      t.integer :books_total
      t.boolean :status

      t.timestamps
    end
  end
end
