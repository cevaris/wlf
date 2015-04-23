TEST_PASSWORD = 'password'

FactoryGirl.define do

  factory :account do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end


  factory :user do
    account
    email Faker::Internet.email
    encrypted_password Devise.bcrypt(User, TEST_PASSWORD)
    password TEST_PASSWORD
    confirmed_at Time.now
  end

end
