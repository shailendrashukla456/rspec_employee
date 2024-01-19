require 'rails_helper'

RSpec.describe EmpsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      emp = Emp.create(
        name: 'Test_user',
        email: 'user12@gmail.com',
        address: 'indore',
        contact: '9909897899'
      )

      get :show, params: { id: emp.id }

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates emp data and redirects to the show page' do
      emp_params = {
        name: 'Test_user',
        email: 'user12@gmail.com',
        address: 'indore',
        contact: '9909897899'
      }

      post :create, params: { emp: emp_params }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(emp_path(assigns(:emp)))
    end
  end
 
  describe 'PUT #update' do
  it 'updates emp data and redirects to the show page' do
    # Create an emp instance
    emp_params = {
      name: 'Test_user',
      email: 'user12@gmail.com',
      address: 'indore',
      contact: '9909897899'
    }
    emp = Emp.create(emp_params)

    # Update emp data
    updated_params = {
      name: 'Updated_user',
      email: 'updated_user@gmail.com',
      address: 'updated_address',
      contact: '9876543210'
    }

    put :update, params: { id: emp.id, emp: updated_params }

    # Expect successful HTTP response
    expect(response).to have_http_status(:found)

    # Expect redirection to the show page
    expect(response).to redirect_to(emp_path(assigns(:emp)))
  end
end


  describe 'GET #destroy' do
    it 'deletes an emp' do
      # Create an emp instance
      emp = Emp.create(
        name: 'Updated_user',
        email: 'updated_user@gmail.com',
        address: 'updated_address',
        contact: '9876543210'
      )

      # Delete the emp
      delete :destroy, params: { id: emp.id }

      # Expect a successful HTTP response, usually a redirect after deletion
      expect(response).to have_http_status(:found)

      # Optionally, you can check if the emp has been deleted
      expect { emp.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

end
