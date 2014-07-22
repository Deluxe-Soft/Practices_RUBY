class Zadanie_4
  def zapis_liczby_sowami(edward)
  	wynik = ""
  	liczba_na_liste(edward).each {|x| wynik = wynik+jakie_slowo(x)}
  	wynik
  end

  def liczba_na_liste (liczba)
  	lista_liczb =[]
  	while liczba > 10 
  	  lista_liczb << (liczba%10)
  	  liczba/10
  	end
  	lista_liczb.reverse
  	lista_liczb
  end
  	def jakie_slowo(slowo)
  		case slowo
		  when 1
		   	"jeden "
		  when 2
		   	"dwa "
		  when 3
		   	"trzy "
		  when 4
		   	"cztery "
		  when 5
		   	"pięć "
		  when 6
		   	"sześć "
		  when 7
		   	"siedem "
		  when 8
		    "osiem "
		  when 9
		    "dziewięć "
		  else 0
		    "zero "
		end
		slowo
  	end
end

