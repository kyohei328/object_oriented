# 任意の文字列の順番を逆にした文字列を出力する(sortメソッドは使わない)
# ruby hoge.rb QETNUR -> RUNTEQ

arg = ARGV[0]

msg = ""
(arg.size - 1).downto(0) do |num|
    msg << arg.slice(num)
end

puts msg

# ----------解答---------------

# arg = ARGV[0]
# i = arg.length - 1
# j = 0
# letters = []

# while (i >= 0) do
#   letters[j] = arg[i]
#   i -= 1
#   j += 1
# end

# p letters.join