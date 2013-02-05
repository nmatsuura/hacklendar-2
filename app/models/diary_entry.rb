class DiaryEntry < ActiveRecord::Base
	attr_accessible :description, :title, :mood

		def happy? #instance method example
			mood == "happy"
		end

		def self.by_mood(mood) #for fetching things out of the db, can use instance method on the fetched items after
			where(mood: mood)
		end



		def self.positive
			where(mood: ['happy', 'joyful', 'exuberant'])
		end

	#	def self.positive1
	#		where(mood: 'happy')
	#	end

	#	def self.positive2
	#		where(mood: 'joyful')
	#	end

		def self.recent5
			DiaryEntry.order("created_at desc").limit(5)
		end

	#	def self.month
	#		where(created_at: ['2013-01-* *:*:*'])
	#	end

	#	def self.month
	#		where(created_at: ['2013-01-31 22:25:29'])
	#	end

		def self.month
			where("created_at >'2013-01-01' and created_at <'2013-02-01'")
		end

		def self.month1
			where(created_at: ("2013-01-01".to_date.beginning_of_day.."2013-01-31".to_date.end_of_day))
		end

# practice, bad

		def color
			if mood == "happy"
				"green"
			else
				"black"
			end
		end


end