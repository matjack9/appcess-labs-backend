class CreateContract < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.integer :school_id
      t.integer :project_id
      t.integer :user_id, null: true
      t.numeric :fee, precision: 15, scale: 2
      t.timestamp :start_time, null: true
      t.timestamp :deadline, null: true
      t.boolean :is_requested, default: true
      t.boolean :is_accepted, default: false
      t.boolean :is_in_progress, default: false
      t.boolean :is_in_review, default: false
      t.boolean :is_completed, default: false
      t.timestamps
    end
  end
end
