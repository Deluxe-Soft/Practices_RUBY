class Liczbypierwszespoj
  n = gets.chomp.to_i
  m=[]
  (1..n).each do
    number=gets.chomp.to_i
    m<<number
  end
  m.each do |number|
    ble = true
    sqrt_number = Math.sqrt number
    # puts 'NIE' if number<2
    # puts 'TAK' if number==2
    if number<2
      puts 'NIE'
    elsif number==2
      puts 'TAK'
    else
      2.upto(sqrt_number) do |foo|
        if number%foo ==0
          puts 'NIE'
          ble = false
          break
        end
      end
      if ble
        puts 'TAK'
      end
    end
  end
end


#kurwa mać jak to zły wynik ?!
