class CreateSchoolsTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :schools_technologies do |t|
      t.integer :school_id
      t.integer :technology_id
    end
  end
end
