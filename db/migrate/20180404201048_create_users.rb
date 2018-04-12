class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :account, polymorphic: true, index: true
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin, default: true # false when making non-admins and auth etc.
      t.timestamps
    end
  end
end
