require 'bigdecimal'

input_num = gets.to_i
water = 0.0
coffiee = 0.0
(0..input_num - 1).each do |i|
  line = gets.chomp.split("\s")
  if line[0] == "1"
    water += line[1].to_f
  elsif line[0] == "2"
    coffiee += line[1].to_f
  else
    sumDrink = water + coffiee
    # 切り捨て
    water = BigDecimal((water - water * line[1].to_f / sumDrink).to_s).floor(1).to_f
    coffiee = BigDecimal((coffiee - coffiee * line[1].to_f / sumDrink).to_s).floor(1).to_f
  end
end

puts BigDecimal(((coffiee * 100) / (water + coffiee)).to_s).floor(1).to_i
