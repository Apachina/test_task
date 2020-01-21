FactoryBot.define do
  factory :property do
    name { "MyString" }
    description { "MyString" }
    address { "MyString" }

    factory :property_with_unit do
      after(:create) do |property|
        create(:unit, property: property)
      end
    end


    trait :invalid do
      name { nil }
    end
  end
end
