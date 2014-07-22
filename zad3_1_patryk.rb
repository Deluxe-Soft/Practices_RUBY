class Zadanie_3
	def numberOfDays (data1, data2)
		if data2[2]>=data1[2] and data2[1]>=data1[1] and data2[0]>=data1[0]
			unless data1[0]==data2[0] and data1[1]==data2[1] and data1[2]==data2[2]
				while data1[0]>=1
					data1[0]-=1
					count +=1
					if data1[0]==0
						if data1[1]>1
							data1[1] -=1
							data1[0] = liczbadnimiesiaca(data1[1])
						else
							data1[2] -=1
							data1[1] =12
						end
					end
				end
			end
		else
			unless data1[0]==data2[0] and data1[1]==data2[1] and data1[2]==data2[2]
				while data2[0]>=1
					data2[0]-=1
					count +=1
					if data2[0]==0
						if data2[1]>1
							data2[1] -=1
							data2[0] = liczbadnimiesiaca(data1[1])
						else
							data2[2] -=1
							data2[1] =12
						end
					end
				end
			end
		end

	end
	def liczbadnimiesiaca(miesiac)
    liczbadni = case miesiac
                  when 1
                    31
                  when 2
                    if rok%4==0
                      29
                    else
                      28
                    end
                  when 3
                    31
                  when 4
                    30
                  when 5
                    31
                  when 6
                    30
                  when 7
                    31
                  when 8
                    31
                  when 9
                    30
                  when 10
                    31
                  when 11
                    30
                  else 12
                  31
                end
    liczbadni
  end
end