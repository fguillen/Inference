class CreateDashboardLattices < ActiveRecord::Migration
  def change
    create_table :dashboard_lattices do |t|
      t.references :dashboard, :null => false
      t.references :widget, :null => false
      t.integer :position, :default => 0

      t.timestamps
    end
    add_index :dashboard_lattices, :dashboard_id
    add_index :dashboard_lattices, :widget_id
  end
end
