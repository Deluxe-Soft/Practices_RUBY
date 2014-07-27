class NWD
  n = gets.chomp.to_i
  m=[]
  (1..n).each do
    number=gets.chomp
    m<<number.split(" ")
  end
  i=0
  while i<m.length
    array=m[i]
    a=array[0].to_i
    b=array[1].to_i
    nwd(a,b)
    i+=1
  end
  def nwd(a,b)
    a, b = b, a if a<b
    loop do
      r = a%b
      if r ==0
        puts b
      else
        a,b = b,r
      end
    end
  end
end
