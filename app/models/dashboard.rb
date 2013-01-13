class Dashboard < ActiveRecord::Base
  attr_protected nil

  has_many :dashboard_lattices
  has_many :widgets, :through => :dashboard_lattices
end
