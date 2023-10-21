require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user) }

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index, params: { user_id: user.id, category_id: category.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      sign_in user
      get :new, params: { user_id: user.id, category_id: category.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new payment' do
        sign_in user
        expect {
          post :create, params: { user_id: user.id, category_id: category.id, payment: FactoryBot.attributes_for(:payment) }
        }.to change(Payment, :count).by(1)
      end

      it 'redirects to the payments index page' do
        sign_in user
        post :create, params: { user_id: user.id, category_id: category.id, payment: FactoryBot.attributes_for(:payment) }
        expect(response).to redirect_to(user_category_payments_path(user, category))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new payment' do
        sign_in user
        expect {
          post :create, params: { user_id: user.id, category_id: category.id, payment: FactoryBot.attributes_for(:payment, name: nil) }
        }.not_to change(Payment, :count)
      end

      it 'renders the new template again' do
        sign_in user
        post :create, params: { user_id: user.id, category_id: category.id, payment: FactoryBot.attributes_for(:payment, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
