require 'active_model'
class Person
  include ActiveModel::Validations

  validates_presence_of :name, :age, :spoken_languages
  validate :at_least_one_spoken_language_and_be_an_array

  attr_accessor :name, :age, :computer_os, :spoken_languages, :location, :developer_type, :seating_position

  #
  # languages should be array of length >0
  #
  def initialize(name,age,spoken_languages,computer_os, developer_type, location = "Earth", seating_position = "Economy")
    @name = name
    @age = age
    @spoken_languages = spoken_languages
    @computer_os = computer_os
    @developer_type = developer_type
    @location = location
    @seating_position = seating_position
  end



  #
  # Custom Validations
  #


  def at_least_one_spoken_language_and_be_an_array
    if @spoken_languages.length < 1 && @spoken_languages != TypeOf(Array) && @spoken_languages.first != TypeOf(String)
      errors.add(:spoken_languages, "a person must speak at least one language and must be an array of string(s)")
    end
  end


end