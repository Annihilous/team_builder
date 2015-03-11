module MembersHelper

	def team_assign(size)
		members = Member.all
		pool = []
		members.each do | member |
			pool.push(member)
		end
		pool.shuffle!

		size = size.to_i
		
		teams = pool.length / size
		leftover = pool.length % size

		if size > pool.length

			Member.find(pool[0].id).leader = true
			members.each do | member |
				member.team = 1
			end
		end


		team_it = 1
		teams.times do
			leadership = 0
			size.times do
				x = Member.find(pool[0].id)
				x.team = team_it
				if leadership == 0
					x.leader = true
				else
					x.leader = false
				end
				x.save
				pool.shift
				leadership = 1
			end
			team_it += 1
		end

		if size / 2 < leftover
			leadership = 0
			pool.each do | member |
				member.team = team_it
				if leadership == 0
					member.leader = true
				else
					member.leader = false
				end
				member.save
				leadership = 1
			end
		else
			leftover_it = 1
			pool.each do | member |
				member.team = leftover_it
				member.save
				leftover_it += 1
			end
		end
	end
end
