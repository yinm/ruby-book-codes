a = 'abc'
b = 'abc'
a.equal?(b) #=> false

c = a
a.equal?(c) #=> true


1 == 1.0 #=> true


1.eql?(1.0) #=> false


text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end
#=> 電話番号です


/\A\d{3}-\d{4}\z/ === text


/\A\d{4}\/\d{1,2}\/\d{1,2}\z/ === text


value = [1, 2, 3]

# 内部的には String === value、Array === value、Hash === valueの結果が評価されている
case value
when String
  puts '文字列です'
when Array
  puts '配列です'
when Hash
  puts 'ハッシュです'
end
#=> 配列です
