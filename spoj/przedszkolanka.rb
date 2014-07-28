class Przedszkolanka
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
    puts a.lcm(b)
    i+=1
  end
end