class Flamaster
  n = gets.chomp.to_i
  raise if n<1 or n>50
  m=[]
  (1..n).each do
    word=gets.chomp.upcase
    raise if word.length>200
    m<<word
  end
  m.each do |word|
    array_word=word.split("")
    previous =""
    acc = 1
    result =""
    counter =0
    array_word.each do |index|
      counter+=1
      if previous==index
        acc+=1
      else
        if acc>2
          result<<"#{previous}#{acc}"
          acc=1
        elsif acc==2
          result<<"#{previous*2}"
          acc=1
        else
          result<<"#{previous}"
        end
      end
      if counter == array_word.length
        if acc>2
          result << "#{previous}#{acc}"
        elsif acc==2
          result << "#{previous*2}"
        else
          result << "#{index}"
        end
      end
      previous=index
    end
    puts result
  end
end