class Zadanie_5
  def jaka_liczba(slowo)
  		case slowo
		  when "jeden"
		   	1
		  when "dwa"
		   	2
		  when "trzy"
		   	3
		  when "cztery"
		   	4
		  when "pięć"
		   	5
		  when "sześć"
		   	6
		  when "siedem"
		   	7
		  when "osiem"
		    8
		  when "dziewięć"
		    9
		  else "zero"
		    0
		end
		slowo
  	end
  	def zad5(listaslow)
  		while listaslow.length>0
  			wynik = 0
  			wynik =pop.listaslow if wynik ==0
  			wynik += (pop.listaslow*10)
  		end
  	end
end