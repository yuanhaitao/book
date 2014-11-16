class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :book
      t.references :user
      t.text :content

      t.timestamps
    end
    add_index :comments, :book_id
    add_index :comments, :user_id
  end
end
