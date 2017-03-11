FactoryGirl.define do
    sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'William'
    last_name 'Yeates'
    email { generate :email }
    password "abcdef"
    password_confirmation "abcdef"
  end


  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "abcdef"
    password_confirmation "abcdef"
  end

  factory :non_authorized_user do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password "abcdef"
    password_confirmation "abcdef"
  end
end