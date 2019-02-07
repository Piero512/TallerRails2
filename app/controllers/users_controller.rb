class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @ratingsUser = Rating.joins(:movie).select('movies.title , ratings.rating')
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def showMovie
    @movies = Movie.all
    #@movie = params[:data]
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :pass, :dob, :plan, :city, :country)
    end
end
