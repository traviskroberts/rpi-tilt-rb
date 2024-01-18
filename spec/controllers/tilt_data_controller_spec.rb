require 'rails_helper'

describe TiltDataController do
  describe 'POST #create' do
    let(:params) do 
      { 
        name: 'Test Beer', 
        temp_fahrenheit: 68, 
        temp_celsius: 21, 
        gravity: 1.042, 
        timestamp: 1.minute.ago 
      }
    end

    context 'with valid params' do
      it 'creates a new record in the database' do
        expect { post :create, params: params }.to change(TiltData, :count).by(1)
      end

      it 'returns a 204 status' do
        post :create, params: params

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalide params' do
      it 'raises an error' do
        expect { post :create, params: { name: 'foo', extra: 'bar' } }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
