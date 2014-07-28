class Graeuklidesa
  n = gets.chomp.to_i
  m=[]
  (1..n).each do
    number=gets.chomp
    m<<number.split
  end
  m.each do |array|
    gracz1 = array[0].to_i
    gracz2 = array[1].to_i
    while gracz1!=gracz2 and gracz1>gracz1-gracz2 and gracz2>gracz2-gracz1
      if gracz1> gracz2 and
        gracz1=gracz1-gracz2
      elsif gracz2>gracz1
        gracz2=gracz2-gracz1
      else
        break
      end
    end
    puts gracz1+gracz2
  end
end