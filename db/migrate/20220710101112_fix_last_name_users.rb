class FixLastNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_namre, :last_name
  end
end
