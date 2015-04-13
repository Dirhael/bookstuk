FactoryGirl.define do

  factory :book do
    name {Faker::App.name}
    author {Faker::Name.name}
    description {Faker::Lorem.words(14)}
    price {Faker::Number.number(2)}
    image {Faker::Avatar.image}
    resource 'http://www.adobe.com/content/dam/Adobe/en/devnet/acrobat/pdfs/pdf_open_parameters.pdf'
    created_at {Faker::Date.birthday(23,24)}
    updated_at {Faker::Date.birthday(23,24)}
    user
  end

  factory :invalid_book, parent: :book do
    name nil
    author nil
    description nil
    price 0.03
    user nil
    resource nil
    image nil
  end

end