require 'rails_helper'

RSpec.describe EmpsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end


  # Add more controller tests for other actions (show, new, create, edit, update, destroy)
end