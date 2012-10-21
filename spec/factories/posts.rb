FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    sequence(:body) { |n| "This is post #{n}" }
    published true
  end
end
