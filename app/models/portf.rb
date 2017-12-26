class Portf < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumn_image
end
