class EventsController < ApplicationController

    before_action :authenticate_user!, except: :index

    def index
        @upcoming = Event.upcoming
        @past = Event.past
    end 
    
    def new 
        @event = Event.new
    end
    
    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to events_path
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @event = Event.find(params[:id])
    end 
    
    def attend
        @event = Event.find(params[:id])
        
        # Prevent user from attending the event more than once
        if @event.attendees.exclude?(current_user)
          @event.attendees << current_user
          flash[:notice] = "You are now attending this event."
        else
          flash[:alert] = "You are already attending this event."
        end
    
        redirect_to events_path
      end
    private

    def event_params
        params.require(:event).permit(:title, :location, :date)
    end
end


