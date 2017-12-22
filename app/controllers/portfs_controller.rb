class PortfsController < ApplicationController
def index
  @portfolio_items = Portf.all
end
def new
  @portfolio_item = Portf.new
end
def create
    @portfolio_item = Portf.new(params.require(:portf).permit(:title, :subtitle,:body))

  respond_to do |format|
    if @portfolio_item.save
      format.html { redirect_to portfs_path, notice: 'Portfolio was successfully created.' }
    else
      format.html { render :new }
    end
  end
end
end
