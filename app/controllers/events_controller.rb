class EventsController < ApplicationController

    def index
        Event.all
    end    
end


