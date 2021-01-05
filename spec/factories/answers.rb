FactoryBot.define do
  
  factory :answer do
    plan {"test"}
    text {"testtest"}
    user
    quest
  end
end