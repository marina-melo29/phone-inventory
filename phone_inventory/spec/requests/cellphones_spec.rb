require 'rails_helper'

RSpec.describe 'Cellphone API' do

    let!(:cellphone) { build(:cellphone) }
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

    # CSV
    describe 'POST /cellphones' do  

        before do
            post '/cellphones', params: { cellphone: {csv: csv} }.to_json, headers: headers
        end
        
        context 'when params are valid' do

            let!(:csv) { "spec/csv_files/valid_test.csv" }.to_json

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

        end

        context 'when params are not valid' do

            let!(:csv) { "spec/csv_files/invalid_test.csv" }.to_json

            it 'returns status code 400' do
                expect(response).to have_http_status(400)
            end

        end

        context 'when params are not present' do

            let!(:csv) { nil }.to_json

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
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