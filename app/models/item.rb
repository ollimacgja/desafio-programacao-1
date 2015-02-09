class Item < ActiveRecord::Base
  belongs_to :merchant

  def merchant_name
  	merchant.try(:name)
  end
end
