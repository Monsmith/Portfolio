class Api::PortfsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Portf.all
  end
  def show
    portfolio_items = Portf.find(params[:id])
    render json: portfolio_items
  end
  def create
    portfolio_items = Portf.new(portf_params)
    if portfolio_items.save
      render status: 200,json: {

          messages: "Successfully created"
      }.to_json
    else
      render status: 500, json: {

          errors: portfolio_items.errors

      }.to_json
    end
  end
  def update
    portfolio_items = Portf.find(params[:id])
    if portfolio_items.update(list_params)
      render status: 200,json: {

          message: "Successfully updated",
          todo_list: list
      }.to_json
    else
      render status: 500, json:{
          message: "The To-do list could not be updated.",
          todo_list: list
      }.to_json
    end
  end
  def destroy
    portfolio_items = Portf.find(params[:id])
    portfolio_items.destroy
    render status: 200,json: {

        messages: "Successfully deleted"
    }.to_json
  end
  private
  def portf_params
    params.require(:portf).permit(:title,
                                  :subtitle,:body,
                                  :main_image,:thumn_image,
                                  technologies_attributes:[:id,:name, :_destroy])
  end
end