class Tablice
  n = gets.chomp.to_i
  m = []
  (1..n).each do
    number=gets.chomp
    m<<number.split
    end
  m.each do |array|
  array_rev = []
  array.delete_at(0)
  i = array.length
    while 0<=i
      element = array[i]
      array_rev<<element
      i-=1
    end
    puts array_rev =array_rev.join(" ").lstrip
  end
end