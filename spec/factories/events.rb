FactoryBot.define do
  factory :event do
    name        { 'event' }
    local       { 'local' }
    address     { 'address' }
    occurred_at { Time.zone.now }
    summary     { 'summary' }
    description { 'description' }

    factory :event_today do
      name { 'event today' }
      occurred_at { Time.current }
    end

    factory :event_happened do
      name { 'event happened' }
      occurred_at { 1.year.ago }
    end

    factory :event_not_happened do
      name { 'event not happened' }
      occurred_at { 1.year.from_now }
    end
  end
end
