# 英文を単語別に分け、各単語のアルファベット数を先頭からの単語順の配列で出力する。 カンマとピリオドは含めない
# ruby hoge.rb "Things may come to those who wait, but only the things left by those who hustle."
# [6,3,4,2,5,3,4,3,4,3,6,4,2,5,3,6]

arg = ARGV[0]

arry = arg.split(/[\s,\.]+/)
word_count = []

arry.size.times do |num|
    word_count.push(arry[num].size)
end

p word_count
p arg.delete(',.').split

# ---------解答--------------

# arg = ARGV[0]

# p arg.delete(',.').split.map{ |w| w.length }

