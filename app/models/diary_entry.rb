class DiaryEntry < ActiveRecord::Base
	attr_accessible :description, :title, :mood

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

		def self.month
			where(created_at: ['2013-01-31 22:25:29'])
		end	

end