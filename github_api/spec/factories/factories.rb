FactoryGirl.define do
  factory :student do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    username { Faker::Internet.user_name}
    city { Faker::Address.city }
  end

  # factory :event do
  #   repo { Faker::Commerce.product_name }
  #   message { Faker::Company.catch_phrase }
  #   date { Faker::Business.credit_card_expiry_date }
  # end

  # factory :language do
  #   lang_name { %(Ruby JavaScript CSS Objective_C Python).sample }
  #   lang_amount { rand(50000) + 1000 }
  # end

  # factory :repo do
  #   name { Faker::Commerce.product_name }
  #   stargazers_count { rand(50) }
  #   watchers_count { rand(50) }
  #   description { Faker::Company.catch_phrase }
  #   html_url { Faker::Internet.url }
  # end


end




