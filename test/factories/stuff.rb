FactoryGirl.define do
  factory :user, aliases: [:author, :moderator] do
    sequence(:email) { |i| "user#{i}@example.com" }
    password "password"
    admin false
  end

  factory :board do
    moderator
    sequence(:name) { |i| "board#{i}"}
  end

  factory :post do 
    author
    board
    sequence(:title) {|i| "post#{i}"}
  end

  factory :comment do
    author
    post
    body "hello world!"
  end
end