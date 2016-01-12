class ConferencesController < ApplicationController

  def home
    @conferences = Conference.where('event_date > ?', DateTime.now)
  end

  def details
    @conference = Conference.find_by_id(params[:id])
    unless @conference
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def toggle_attend
    @conference = Conference.find_by_id(params[:id])
    if @conference.reservations.where(user: @logged_user).count == 0
      Reservation.create user: @logged_user, conference: @conference
    else
      Reservation.where(user_id: @logged_user.id, conference: @conference)[0].delete
    end
    redirect_to "/conferences/#{params[:id]}"
  end

end
