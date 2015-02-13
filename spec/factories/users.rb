FactoryGirl.define do
  factory :valid_user, class: User do
    provider 'github'
    uid '1'
    name 'Valid User'
    email 'valid@user.net'
    nickname 'valid-user'
    image 'http://placehold.it/300'
  end
end
