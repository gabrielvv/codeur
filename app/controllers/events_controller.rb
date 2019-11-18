class EventsController < ApplicationController
    def index
        @events = Event.all
        render json: @events
    end

    def create
        @event = Event.new(event_params)
        @event.save
    end

    private
        def event_params
            params.require(:event).permit(:date, :description, :name, :email)
        end
end
