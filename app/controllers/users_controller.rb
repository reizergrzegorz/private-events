class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @created_events = Event.where(creator_id: @user.id).all
        @attended_events = @user.attended_events.all
    end

end
