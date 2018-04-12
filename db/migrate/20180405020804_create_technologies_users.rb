class CreateTechnologiesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :technologies_users do |t|
      t.integer :user_id
      t.integer :technology_id
    end
  end
end
