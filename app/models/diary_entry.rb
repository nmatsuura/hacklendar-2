class DiaryEntry < ActiveRecord::Base
	attr_accessible :description, :title, :mood

		validates :title, presence: true, uniqueness: true

		validates :description, presence: true

		validates :mood, :inclusion => { :in => ["happy", "joyful", "exuberant", "sad", "frustrated"]}

		# validates :happy_mon_thurs

		
		def happy_mon_thurs
			if !((Time.now.monday? || Time.now.thursday?) && mood == "happy")
				errors.add(:mood, "must be happy on Monday and Thursday")	
			end
		end


		def happy? #instance method example
			mood == "happy"
		end

		def self.by_mood(mood) #for fetching things out of the db, can use instance method on the fetched items after
			where(mood: mood)
		end



		def self.positive
			where(mood: ['happy', 'joyful', 'exuberant'])
		end

		def self.negative
			where(mood: ['sad', 'frustrated'])
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
			where(created_at: (to_date.beginning_of_day..to_date.end_of_day))
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