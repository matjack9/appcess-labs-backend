class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :website
      t.numeric :fee, precision: 15, scale: 2
      t.integer :turntime # number of days
      t.string :image_url, null: true
      t.string :key
      t.string :admin_key
      t.timestamps
    end
  end
end
