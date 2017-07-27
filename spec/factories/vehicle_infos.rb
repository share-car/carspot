FactoryGirl.define do
  factory :vehicle_info do
    users nil
    model "MyString"
    license_plate "MyString"
    year 1
    branch "MyString"
    description "MyText"
    rent_publish false
  end
end
