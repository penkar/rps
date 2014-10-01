module RPS
	class Game < ActiveRecord::Base
		belongs_to :player1, :foreign_key => 'player1', :class_name => 'RPS::User'
		belongs_to :player2, :foreign_key => 'player2', :class_name => 'RPS::User'

		def self.play(x,y)
			return 'tie' if x == y
			return 'p1 win' if (x == 'paper' && y =='rock') || (x == 'rock' && y =='scissors') || (x == 'scissors' && y =='paper')
			return 'p1 loss'
		end
	end
end	

		# def self.play(x,y)
		# 	beats = {
		# 	 :scissors => :rock,
		# 	 :paper => :scissors,
		# 	 :rock => :paper
		# 	}

		# 	if p1_move == beats[p2_move]
		# 	 "p1 wins"
		# 	elsif p2_move == beats[p1_move]
		# 	 "p2 wins"
		# 	else
		# 	 "tie"
		# 	end
		# end