class AddCentsToBook < ActiveRecord::Migration
  def change
    add_column :books, :cents, :integer
    Book.update_all('cents = price*100')
  end
end