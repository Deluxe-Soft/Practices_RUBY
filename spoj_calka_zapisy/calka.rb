class Calka
  def integral(a,b,&blok)
    result =0
    totalrange=b-a
    range=totalrange/10000.0
    previous_a=a
    while a<b
      h = blok.call(a)
      result=result+((a-previous_a)*h)
      previous_a=a
      a+=range
    end

    puts result
  end
end
cal = Calka.new
b = lambda{|x| x*x+2*x+2}
cal.integral 1,10,&b


=begin
blok, to funkcja całki
a i b to zakres
dzielimy odcinek aib na ?1000?
obliczamy wysokość w punkcie przecięcia a(x) i funkcji w bloku
liczymy pole kwadratu
=end