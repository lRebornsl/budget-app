FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    user
    after(:build) do |category|
      category.icon.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'icon.png')), filename: 'icon.png',
                           content_type: 'image/png')
    end
  end
end
