class Najdluzszywspolnypodciag
  n = gets.chomp.to_i
  n*=4
  m=Array.new
  i=1
  (1..n).each do
    number=gets.chomp
    m<<number.split if i%2==0
    i+=1
  end
  i=1
  n=0
  while i<m.length
    wordsarray=m.first(2)
    m.shift(2)
    word1=wordsarray[0].to_s
    word2=wordsarray[1].to_s
    result =Array.new(word1.length){[0]*word2.length}
    if word1.empty? or word2.empty?
      puts n
    else
      longest_length,position = 0,0
      (0..word1.length-1).each do |a|
        (0..word2.length-2).each do |b|
          if word1[a]==word2[b]
            result[a][b] = 1
            if(a>0 and b>0)
              result[a][b]+=result[a-1][b-1]
            end
            if result[a][b] >longest_length
              longest_length=result[a][b]
              position= a
            end
          end
        end
      end
      puts word1[position-longest_length+1 .. position].length
    end
  end
end