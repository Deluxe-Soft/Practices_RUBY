class Zadanie_7
  def która_godzina(godzina, minuta)
  	if minuta >=30
  		godzina+1
  		if godzina ==25
  			godzina =1
  		end
  	end
  	if minuta >30
  		"#{przedrostek(minuta)} #{dajminuty(minuta)}  #{dajgodzine(godzina)}"
  	else
  		"#{dajminuty(minuta)} #{przedrostek(minuta)}  #{dajgodzine(godzina)}"
  	end
  end

  def przedrostek(x)
  	if minuta <30
  		"po"
  	elsif minuta ==30
  		"do"
  	else minuta >30
  		"za"
  	end
  end
  def dajgodzine(godzina)
  	case godzina
  	when 1, 13
  		"pierwsza"
  	when 2,14
  		"druga"
  	when 3,15
  		"trzecia"
  	when 4,16
  		"czwarta"
  	when 5,17
  		"piąta"
  	when 6,18
  		"szósta"
  	when 7,19
  		"siódma"
  	when 8,20
  		"ósma"
  	when 9,21
  		"dziewiąta"
  	when 10,22
  		"dziesiąta"
  	when 11,23
  		"jedenasta"
  	else 
  		"dwunasta"
  	end
  end
  def dajminuty(minuta)
  	if minuta%15==0
  		case minuta
	  		when 15
	  			wynik = "kwadrans po "
			when 30
	  			wynik = "wpól "
	  		when 45
	  			wynik = "za kwadrans "
	  	end
  	end
  	case minuta
  	when 1, 59
  		"jeden"
  	when 2, 58
  		"dwa"
  	when 3,57
  		"trzy"
  	when 4,56
  		"cztery"
  	when 5,55
  		"pięć"
  	when 6,54
  		"sześć"
  	when 7, 53
  		"siedem"
  	when 8,52
  		"osiem"
  	when 9,51
  		"dziewięć"
  	when 10,50
  		"dziesięć"
  	when 11,49
  		"jedenaście"
  	when 12, 48
  		"dwanaście"
  	when 13,47
  		"trzynaście"
  	when 14,46
  		"czternaście"
  	when 16,44
  		"szesnaście"
  	when 17,43
  		"siedemnaście"
  	when 18,42
  		"osiemnaście"
  	when 19,41
  		"dziewiętnaście"
  	when 20,40
  		"dwadzieścia"
  	when 21,39
  		"dwadzieścia jeden"
  	when 22, 38
  		"dwadzieścia dwa"
  	when 23, 37
  		"dwadzieścia trzy"
  	when 24, 36
  		"dwadzieścia cztery"
  	when 25, 35
  		"dwadzieścia pięć"
  	when 26, 34
  		"dwadzieścia sześć"
  	when 27, 33
  		"dwadzieścia siedem"
  	when 28,32
  		"dwadzieścia osiem"
  	when 29,31
  		"dwadzieścia dziewięć"
  	end
  end

end

