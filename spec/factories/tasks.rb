FactoryGirl.define do
  factory :task do
    name "test task"
    description "I am just a test task"
    deadline Time.now
    association :user
  end
end
