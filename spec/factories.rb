FactoryGirl.define do
  factory :admin, class: Admin::User do
    email 'bojovs@gmail.com'
    username 'bojovs'
    password 'svojob'
  end

  factory :blog_article do
    slug 'hello-world'
    title 'Hello World'
    body 'This is my first blog article.'
    published_at '2012/06/24'
  end
end