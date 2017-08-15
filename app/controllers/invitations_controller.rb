class InvitationsController<ApplicationController
	def new
	end

	def create
		invitation = Invitation.create(invitation_params)
		redirect_to request.referrer
	end

	private
		def invitation_params
			params.require(:invitation).permit(:attendee_id, :attended_event_id)
		end	
end