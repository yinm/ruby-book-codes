puts "Line 1,
Line 2"
#=> Line 1,
#   Line 2

puts 'Line 1,
Line 2'
#=> Line 1,
#   Line 2


a = <<TEXT
これはヒアドキュメントです。
複数行に渡る長い文字列を作成するのに便利です。
TEXT
puts a
#=> これはヒアドキュメントです。
#   複数行に渡る長い文字列を作成するのに便利です。


# ヒアドキュメントの識別子としてHTMLを使う場合
<<HTML
<div>
  <img src="sample.jpg">
</div>
HTML


def some_method
  <<-TEXT
これはヒアドキュメントです。
<<-を使うと最後の識別子をインデントさせることができます。
  TEXT
end

puts some_method
#=> これはヒアドキュメントです。
#   <<-を使うと最後の識別子をインデントさせることができます。


def some_method
  <<~TEXT
    これはヒアドキュメントです。
    <<~を使うと内部文字列のインデント部分が無視されます。
  TEXT
end

puts some_method
#=> これはヒアドキュメントです。
#   <<~を使うと内部文字列のインデント部分が無視されます。


name = 'Alice'
a = <<TEXT
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a
#=> ようこそ、Aliceさん！
#   以下のメッセージをご覧ください。


name = 'Alice'
a = <<'TEXT'
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a
#=> ようこそ、#{name}さん！
#   以下のメッセージをご覧ください。


name = 'Alice'
a = <<"TEXT"
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a
#=> ようこそ、Aliceさん！
#   以下のメッセージをご覧ください。


# ヒアドキュメントを直接引数として渡す（prependは渡された文字列を先頭に追加するメソッド）
a = 'Ruby'
a.prepend(<<TEXT)
Java
PHP
TEXT
puts a
#=> Java
#   PHP
#   Ruby

# ヒアドキュメントで作成した文字列に対して、直接`upcase`メソッドを呼び出す
b = <<TEXT.upcase
Hello,
Good-bye.
TEXT
puts b
#=> HELLO,
#   GOOD-BYE.
