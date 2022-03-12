class Api::CellphonesController < ApplicationController

    def index

        cellphones = Cellphone.all
        render json: { cellphones: cellphones }, status: 200

    end

    def create

        cellphone = Cellphone.new

        cellphone.manufacturer      = params[:manufacturer]
        cellphone.model             = params[:model]
        cellphone.color             = params[:color]
        cellphone.carrier_plan_type = params[:carrier_plan_type]
        cellphone.quantity          = params[:quantity]
        cellphone.price             = params[:price]

        if (cellphone.save)
            render json: cellphone, status: 201
        else
            render json: { errors: cellphone.errors }, status: 422
        end

    end

    def destroy
        Cellphone.destroy_all
        head 204
    end


end
