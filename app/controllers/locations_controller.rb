class LocationsController < ApplicationController
    before_action :require_login
    def all_restaurants_in_db
       if params[:query_search] && params[:query_existing] == ""
         @location = Location.search(params[:query_search])
         if @location.sort_by{|obj| obj.id} == Location.all.sort_by{|obj| obj.id}
            @state = "State Not Found - Below Are All Restaurants"
         else
           @state = params[:query_search]
         end
       elsif params[:query_existing] && params[:query_search] == ""
         @location = Location.search(params[:query_existing])
         @state = params[:query_existing]
       else
         @location = Location.search("all")
         @state = "All Results  "
       end
       render 'all_restaurants_in_db'
     end

     def restaurant_params
       params.require(:location).permit(:query_search, :query_existing, :city, :state)
     end
   end
