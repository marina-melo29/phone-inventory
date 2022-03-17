class Api::CellphonesController < ApplicationController

    require 'csv'

    def index

        @cellphones = Cellphone.all
        #render json: { cellphones: cellphones }, status: 200
        render file: "#{Rails.root}/app/views/layouts/index.html.erb", status: 200

    end

    def create

        Cellphone.destroy_all

        csv = params[:cellphone][:csv]

        if (csv.present?)

            File.open(Rails.root.join('public', 'uploads', csv.original_filename), 'wb') do |file|
                file.write(csv.read)
            end
                
            is_line_valid = true

            rows = []

            CSV.foreach("public/uploads/"+csv.original_filename).with_index do |line, index|

                (line.count < 6) ? is_line_valid = false : ""
                (index != 0) ? rows << line : ""
                
            end

            if (is_line_valid)
                
                csv_data = []

                rows.each do |line|

                    csv_data = Cellphone.create(manufacturer: line[0], model: line[1], color: line[2], carrier_plan_type: line[3], quantity: line[4], price: line[5])

                end

                render json: { csv: csv_data }, status: 201

            else

                render json: { errors: "invalid" }, status: 400

            end

        else

            render json: { errors: "nil" }, status: 404

        end

    end

    def destroy

        Cellphone.destroy_all
        head 204

    end


end
