FactoryBot.define do
  
  factory :quest do
    title {"jikkenn"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end