class Zadanie_4_3
	def rozklad(n)
		dzielnik = 2
		list =[]
		if n>1
			while n>1
				x=0
				while n%dzielnik==0
					x +=1
					n = n/dzielnik
				end
				list <<[dzielnik,x] if n%dzielnik==0
				x=0
				dzielnik +=1
			end
		end
	end
end

#teoretycznie powinno dzialac


=begin
[[2,1]]
[[2,2]]
[[2,3]]
[[2,3],[3,1]]
[[2,3],[3,2]]
[[2,3],[3,3]]
=end
