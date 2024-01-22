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
      it "creates a new Beer record when one doesn't exit" do
        expect { post :create, params: params }.to change(Beer, :count).by(1)
      end

      it 'creates a new TiltData record in the database' do
        expect { post :create, params: params }.to change(TiltData, :count).by(1)
      end

      it 'returns a 204 status' do
        post :create, params: params

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when a Beer exists for the name' do
      let!(:beer) { create(:beer, name: params[:name]) }

      it 'does not create a new Beer record' do
        expect { post :create, params: params }.to change(Beer, :count).by(0)
      end

      it 'creates a new TiltData record in the database' do
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
