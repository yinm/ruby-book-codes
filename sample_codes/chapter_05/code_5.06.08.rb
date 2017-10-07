h = {}
h[:foo] #=> nil


# キーがなければ'hello'を返す
h = Hash.new('hello')
h[:foo] #=> 'hello'


h = Hash.new('hello')
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"

# 変数aと変数bは同一オブジェクト
a.equal?(b) #=> true

# 変数aに破壊的な変更を適用すると、変数bの値も一緒に変わってしまう
a.upcase!
a #=> "HELLO"
b #=> "HELLO"

# ちなみにハッシュ自身は空のままになっている
h #=> {}


# キーが見つからないとブロックがその都度実行され、ブロックの戻り値が初期値になる
h = Hash.new { 'hello' }
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"

# 変数aと変数bは異なるオブジェクト（ブロックの実行時に毎回新しい文字列が作成される）
a.equal?(b) #=> false

# 変数aに破壊的な変更を適用しても、変数bの値は変わらない
a.upcase!
a #=> "HELLO"
b #=> "hello"

# ハッシュは空のまま
h #=> {}


# 初期値を返すだけでなく、ハッシュに指定されたキーと初期値を同時に設定する
h = Hash.new { |hash, key| hash[key] = 'hello' }
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"

# ハッシュにキーと値が追加されている
h #=> {:foo=>"hello", :bar=>"hello"}
