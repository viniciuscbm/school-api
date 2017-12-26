FactoryBot.define do
  factory :school do
    name Faker::Name.name
    cnpj Faker::Number.number(14)
  end
end