# aとbはどちらも同じ文字列だが、オブジェクトとしては別物
a = 'hello'
b = 'hello'
a.object_id #=> 70182231931400
b.object_id #=> 70182236321960

# cにbを代入する。bとcはどちらも同じオブジェクト
c = b
c.object_id #=> 70182236321960

# メソッドの引数にcを渡す。引数として受け取ったdはcと同じオブジェクト
def m(d)
  d.object_id
end
m(c)        #=> 70182236321960

# equal?メソッドを使ってもよい（trueなら同じオブジェクト）
a.equal?(b) #=> false
b.equal?(c) #=> true


# b、cは同じオブジェクト、aは異なるオブジェクト
a = 'hello'
b = 'hello'
c = b

# 渡された文字列を破壊的に大文字に変換するメソッドを定義する
def m!(d)
  d.upcase!
end

# cにm!メソッドを適用する
m!(c)

# b、cはいずれも大文字になる
b #=> "HELLO"
c #=> "HELLO"

# aは別のオブジェクトので大文字にならない
a #=> "hello"
