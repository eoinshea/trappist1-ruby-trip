require 'rspec'
require 'spec_helper'
require_relative '../../app/person'

describe 'Person' do

  describe 'validations' do
    before :all do
      @valid_php_developer = FactoryGirl.build(:person, :php_developer)
      @valid_ruby_developer = FactoryGirl.build(:person, :ruby_developer)
      @valid_ember_developer = FactoryGirl.build(:person, :ember_developer)
      @invalid_person = FactoryGirl.build(:person, :invalid_person)
    end

    context 'any person' do
      it 'with correct attributes should be valid' do
        expect(@valid_php_developer).to be_valid
      end
      it 'with incorrect or missing attributes should be not be valid' do
        expect(@invalid_person).to_not be_valid
      end
    end


    describe 'developer types' do
      context 'a php developer' do
        it 'should have developer_type of php' do
          expect(@valid_php_developer.developer_type.upcase).to eql('PHP')
        end
        context 'a ruby developer' do
          it 'should have developer_type of ruby' do
            expect(@valid_ruby_developer.developer_type.upcase).to eql('RUBY')
          end
        end
        context 'an ember developer' do
          it 'should have developer_type of ember' do
            expect(@valid_ember_developer.developer_type.upcase).to eql('EMBER')
          end
        end
      end
    end
  end
end
