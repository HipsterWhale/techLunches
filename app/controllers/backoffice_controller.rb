class BackofficeController < ApplicationController

  before_filter :check_if_admin

  def check_if_admin
    unless @logged_user.is_admin
      redirect_to '/conferences/home'
    end
  end

end
