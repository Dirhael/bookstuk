require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'with valid attributes' do
    before do
      @book = FactoryGirl.build(:book)
    end

    it 'should be a new record' do
      expect(@book).to be_valid
    end

    it 'should belong to a user' do
      expect(@book.user).to be_a(User)
    end
  end

  context 'with invalid attributes' do
    before do
      @book = FactoryGirl.build(:invalid_book)
    end

    it 'should not be a valid record' do
      expect(@book).to_not be_valid
    end

    it 'should not have a user' do
      expect(@book.user).to be nil
    end
  end

end