FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}

    factory :invalid_user do
      email nil
      password nil
    end

    factory :user_with_books do
      email {Faker::Internet.email}
      password {Faker::Internet.password}

      transient do
        books_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:book, evaluator.books_count, user: user)
      end
    end
  end

end
