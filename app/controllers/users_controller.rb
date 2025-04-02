class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @created_events = Event.where(creator_id: @user.id).all
        @past_events = @user.attended_events.past
        @upcoming_events = @user.attended_events.upcoming
    end

end
