# 任意の文字列の奇数番目、偶数番目の文字をそれぞれ取り出し、それぞれを連結する
# ruby hoge.rb あらるんごてりくずんむ -> あるごりずむらんてくん

arg = ARGV[0]

odd_letter = ""
even_letter = ""
count = 1
arg.length.times do |num|
    if count.odd?
        odd_letter << arg.slice(num)
    else
        even_letter << arg.slice(num)
    end
    count += 1
end

puts odd_letter + even_letter

# ---------解答--------------------

# arg = ARGV[0]
# i = arg.length
# j = 0
# array1 = []
# array2 = []

# while j < i do
#   d = arg.split('')
#   if j % 2 == 0
#     array1 << d[j]
#   elsif j % 2 == 1
#     array2 << d[j]
#   end
#   j += 1
# end

# p array1.concat(array2).join