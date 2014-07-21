class Zadanie_1
	def liczbadni(dzien, miesiac, rok)
		@dosylw = 365*wartosc_bezwzgledna(rok-2010)
		#boże muszę się nad tym zastanowić
		@liczbaDniMiesiąca = case miesiac
			when 1 then 31
			when 2
				if rok%4==0
					29
				else 
					28
				end
			when 3 then 31
			when 4 then 30
			when 5 then 31
			when 6 then 30
			when 7 then 31
			when 8 then 31
			when 9 then 30
			when 10 then 31
			when 11 then 30
			when 12 then 31
		end
		@dosylw += liczbaDniMiesiąca*(1..(miesiac-1)
		@dosylw += dzien-1
		@dosylw


	def wartosc_bezwzgledna(x)
		return x if x >= 0
		return -x if x < 0
	end
end

