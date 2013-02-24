class DiaryEntriesController < ApplicationController

	def new
		@diary_entry = DiaryEntry.new
	end

	def index

		if params[:day]
			@day = params[:day].to_date
		else
			@day = Date.today
		end
		
		#@day = params[:day].to_date

 		@diary_entries = DiaryEntry.where(created_at: @day.beginning_of_day..@day.end_of_day)

 		@month_entries = DiaryEntry.where(created_at: @day.beginning_of_month..@day.end_of_month)

 		@checkmark = @month_entries.map do |i|
 			i.created_at.to_date
 		end

 		@positive = DiaryEntry.where(mood: ['happy', 'joyful', 'exuberant'])
 		@happy_face = @positive.map do |j|
 			j.created_at.to_date
 		end

 		@negative = DiaryEntry.where(mood: ['sad', 'frustrated'])
 		@sad_face = @negative.map do |k|
 			k.created_at.to_date
 		end

 	#	@diary_entries = DiaryEntry.all
		@count = DiaryEntry.count
		@happy = DiaryEntry.positive.count
		@happy_green = DiaryEntry.positive
	end


#	def create
#		DiaryEntry.create params["diary_entry"]
#		redirect_to diary_entries_path
#	end

	def create
			@diary_entry = DiaryEntry.new params[:diary_entry]

			if @diary_entry.save
				redirect_to diary_entries_path
			else
				render :new

			end
	end

	def edit
		@diary_entry = DiaryEntry.find(params[:id])
	end

	def update
		@diary_entry = DiaryEntry.find(params[:id])

		if @diary_entry.update_attributes params[:diary_entry]
			redirect_to diary_entries_path
		else
			render :edit
		end
	end

	def destroy
		@diary_entry = DiaryEntry.find(params[:id])

		@diary_entry.destroy
			redirect_to diary_entries_path
	end

	def show
		@diary_entry = DiaryEntry.find(params[:id])
	end

end
