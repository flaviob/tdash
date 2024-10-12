class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      # Comment these lines since they are already in the schema
      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at
      # t.datetime :remember_created_at

      # You can add any other fields if needed (but these are in the schema already)
    end
  end

  def down
    # You can leave this or customize it if needed
    raise ActiveRecord::IrreversibleMigration
  end
end
