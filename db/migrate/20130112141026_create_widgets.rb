class CreateWidgets < ActiveRecord::Migration
  def self.up
    create_table :widgets do |t|
      t.string :name, :null => false
      t.text :script, :null => false
      t.integer :minutes_ago, :default => 1440
      t.timestamps
    end
  end

  def self.down
    drop_table :widgets
  end
end
