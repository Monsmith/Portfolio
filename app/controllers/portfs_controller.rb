class PortfsController < ApplicationController
before_action :set_portf_item,only: [:edit, :update, :destroy, :show]
layout'portf'
def index
  @portfolio_items = Portf.all
end
def new
  @portfolio_item = Portf.new
  3.times{@portfolio_item.technologies.build}
end
def create
    @portfolio_item = Portf.new(portf_params)

  respond_to do |format|
    if @portfolio_item.save
      format.html { redirect_to portfs_path, notice: 'Portfolio was successfully created.' }
    else
      format.html { render :new }
    end
  end
end
def edit
end
def update

  respond_to do |format|
    if @portfolio_item.update(portf_params)
      format.html { redirect_to portfs_path, notice: 'Record was  updated.' }
    else
      format.html { render :edit }
    end
  end
end

def show
 end

def destroy
#Perform the lookup
  @portfolio_item.destroy
#Redirect
  respond_to do |format|
    format.html { redirect_to portfs_url, notice: 'Record was removed.' }
  end
end

private
def portf_params
  params.require(:portf).permit(:title,
                                :subtitle,:body,
                                technologies_attributes:[:name])
end
def set_portf_item
  @portfolio_item = Portf.find(params[:id])
end
end
