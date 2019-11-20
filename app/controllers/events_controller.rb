class EventsController < ApplicationController
    def index
        by = sort_params.fetch(:by, 'date')
        order = sort_params.fetch(:order, 'asc')
        @events = Event.where('date >= ?', Date.today).order("#{by} #{order}")
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
