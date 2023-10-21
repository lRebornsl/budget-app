require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      sign_in user
      get :new, params: { user_id: user.id }
      expect(response).to render_template(:new)
    end

    it 'assigns a new category to @category' do
      sign_in user
      get :new, params: { user_id: user.id }
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'does not create a new category' do
        sign_in user
        expect {
          post :create, params: { user_id: user.id, category: FactoryBot.attributes_for(:category, name: nil) }
        }.not_to change(Category, :count)
      end

      it 'renders the new template again' do
        sign_in user
        post :create, params: { user_id: user.id, category: FactoryBot.attributes_for(:category, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
