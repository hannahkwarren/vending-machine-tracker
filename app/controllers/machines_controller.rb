class MachinesController < ApplicationController
  # include ActionView::Helpers::NumberHelper
  
  def index
    @owner = Owner.find(params[:owner_id])
  end
  
  def show
    @machine = Machine.find(params[:id])
  end
end
