class EventsController<ApplicationController

	def index 
		@resource 	 = Event.all
		@second_column_title  = "created by"
		@proc = Proc.new { |arg| arg.creator.name }
	end
end