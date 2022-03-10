FactoryBot.define do

    factory :cellphone do
        manufacturer { 'Samsung' }
        model { 'Galaxy S8 64GB' }
        color { Faker::Color.color_name }
        carrier_plan_type { 'pre' }
        quantity { Faker::Number.between(from: 1, to: 30) }
        price { Faker::Number.number(digits: 4) }
    end

end