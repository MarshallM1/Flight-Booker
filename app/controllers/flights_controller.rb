class FlightsController < ApplicationController
	def index
		@airports=Airport.all
		@flight_dates = Flight.pluck(:departure_date).map(&:to_date).uniq.sort
		unless params[:flight].nil?
			origin_id = params[:flight][:origin_id]
			destination_id = params[:flight][:destination_id]
			departure = params[:flight][:departure_date].to_date
			@flights = Flight.where("origin_id = ? AND destination_id = ? AND
                departure_date BETWEEN ? AND ?",
                origin_id, destination_id,
                departure.at_midnight, departure.at_end_of_day)

			respond_to do |format|
         format.html
         format.js
      end
		end
	end
end