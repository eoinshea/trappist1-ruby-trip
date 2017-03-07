require 'rspec'
require_relative '../spec_helper'
require_relative '../../app/rocket'
require_relative '../../app/person'



describe 'Rocket' do

  before :all do
    @php_developer = FactoryGirl.build(:person, :php_developer)
    @ruby_developer = FactoryGirl.build(:person, :ruby_developer)
    @ember_developer = FactoryGirl.build(:person, :ember_developer)
    @valid_rocket = FactoryGirl.build(:rocket)
    @fast_rocket = FactoryGirl.build(:rocket, :rubies_do_not_like_it_too_fast)
    @rocket_no_js_name = FactoryGirl.build(:rocket,:embers_do_not_like_no_js)
  end



  describe '#just_please_take_them_away' do
    context 'passed in object is a php developer' do
      it 'should set the persons position to Positon A' do
        @valid_rocket.just_please_take_them_away(@php_developer)
        expect(@php_developer.location).to eql('Planet A')
      end
    end

    context 'passed in object is a ruby developer' do
      it 'should set developer position to C' do
        @valid_rocket.just_please_take_them_away(@ruby_developer)
        expect(@ruby_developer.location).to eql('Planet B')
      end
    end

    context 'passed in object is an ember developer' do
      it 'should set developer position to C' do
        @valid_rocket.just_please_take_them_away(@ember_developer)
        expect(@ember_developer.location).to eql('Planet C')
      end
    end

  end

  describe 'developer requirements' do

    # I wasnt sure how to interpret that php developers "don't like seat classes" so i just make sure they are first class
    context 'php developer' do
      it 'should only be in first class' do
        @valid_rocket.select_seating(@php_developer)
        expect(@php_developer.seating_position).to eql('First Class')
      end
    end

    context 'ember developer rocket name ' do
      it 'a name with js should return an error' do
        @rocket_no_js_name.valid?
        expect(@rocket_no_js_name.errors[:name]).to eql(["rocket name should end in .js"])
      end
      it 'a name without .js should not return an error' do
        expect(@valid_rocket.name).to include('.js')
      end

    end


    context 'ruby developer' do
      it 'a rocket that is too fast should return a validation error' do
        @fast_rocket.valid?
        expect(@fast_rocket.errors[:speed]).to eql(["speed cannot exceed 1000"])
      end
      it 'a rocket below the speed theshold should be valid' do
        @valid_rocket.speed = 1000
        expect(@valid_rocket).to be_valid
      end

    end
  end

end



