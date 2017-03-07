FactoryGirl.define do
  factory :person do
    name Faker::Name
    age Faker::Number.between(18, 65)
    location "Earth"
    seating_position "Economy"
    spoken_languages ['English', 'French']
    computer_os "Windows"
    developer_type "PHP"
    initialize_with { new( name, age,spoken_languages,computer_os,developer_type ,location,seating_position ) }
  end

  trait :php_developer do
    developer_type "PHP"
  end

  trait :ruby_developer do
    developer_type "RUBY"
  end

  trait :ember_developer do
    developer_type "EMBER"
  end

  trait :invalid_person do
    name nil
  end

end
