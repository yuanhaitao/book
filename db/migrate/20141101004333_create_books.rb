class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.text :description
      t.string :image_url
      t.date :date

      t.timestamps
    end
  end
end
