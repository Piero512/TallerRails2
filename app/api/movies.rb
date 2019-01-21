# frozen_string_literal: true

module Movies
  class API < Grape::API
    format :json
    get do
      pelis = Movie.all
    end
  end
end
