class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :user_stories
      t.string :requirements
      t.integer :company_id
      t.timestamps
    end
  end
end
