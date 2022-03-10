require 'rails_helper'

RSpec.describe "Cellphone", type: :model do
  
    subject { FactoryBot.build(:cellphone) }

    it { is_expected.to validate_presence_of :manufacturer }
    it { is_expected.to validate_presence_of :model }
    it { is_expected.to validate_presence_of :color }
    it { is_expected.to validate_presence_of :carrier_plan_type }
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_presence_of :price }


    it { is_expected.to respond_to(:manufacturer) }
    it { is_expected.to respond_to(:model) }
    it { is_expected.to respond_to(:color) }
    it { is_expected.to respond_to(:carrier_plan_type) }
    it { is_expected.to respond_to(:quantity) }
    it { is_expected.to respond_to(:price) }

end
