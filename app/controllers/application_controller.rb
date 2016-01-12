class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :load_connected_user

  def load_connected_user
    if params[:controller] != 'login'
      if session.has_key? :logged_id
        @logged_user = User.find session[:logged_id]
        unless @logged_user
          redirect_to 'login/form'
        end
      else
        redirect_to 'login/form'
      end
    end
  end

end
