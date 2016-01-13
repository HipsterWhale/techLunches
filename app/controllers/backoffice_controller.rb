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
