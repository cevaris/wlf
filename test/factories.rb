TEST_PASSWORD = 'password'

FactoryGirl.define do

  factory :account do
    address
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :address do
    first_line Faker::Address.street_name
    second_line "Apt# #{Faker::Address.building_number}"
    city Faker::Address.city
    state Faker::Address.state_abbr
    zipcode Faker::Address.zip_code
  end

  factory :user do
    account
    email Faker::Internet.email
    encrypted_password Devise.bcrypt(User, TEST_PASSWORD)
    password TEST_PASSWORD
    confirmed_at Time.now
  end

end
