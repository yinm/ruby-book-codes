s = 'Hello'
n = 123 * 2


# 変数を宣言する目的で変数名だけ書くと、エラーになる
x #=> NameError: undefined local variable or method `x' for main:Object

# 変数を宣言するには何かしらの値を代入する必要がある
x = nil


# 変数名はスネークケースで書く
special_price = 200

# キャメルケースは使わない（エラーにはならないが一般的ではない）
specialPrice = 200


# アンダースコアで変数名を書き始める（あまり使われない）
_special_price = 200

# 変数名に数字を入れる
special_price_2 = 300

# 数字から始まる変数名は使えない（エラーになる）
2_special_price = 300
#=> SyntaxError: trailing `_' in number
#   2_special_price = 300
#     ^


# 変数名を漢字にする（一般的ではない）
特別価格 = 200
特別価格 * 2   #=> 400


# 同じ変数に文字列や数値を代入する（良いコードではないので注意）
x = 'Hello'
x = 123
x = 'Good-bye'
x = 456


# 2つの値を同時に代入する
a, b = 1, 2
a #=> 1
b #=> 2

# 右辺の数が少ない場合はnilが入る
c, d = 10
c #=> 10
d #=> nil

# 右辺の数が多い場合ははみ出した値が切り捨てられる
e, f = 100, 200, 300
e #=> 100
f #=> 200


# 2つの変数に同じ値を代入する
a = b = 100
a #=> 100
b #=> 100
