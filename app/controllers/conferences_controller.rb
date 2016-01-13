class ConferencesController < ApplicationController

  def home
    @conferences = Conference.where('event_date > ?', DateTime.now).order(created_at: :desc)
  end

  def details
    @conference = Conference.find_by_id params[:id]
    unless @conference
      raise ActionController::RoutingError.new 'Not Found'
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

  def feedback
    begin
      @reservation = Reservation.where(user: @logged_user).order(created_at: :desc).first
      if @reservation.conference.event_date < DateTime.now
      else
        @reservation = nil
      end
    rescue
      @reservation = nil
    end
  end

  def feedback_update
    @reservation =  Reservation.where(user: @logged_user).order(created_at: :desc).first
    @reservation.feedback = params[:feedback]
    @reservation.save
    @updated = true
    render 'conferences/feedback'
  end

end
