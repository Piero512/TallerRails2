# frozen_string_literal: true

module Movies
  class API < Grape::API
    format :json
    get do
      pelis = Movie.all
    end

    get ':id' do
      params do
        requires :id, type: Integer
      end
      vista = Movie.find(params[:id])
    end
  end
end
