class EventsController < ApplicationController

    before_action :authenticate_user!, except: :index

    def index
        @event = Event.all
    end 
    
    def new 
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        @event.creator = current_user

        if @event.save
            redirect_to events_path
        else 
            render :new, status: :unprocessable_entity
        end
    end

    private

    def event_params
        params.require(:event).permit(:location, :date)
    end
end


