class ChangeColumnName < ActiveRecord::Migration
    def change
      rename_column :users, :password, :password_digest
      rename_column :users, :username, :name
    end
end