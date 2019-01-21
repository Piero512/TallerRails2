class Top10Controller < ApplicationController
    def index
      @top10 = Rating.joins(:movie).select('movies.title , ratings.rating').order("ratings.rating DESC").limit(10)
    end
  end
  