module MembersHelper

	def team_assign(size)
		members = Member.all
		pool = []
		members.each do | member |
			pool.push(member)
		end
		pool.shuffle!

		size = size.to_i

		if size == 0
			size = 1
		end
		
		teams = pool.length / size
		leftover = pool.length % size

		team_it = 1
		total_teams = 0


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

			total_teams = team_it -1
			
			if leftover > size / 2
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
				team_it = 1
				leftover.times do
					x = Member.find(pool[0].id)
					x.team = team_it
					x.leader = false
					x.save
					pool.shift
					if team_it < teams
						team_it += 1
					else
						team_it = 1
					end
				end
			end


		return total_teams
	end
end
