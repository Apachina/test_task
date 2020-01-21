FactoryBot.define do
  factory :unit do
    association :property
    property_id { 1 }
    unit_number { 1 }
    area { "MyString" }
  end
end
