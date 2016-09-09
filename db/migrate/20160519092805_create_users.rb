class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :company_name, :limit => 60
        t.string :email, null: false
        t.string :phone, :limit => 50
        t.tinyint :isAdmin
        t.tinyint :email_confirmed
        t.string :confirm_token
        t.string :password_digest, null: false
        t.timestamps null: false
    end
  end
end
