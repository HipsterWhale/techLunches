class BackofficeController < ApplicationController

  before_filter :check_if_admin

  def check_if_admin
    unless @logged_user.is_admin
      redirect_to '/conferences/home'
    end
  end

  def new_conference
    @conference = Conference.new
    render 'backoffice/form'
  end

  def edit
    @conference = Conference.find(params[:id])
    render 'backoffice/form'
  end

  def feedbacks
    @conference = Conference.find(params[:id])
  end

  def reservations
    @conference = Conference.find(params[:id])
  end

  def delete_reservation
    Reservation.find(params[:id]).delete
    redirect_to '/backoffice/home?success=1'
  end

  def delete_suggestion
    TopicSuggestion.find(params[:id]).delete
    redirect_to '/backoffice/home?success=1'
  end

  def add_admin
    u = User.find_by_booster_id(params[:booster_id])
    u.is_admin = true
    u.save
    redirect_to '/backoffice/home?success=1'
  end

  def revoke_admin
    if User.where(is_admin: true).count > 1
      u = User.find(params[:id])
      u.is_admin = false
      u.save
      redirect_to '/backoffice/home?success=1'
    else
      redirect_to '/backoffice/home?error=last_admin'
    end
  end

  def create
    begin
      @conference = Conference.create(params.require(:conference).permit(:title, :subtitle, :speaker, :event_date, :description, :sits))
      redirect_to '/backoffice/home'
    rescue
      @conference = Conference.new(params.require(:conference).permit(:title, :subtitle, :speaker, :event_date, :description, :sits))
      @error = true
      render 'backoffice/form'
    end
  end

  def update
    @conference = Conference.find(params[:id])
    @conference.update(params.require(:conference).permit(:title, :subtitle, :speaker, :event_date, :description, :sits))
    redirect_to '/backoffice/home'
  end

end
