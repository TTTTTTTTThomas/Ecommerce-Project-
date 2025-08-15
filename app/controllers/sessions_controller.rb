class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_dashboard_index_path, notice: 'Logged in as admin.'
    else
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in as user.'
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new
      end
    end
  end

  def destroy
    session[:admin_id] = nil
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out.'
  end

end
