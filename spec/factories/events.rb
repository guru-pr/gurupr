FactoryGirl.define do
  factory :event do
    local       'local'
    address     'address'

    factory :event_happened do
      name 'event happened'
      occurred_at { 1.year.ago }
    end

    factory :event_not_happened do
      name 'event not happened'
      occurred_at { 1.year.from_now }
    end
  end
end
