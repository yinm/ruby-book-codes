foods = ['ピーマン', 'トマト', 'セロリ']
foods.each do |food|
  print "#{food}は好きですか？ => "
  # sampleは配列からランダムに1要素を取得するメソッド
  answer = ['はい', 'いいえ'].sample
  puts answer

  # はいと答えなければもう一度聞き直す
  redo unless answer == 'はい'
end
#=> ピーマンは好きですか？ => いいえ
#   ピーマンは好きですか？ => いいえ
#   ピーマンは好きですか？ => はい
#   トマトは好きですか？ => はい
#   セロリは好きですか？ => いいえ
#   セロリは好きですか？ => はい


foods = ['ピーマン', 'トマト', 'セロリ']
count = 0
foods.each do |food|
  print "#{food}は好きですか？ => "
  # わざと「いいえ」しか答えないようにする
  answer = 'いいえ'
  puts answer

  count += 1
  # やり直しは2回までにする
  redo if answer != 'はい' && count < 2

  # カウントをリセット
  count = 0
end
#=> ピーマンは好きですか？ => いいえ
#   ピーマンは好きですか？ => いいえ
#   トマトは好きですか？ => いいえ
#   トマトは好きですか？ => いいえ
#   セロリは好きですか？ => いいえ
#   セロリは好きですか？ => いいえ
