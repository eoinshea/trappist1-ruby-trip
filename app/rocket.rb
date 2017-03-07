require 'active_model'
class Rocket
  include ActiveModel::Validations

  @@seat_types = ['First Class', 'Business', 'Economy']
  @@max_speed = 1000


  attr_accessor :name, :seat_types , :speed


  validate :speed_maximum
  validate :name_with_js


  def initialize(name, speed)
    @name = name
    @speed = speed
  end


  def select_seating(person)
    if person.developer_type.upcase == 'PHP'
      person.seating_position = 'First Class'
      else
      person.seating_position = 'Economy'
    end


  end

  def just_please_take_them_away(person)

    case person.developer_type.upcase
      when 'PHP'
        person.location = "Planet A"
      when 'RUBY'
        person.location = "Planet B"
      when 'EMBER'
        person.location = "Planet C"
      else
        raise ArgumentError, "the person object may not be valid"
    end
  end


  #
  ## CUstom Validations
  #

  # to acommodate ruby developers
  def speed_maximum
    if speed > 1000
      errors.add(:speed, "speed cannot exceed 1000")
    end
  end

  # to acommodate php developers
  # see Person

  # to acommodate ember developers
  def name_with_js
    unless @name.end_with?(".js")
      errors.add(:name, "rocket name should end in .js" )
    end
  end


end