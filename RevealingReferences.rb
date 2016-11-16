class RevealingReferences
	attr_reader :something, :somethingElse
	def initialize(something, somethingElse)
		@something = Creator_of_things(something)
		@somethingElse = Creator_of_things(somethingElse)
	end
