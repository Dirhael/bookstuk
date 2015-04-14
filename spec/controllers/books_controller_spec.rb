require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'GET methods' do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    context 'get index' do
      it 'should return books' do
        book = FactoryGirl.create(:book, availability: true)
        get :index
        expect(assigns(:books)).to eq [book]
      end

      it 'should render the index view' do
        get :index
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
      end
    end

    context 'get new' do
      it 'should render the new template' do
        get :new
        expect(response).to render_template(:new)
        expect(response.status).to eq(200)
      end
    end

    describe 'post create' do
      context 'with valid attributes' do
        before do
          @book = FactoryGirl.attributes_for(:book)
        end

        it 'should create a new book' do
          expect { post :create, book: @book }.to change(Book, :count).by(1)
        end

        it 'should redirect to the book created' do
          post :create, book: @book
          expect(response).to redirect_to(Book.last)
        end
      end

      context 'with invalid attributes' do
        before do
          @book = FactoryGirl.attributes_for(:invalid_book)
        end

        it 'should not create the book' do
          expect { post :create, book: @book}.to change(Book, :count).by(0)
        end

        it 'should render the new view' do
          post :create, book: @book
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'get edit' do
      it 'should render the edit view' do
        get :edit, id: FactoryGirl.create(:book, user: @user)
        expect(response).to render_template(:edit)
        expect(response.status).to eq(200)
      end
    end

    describe 'put update' do
      context 'with valid attributes' do
        before do
          @book = FactoryGirl.create(:book, user: @user)
        end

        it 'should update the book' do
          new_book = FactoryGirl.attributes_for(:book, user: @user)
          put :update, id: @book.id, book: new_book
          @book.reload
          expect(@book.name).to eq new_book[:name]
        end

        it 'should redirect to the book' do
          put :update, id: @book.id, book: FactoryGirl.attributes_for(:book, user: @user)
          @book.reload
          expect(response).to redirect_to @book
          expect(response.status).to eq(302)
        end

      end

      context 'with invalid attributes' do
        before do
          @book = FactoryGirl.create(:book, user: @user)
        end

        it 'should not update the book' do
          new_book = FactoryGirl.attributes_for(:invalid_book, user: @user)
          put :update, id: @book.id, book: new_book
          @book.reload
          expect(@book.name).not_to eq new_book[:name]
        end

        it 'should render the edit action' do
          put :update, id: @book.id, book: FactoryGirl.attributes_for(:invalid_book, user: @user)
          @book.reload
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'get show' do
      before do
        @book = FactoryGirl.create(:book)
      end

      it 'should render the show view' do
        get :show, id: @book.id
        expect(response).to render_template(:show)
        expect(response.status).to eq(200)
      end
    end
  end

end
