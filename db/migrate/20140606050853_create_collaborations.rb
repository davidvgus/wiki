class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references :user, index: true
      t.references :page, index: true

      t.timestamps
    end
  end
end
