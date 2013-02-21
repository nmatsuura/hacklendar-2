class DiaryEntriesController < ApplicationController

	def new
		@diary_entry = DiaryEntry.new
	end

	def index
		@diary_entries = DiaryEntry.all
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
		@diary_entry = DiaryEntryfind(params[:id])

		@diary_entry.destroy
			redirect_to diary_entries_path
	end

end
