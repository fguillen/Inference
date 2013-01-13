class DashboardLatticesController < ApplicationController
  def create
    @dashboard_lattice = DashboardLattice.new(params[:dashboard_lattice])
    if @dashboard_lattice.save
      redirect_to @dashboard_lattice.dashboard, :notice => "Successfully created dashboard_lattice."
    else
      redirect_to @dashboard_lattice.dashboard, :alert => "Some error trying to create dashboard_lattice."
    end
  end

  def destroy
    @dashboard_lattice = DashboardLattice.find(params[:id])
    @dashboard_lattice.destroy
    redirect_to @dashboard_lattice.dashboard, :notice => "Successfully destroyed dashboard_lattice."
  end
end
