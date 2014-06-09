class ChangeDefaultValue < ActiveRecord::Migration
  def up
    change_column :pages, :private, :boolean, default: false
  end

  def down
    change_column :pages, :private, :boolean, default: nil
  end
end
