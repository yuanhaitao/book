class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :password_confirmation
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
