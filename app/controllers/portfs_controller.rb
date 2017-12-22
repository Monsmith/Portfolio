class PortfsController < ApplicationController
def index
  @portfolio_items = Portf.all
end
end
