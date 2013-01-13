class AddTextToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :text, :text
  end
end
