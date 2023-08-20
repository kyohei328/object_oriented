
# 3の倍数は"らんて"を出力
# 5の倍数は"くん"を出力
# 3と5の公倍数は"らんてくん"を出力

count = ARGV[0].to_i

number = 1
count.times do

    if number % 3 == 0 && number % 5 == 0
        puts "らんてくん"
    elsif number % 3 == 0
        puts "らんて"
    elsif number % 5 == 0
        puts "くん"
    else
        puts number
    end

    number += 1
end

# ------解答---------------------

# arg = ARGV[0].to_i

# 1.upto(arg) do |num|
#   if num % 15 == 0
#     p "らんてくん"
#   elsif num % 3 == 0
#     p "らんて"
#   elsif num % 5 == 0
#     p "くん"
#   else
#     p num
#   end
# end

