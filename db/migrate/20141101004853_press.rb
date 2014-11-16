class Press < ActiveRecord::Migration
  def up
  	add_column :books, :book_press, :string
  end

  def down
     remove_column :books, :book_press
  end
end
