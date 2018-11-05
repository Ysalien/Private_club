class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  #Confirm logged in user and limit the access of edit form and user's profile
  def logged_in_user
     unless logged_in?
       flash[:danger] = "Mmh.. that's not your profile"
       redirect_to login_url
     end
   end

   # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
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
    if @user.update(user_params)
      flash[:success] = "Profile updated !"
      redirect_to @user
    else
      flash[:danger] = "Not your profile"
      redirect_to @user
    end
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

  def new
  end

end
