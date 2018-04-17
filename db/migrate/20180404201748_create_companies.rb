class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: true
      t.string :website, null: true
      t.string :description, null: true
      t.string :key
      t.string :admin_key
      t.timestamps
    end
  end
end
