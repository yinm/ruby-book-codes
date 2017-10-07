'これは文字列です。'
"これも文字列です。"


# ダブルクオートで囲むと\nが改行文字として機能する
puts "こんにちは\nさようなら"
#=> こんにちは
#   さようなら

# シングルクオートで囲むと\nはただの文字列になる
puts 'こんにちは\nさようなら'
#=> こんにちは\nさようなら


name = 'Alice'
puts "Hello, #{name}!" #=> Hello, Alice!

i = 10
puts "#{i}は16進数にすると#{i.to_s(16)}です" #=> 10は16進数にするとaです


name = 'Alice'
puts 'Hello, #{name}!' #=> Hello, #{name}!


name = 'Alice'
puts 'Hello, ' + name + '!' #=> Hello, Alice!


puts "こんにちは\\nさようなら" #=> こんにちは\nさようなら

name = 'Alice'
puts "Hello, \#{name}!" #=> Hello, #{name}!


puts 'He said, "Don\'t speak."'  #=> He said, "Don't speak."

puts "He said, \"Don't speak.\"" #=> He said, "Don't speak."
