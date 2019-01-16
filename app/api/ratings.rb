module Ratings
    class API < Grape::API
        format :json
        get do
            Rating.all()
        end
        params do
            requires :id, type: Integer, desc: "ID usuario"
        end
        get ':id' do
            begin
                product = Rating.find(params[:id])
            rescue ActiveRecord::RecordNotFound
                error!({ status: :not_found }, 404)
            end
        end
        
        params do
            requires :id, type: Integer, desc: "ID usuario"
        end
        
        get "by/:id" do
            begin
                query = Rating.where(user_id: params[:id])
                unless !query.empty?
                    error!({status: :not_found}, 404)
                end
                present query
            end
        end
        
        
        
        
        put ':id' do 
            begin
                vista = Rating.find(params[:id])
                if vista.update({
                date: params[:date],
                rating: params[:rating],
                user_id: params[:user_id],
                movie_id: params[:movie_id],})
                {status: :success}
            else
                error!({ status: :error, message: vista.errors.full_messages.first }) if product.errors.any?
                        end
        rescue ActiveRecord::RecordNotFound
            error!({status: :error, message: :not_found},404)
        end
        
    end
    
    
end
end
