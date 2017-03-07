FactoryGirl.define do
  factory :rocket do
    name Faker::GameOfThrones.house + '.js'
    speed 1000
    initialize_with { new( name, speed ) }
  end

  trait :embers_do_not_like_no_js do
    name Faker::GameOfThrones.house
  end

  trait :rubies_do_not_like_it_too_fast do
    speed 2000
  end


end
