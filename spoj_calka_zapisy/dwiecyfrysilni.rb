class Dwiecyfrysilni
  n = gets.chomp.to_i
  raise if n<1 or n>30
  puts '0 1' if n<=1
  m=[]
  (1..n).each do
    number=gets.chomp.to_i
    raise if number<0 or number>1000000000
    m<<number
  end
  m.each do |number|
    if number>=10
      puts '0 0'
    else
      acc=1
      2.upto(number) do |iterator|
        acc = acc*iterator
        acc=acc%100
      end
      units=acc%10
      acc = (acc-units)/10
      puts "#{acc} #{units}"
    end
  end
end