class EventsController<ApplicationController

	def index 
		@resource 	 = Event.all
		@second_column_title  = "created by"
		@proc = Proc.new { |arg| arg.creator.name }
	end

	def show
		@event = Event.find_by(id:params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.create(events_params)
		redirect_to @event
	end

	private
		def events_params
			params.require(:event).permit(:name, :date)
		end
end