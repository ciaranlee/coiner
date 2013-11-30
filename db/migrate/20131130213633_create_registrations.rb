class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :account_worker_id, :null => false
      t.string :aws_id, :null => false

      t.timestamps
    end
    add_index :registrations, :account_worker_id, :unique => true
  end
end
