class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.integer :owner_id
      t.boolean :private

      t.timestamps
    end
  end
end
