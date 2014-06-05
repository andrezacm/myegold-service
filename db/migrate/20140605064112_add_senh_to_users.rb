class AddSenhToUsers < ActiveRecord::Migration
  def change
    add_column :users, :senh, :string
  end
end
