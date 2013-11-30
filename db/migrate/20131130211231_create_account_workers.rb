class CreateAccountWorkers < ActiveRecord::Migration
  def change
    create_table :account_workers do |t|
      t.string :name, :null => false
      t.string :password, :null => false

      t.timestamps
    end
  end
end
