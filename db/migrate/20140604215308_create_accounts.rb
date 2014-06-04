class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :plan

      t.timestamps
    end
  end
end
