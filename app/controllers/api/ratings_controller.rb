class Api::RatingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.joins(:movie).select('movies.id , movies.title , ratings.rating').where(user: 1)
    render json: @ratings
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    render json: @rating
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(:user_id => 1,:movie_id => params[:idMovie].to_i, :rating => params[:rating].to_i)
    if @rating.save
      puts "Creado"
    else
      puts "Error" 
    end
    redirect_to root_path
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def edit
    if @rating.update(rating: params[:rating].to_i)
      puts "Actualizado" 
    else
      puts "Error"
    end
    redirect_to root_path
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
