class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by_id(params[:flight_id])
    @booking = @flight.bookings.build
    @seats = params[:seats].to_i
    @seats.times { @booking.passengers.build }
	end

	def create
    flight = Flight.find(params[:booking][:flight_id])
    @booking = flight.bookings.build(booking_params)
    if @booking.save
    	@booking.passengers.each do |passenger|
        PassengerMailer.confirmation_email(passenger).deliver!
      end
      flash[:success] = 'Booking created, check your email for confirmation.'
      redirect_to @booking
    else
      flash.now[:danger] = 'Booking failed.'
      render :new
    end
  end

	def show
		@booking = Booking.find(params[:id])
		@flight = @booking.flight
		@passengers = @booking.passengers
	end

	private
		def booking_params
			params.require(:booking).permit(passengers_attributes: [:name, :email])
		end
end