FactoryGirl.define do
  factory :admin, class: Admin::User do
    email 'bojovs@gmail.com'
    username 'bojovs'
    password 'svojob'
  end
end