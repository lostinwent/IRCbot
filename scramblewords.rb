class Scrambled
	LIST = [{ "o p l a j k c" 	=> ["polka", "cloak", "jalop", "plack"]
						"t u a z r e" 		=> ["auzre", "urate"]
						"a l z p l m e" 	=> ["ample", "lapel", "maple"]}]

	attr_accessor

	def initialize ()
		@characters = LIST.sample

	end

	#setter
	def characters(val)
		@characters = val
	end


	#user input a word
	def guess
		if word_has?()
	end
end

