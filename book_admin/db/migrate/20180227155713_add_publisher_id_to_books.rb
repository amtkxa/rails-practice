class AddPublisherIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :publisher, :reference
  end
end
