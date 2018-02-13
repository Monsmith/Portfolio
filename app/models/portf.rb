class Portf < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda{|attrs| attrs['name'].blank?}

  validates_presence_of :title, :body
  mount_uploader :thumn_image, PortfUploader
  mount_uploader :main_image, PortfUploader

def self.angular
  where(subtitle:'Angular')
end
  def self.by_position
    order("position ASC")
  end

scope :ruby_on_rails_portf_items, -> {where(subtitle:'Ruby on rails')}


end
