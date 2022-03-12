require 'rails_helper'

RSpec.describe 'Cellphone API' do

    let!(:cellphone) { create(:cellphone) }
    let(:headers) do
        {
            'Accept'        => 'application/api.cellphone.inventory',
            'Content-Type'  => Mime[:json].to_s
        }
    end

    describe 'GET /cellphones' do
        before do
            create_list(:cellphone, 5)
            get '/cellphones', params: {}, headers: headers
        end
        
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end

    end

    describe 'POST /cellphones' do
        before do
            post '/cellphones', 
            params: { 
                manufacturer: cellphone_params[:manufacturer], 
                model: cellphone_params[:model], 
                color: cellphone_params[:color],
                carrier_plan_type: cellphone_params[:carrier_plan_type],
                quantity: cellphone_params[:quantity], 
                price: cellphone_params[:price]
            }.to_json, 
            headers: headers
        end
        
        context 'when params are valid' do

            let(:cellphone_params) { attributes_for(:cellphone) }

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

        end

        context 'when params are not valid' do

            let(:cellphone_params) { attributes_for(:cellphone, manufacturer: '') }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

        end
        
    end

    describe 'DELETE /cellphones/destroyall' do

        before do
            post '/cellphones/destroyall', params: {}, headers: headers
        end

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end

        it 'removes cellphones from database' do
            expect(Cellphone.all.count).to eq(0) 
        end

    end

end