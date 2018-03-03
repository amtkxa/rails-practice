class AddStatusToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :status, :string
    add_column :books, :integer, :string
  end
end
