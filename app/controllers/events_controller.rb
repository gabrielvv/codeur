class EventsController < ApplicationController
    def index
        @events = Event.where('date >= ?', Date.today).order("#{sort_params.fetch(:by)} #{sort_params.fetch(:order)}")
        render json: @events
    end

    def create
        @event = Event.new(event_params)
        @event.save!
    end

    private
        def event_params
            params.require(:event).permit(:date, :description, :name, :email)
        end

        def sort_params
            params.permit(:by, :order)
        end
end
