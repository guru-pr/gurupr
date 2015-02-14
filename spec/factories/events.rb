FactoryGirl.define do
  factory :event do
    name        'name'
    local       'local'
    address     'address'

    factory :event_happened do
      occurred_at { 1.year.ago }
    end

    factory :event_not_happened do
      occurred_at { 1.year.from_now }
    end
  end
end
