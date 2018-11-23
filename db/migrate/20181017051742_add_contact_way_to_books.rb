class AddContactWayToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :contact_way, :string
  end
end
