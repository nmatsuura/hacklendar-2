class DiaryEntriesController < ApplicationController
	def index
		@diary_entries = DiaryEntry.all
		@count = DiaryEntry.count
		@happy = DiaryEntry.positive.count
		@happy_green = DiaryEntry.positive
	end
end
