class LoginController < ApplicationController

  def form
    @new_user = User.new
  end

  def dispatcher
    if session.has_key? :logged_id
      redirect_to '/conferences/home'
    else
      redirect_to '/login/form'
    end
  end

  def sign_in
    @new_user = User.new
    error_msg = 'Booster ID ou mot de passe incorrect'
    user = User.find_by_booster_id params[:booster_id]
    if user
      if user.authenticate params[:password]
        session[:logged_id] = user.id
        redirect_to '/conferences/home'
      else
        @error = error_msg
        render 'login/form'
      end
    else
      @error = error_msg
      render 'login/form'
    end
  end

  def sign_out
    session.clear
    redirect_to '/login/form?disconnected=1'
  end

  def sign_up
    @new_user = User.create params.require(:user).permit(:booster_id, :first_name, :last_name, :password, :password_confirmation)
    if @new_user.errors.count > 0
      @error = @new_user.errors.first[1]
      render 'login/form'
    else
      session[:logged_id] = @new_user.id
      redirect_to '/conferences/home'
    end
  end

end
