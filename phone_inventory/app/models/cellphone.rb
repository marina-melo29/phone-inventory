class Cellphone < ApplicationRecord
  
  validates_presence_of :manufacturer, :model, :color, :carrier_plan_type, :quantity, :price

end
