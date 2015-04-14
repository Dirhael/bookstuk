require 'rails_helper'

RSpec.describe User, type: :model do

  context 'valid user' do
    before do
      @user = FactoryGirl.build(:user)
    end

    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should have a password of at least 8 characters' do
      expect(@user.password.length).to be_between(7,16)
    end

    it 'should have a valid email' do
      expect(@user.email).to match(/[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/)
    end
  end

  context 'valid user with books' do
    before do
      @user = FactoryGirl.create(:user_with_books)
    end

    it 'should have some books' do
      expect(@user.books.count).not_to eq(0)
    end
  end

  context 'invalid user' do
    before do
      @user = FactoryGirl.build(:invalid_user)
    end

    it 'should not be valid' do
      expect(@user).to_not be_valid
    end

    it 'should not have a password' do
      expect(@user.password).to be_nil
    end

    it 'should not have an email' do
      expect(@user.email).to be_nil
    end
  end

end
