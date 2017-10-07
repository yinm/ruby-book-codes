text = '私の誕生日は1977年7月17日です。'

# =~や===、matchメソッド等を使うとマッチした結果が組み込み変数に代入される
text =~ /(\d+)年(\d+)月(\d+)日/

# MatchDataオブジェクトを取得する
$~ #=> #<MatchData "1977年7月17日" 1:"1977" 2:"7" 3:"17">

# マッチした部分全体を取得する
$& #=> "1977年7月17日"

# 1番目～3番目のキャプチャを取得する
$1 #=> "1977"
$2 #=> "7"
$3 #=> "17"

# 最後のキャプチャ文字列を取得する
$+ #=> "17"
