class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
  end

  def new
    @widget = Widget.new
  end

  def create
    @widget = Widget.new(params[:widget])
    if @widget.save
      redirect_to edit_widget_path(@widget), :notice => "Successfully created widget."
    else
      render :action => 'new'
    end
  end

  def edit
    @widget = Widget.find(params[:id])
  end

  def update
    @widget = Widget.find(params[:id])
    if @widget.update_attributes(params[:widget])
      redirect_to edit_widget_path(@widget), :notice  => "Successfully updated widget."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy
    redirect_to widgets_url, :notice => "Successfully destroyed widget."
  end
end
