class Api::RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.joins(:movie).select('movies.id , movies.title , ratings.rating').where(user: 2)
    @user = User.find(2)
    render json: @ratings
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    render json: @rating
  end

  # GET /ratings/new

#  def new
#    @rating = Rating.new
#    @users = User.all
#    @movies = Movie.all
#  end
  

  # GET /ratings/1/edit
#  def edit
#    @users = User.all
#    @movies = Movie.all
#  end

# POST /ratings
  # POST /ratings.json
  def create
    @movie = Movie.find(params[:idMovie])
    @rating = Rating.new
    @rating.rating = params[:rating].to_i
    @rating.user = @user
    @rating.movie = @movie
    if @rating.save
      render :json => @rating , :status => create , :location => @rating 
    else
      render json: @rating.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def edit
    if @rating.update(:rating => params[:rating])
      render json: show, status: :ok, location: @rating 
    else
      render json: @rating.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

end
