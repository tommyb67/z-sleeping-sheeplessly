FactoryGirl.define do
  factory :banner do
    start_date Date.today
    end_date Date.tomorrow
    image "Some image path"
    location "Some spot on website"
    user
  end

  factory :second_banner, class: "Banner" do
    start_date Date.yesterday
    end_date Date.tomorrow
    image "Another image path"
    location "Another spot on website"
    user
  end
end