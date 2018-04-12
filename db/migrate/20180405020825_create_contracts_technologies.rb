class CreateContractsTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts_technologies do |t|
      t.integer :contract_id
      t.integer :technology_id
    end
  end
end
