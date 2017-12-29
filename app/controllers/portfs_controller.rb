class PortfsController < ApplicationController
def index
  @portfolio_items = Portf.all
end
def new
  @portfolio_item = Portf.new
  3.times{@portfolio_item.technologies.build}
end
def create
    @portfolio_item = Portf.new(params.require(:portf).permit(:title, :subtitle,:body,
    technologies_attributes:[:name]))

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
      format.html { redirect_to portfs_path, notice: 'Record was  updated.' }
    else
      format.html { render :edit }
    end
  end
end

def show
   @portfolio_item = Portf.find(params[:id])
 end

def destroy
#Perform the lookup
  @portfolio_item = Portf.find(params[:id])
  @portfolio_item.destroy
#Redirect
  respond_to do |format|
    format.html { redirect_to portfs_url, notice: 'Record was removed.' }
  end
end
end
