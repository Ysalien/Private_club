class SessionsController < ApplicationController
  before_action :current_user, only: [:edit, :update]

  def new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_id)
    @user.update(gossip_params)
    flash[:success] = "Informations saved"
    redirect_to "/sessions/#{current_user[:id]}%>"
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Logged in"
      log_in user #use method from helpers - temporary cookie
      redirect_to root_url
    else
       flash[:danger] = 'Invalid email or password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #method from helpers
    flash[:success] = 'Logged out'
    redirect_to '/'
  end
end
