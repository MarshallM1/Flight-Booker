class PassengerMailer < ApplicationMailer
	default from: 'no-reply@flightbooker.com'

	def confirmation_email(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: 'Flight Booking Confirmation')
  end
end
