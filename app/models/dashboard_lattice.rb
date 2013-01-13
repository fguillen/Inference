class DashboardLattice < ActiveRecord::Base
  belongs_to :dashboard
  belongs_to :widget
  attr_protected nil
end
