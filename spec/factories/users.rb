FactoryGirl.define do
  factory :user do
    email                  "buddhamagnet@gmail.com"
    password               "moonmadness"
    password_confirmation  "moonmadness"
  end
  
  Factory.sequence :email do |n|
    "user-#{n}@gmail.com"
  end
end
