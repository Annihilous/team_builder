module MembersHelper

	def team_assign(size)
		members = Member.all
		pool = []
		members.each do | member |
			pool.push(member.id)
		end
		pool.shuffle!

		size = size.to_i
		
		teams = pool.length / size
		leftover = pool.length % size


		team_it = 1
		teams.times do
			size.times do
				#Member.find(pool[0]).team = team_it
				x = Member.find(pool[0])
				x.team = team_it
				x.save
				pool.shift	
			end
			team_it += 1
		end
	end
end
