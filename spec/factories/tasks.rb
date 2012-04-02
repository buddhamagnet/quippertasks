FactoryGirl.define do
  factory :task do
    name "test task"
    description "I am just a test task"
    association :user
  end
end
