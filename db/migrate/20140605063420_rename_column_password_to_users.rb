class RenameColumnPasswordToUsers < ActiveRecord::Migration
  def change

		rename_column :users, :password, :psw

  end
end
