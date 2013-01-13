class CreateDashboards < ActiveRecord::Migration
  def self.up
    create_table :dashboards do |t|
      t.string :name, :null => false
      t.integer :minutes_ago, :default => 1440
      t.timestamps
    end
  end

  def self.down
    drop_table :dashboards
  end
end
