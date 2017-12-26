require 'rails_helper'

describe SchoolsController, type: :controller do
  describe "GET 'index'" do
    it 'request index and return 200 OK' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end
    
    it "returns all the schools" do
      FactoryBot.create_list(:school, 5)
      get :index, format: :json
      response_body = JSON.parse(response.body)
      expect(response_body.length).to eq(5)
    end
  end
  
  describe "GET 'show'" do
    
    let(:school) { create(:school) }
    
    it 'request show and return 200 OK' do
      get :show, params: {id: school.id}, format: :json
      expect(response).to have_http_status(:ok)
    end
    
    it 'returns data of an single student' do
      get :show, params: {id: school.id}
      response_body = JSON.parse(response.body)
      expect(response_body).to_not be_nil
    end
  end

  describe "POST 'create'" do
    it 'return a successful status 201 Created' do
      post :create, params: { school: {name: "Escola X", cnpj: "12345678909876" }}, format: :json
      expect(response).to have_http_status(:created)
    end
    
    it 'returns a successful json' do
      post :create, params: { school: {name: "Escola X", cnpj: "12345678909876" }}, format: :json
      expect(response).to be_success
      response_body = JSON.parse(response.body)
      expect(response_body['cnpj']).to eq("12345678909876")
    end
    
    it 'validate presence name' do
      post :create, params: { school: {cnpj: "12345678909876" }}, format: :json
      response_body = JSON.parse(response.body)
      expect(response_body['name']).to eq(["can't be blank"])
    end
    
    it 'validate presence cnpj' do
      post :create, params: { school: {name: "Escola X" }}, format: :json
      response_body = JSON.parse(response.body)
      expect(response_body['cnpj']).to eq(["can't be blank"])
    end
  end

  describe "PUT 'update'" do
    
    let(:school) { create(:school) }

    it 'update record and return status 200 OK' do
      put :update, params: { id: school.id, school: {name: "Escola X", cnpj: "12345678909876" }}, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PACTH 'update'" do
    
    let(:school) { create(:school) }

    it 'update record and return status 200 OK' do
      patch :update, params: { id: school.id, school: {cnpj: "12345678909876" }}, format: :json
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe "DELETE 'destroy'" do
    it 'destroy record and return status 204 No Content' do
      school = FactoryBot.create(:school)
      delete :destroy, params: {id: school.id}
      expect(response).to have_http_status(:no_content)
    end

    it 'search for an inexistent school and return error' do
      expect{delete :destroy, params: {id: 99}}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end