# frozen_string_literal: true

module Ratings
  class API < Grape::API
    format :json
    get do
      Rating.all
    end
    params do
      requires :id, type: Integer, desc: 'ID usuario'
    end
    get ':id' do
      begin
        product = Rating.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        error!({ status: :not_found }, 404)
      end
    end

    params do
      requires :id, type: Integer, desc: 'ID usuario'
    end

    get 'by/:id' do
      begin
        query = Rating.where(user_id: params[:id])
        error!({ status: :not_found }, 404) if query.empty?
        present query
      end
    end

    put ':id' do
      begin
        vista = Rating.find(params[:id])
        if vista.update(
          rating: params[:rating],
          user_id: params[:user_id],
          movie_id: params[:movie_id]
        )
          { status: :success }
        else
          error!(status: :error, message: vista.errors.full_messages.first) if vista.errors.any?
        end
      rescue ActiveRecord::RecordNotFound
        error!({ status: :error, message: :not_found }, 404)
      end
    end
    post do
      params do
        requires :rating, type: Integer, desc: 'Rating de la pelicula', values: (1..10)
        requires :user_id, type: Integer, desc: 'UserID'
        requires :movie_id, type: Integer, desc: 'MovieID'
      end
      rate = Rating.create(
        rating: params[:rating],
        user_id: params[:user_id],
        movie_id: params[:movie_id]
      )
      if rate.valid?
        { status: :success }
      else
        error!(status: :error, message: rate.errors.full_messages.first) if rate.errors.any?
      end
    end

  end
end
