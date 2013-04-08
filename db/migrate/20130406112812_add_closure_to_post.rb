class AddClosureToPost < ActiveRecord::Migration
  def change
    add_column :posts, :closure, :boolean, :default => true
  end
end
