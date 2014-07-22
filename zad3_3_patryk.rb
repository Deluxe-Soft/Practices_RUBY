class Zadanie_3_3
  def perfect_number(n)
  	sum= 0
  	i=1
  	while i<n
  		sum +=1 if n%i==0
  		i++
  	end
  	if n==sum
  		puts "its perfect"
  	end
  end
end