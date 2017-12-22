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
def edit
  @portfolio_item = Portf.find(params[:id])
end
def update
  @portfolio_item = Portf.find(params[:id])

  respond_to do |format|
    if @portfolio_item.update(params.require(:portf).permit(:title, :subtitle, :body))
      format.html { redirect_to portfs_path, notice: 'Blog was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def show
  @portfolio_item = Portf.find(params[:id])

end
end
