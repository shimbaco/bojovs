FactoryGirl.define do
  factory :admin, class: Admin::User do
    email 'bojovs@gmail.com'
    username 'bojovs'
    password 'svojob'
  end

  sequence :slug do |n|
    "hello-world-#{n}"
  end

  sequence :title do |n|
    "Hello World #{n}"
  end

  factory :blog_article, class: Blog::Article do
    slug
    title
    body 'This is my blog article.'
    published_at '2012/06/24'
  end
end