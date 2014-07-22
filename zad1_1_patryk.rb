class Zadanie_1
	def liczbaDniDoSylwestra(dzien, miesiac, rok)
		wynik += (dzien-1)
		(1..(miesiac-1)).each do |dni|
			wynik+= liczbaDniMiesiaca(dni)
		end
		wynik += (365*(wartosc_bezwzgledna(rok-2010)))
		
	end


	def wartosc_bezwzgledna(x)
		x if x >= 0
		-x if x < 0
	end

	def liczbaDniMiesiaca(miesiac)
		liczbaDni = case miesiac
			when 1 
				31
			when 2
				if rok%4==0
					29
				else 
					28
				end
			when 3
				31
			when 4
				30
			when 5
				31
			when 6
				30
			when 7
				31
			when 8
				31
			when 9
				30
			when 10
				31
			when 11
				30
			else 12
				31
		end
		liczbaDni
	end

	liczbaDniDoSylwestra(21, 10, 2012)
end

