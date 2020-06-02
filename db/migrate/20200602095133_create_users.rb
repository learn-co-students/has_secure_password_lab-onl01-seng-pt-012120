class CreateUsers < ActiveRecord::Migration[5.0]
    create_table :users do |t|
        t.string :name
        t.string :password_digest
    end
end