n = 11
if n > 10
  '10より大きい'
else
  '10以下'
end
#=> "10より大きい"

# ----------------------------------------

country = 'italy'
if country == 'japan'
  'こんにちは'
elsif country == 'us'
  'Hello'
elsif country == 'italy'
  'ciao'
else
  '???'
end
#=> "ciao"

# ----------------------------------------

country = 'italy'
greeting =
  if country == 'japan'
    'こんにちは'
  elsif country == 'us'
    'Hello'
  elsif country == 'italy'
    'ciao'
  else
    '???'
  end
greeting #=> "ciao"

# ----------------------------------------

point = 7
day = 1
# 1日であればポイント5倍
if day == 1
  point *= 5
end
point #=> 35

# ----------------------------------------

point = 7
day = 1
# 1日であればポイント5倍（if修飾子を利用）
point *= 5 if day == 1
point #=> 35

# ----------------------------------------

country = 'italy'
if country == 'japan' then 'こんにちは'
elsif country == 'us' then 'Hello'
elsif country == 'italy' then 'ciao'
else '???'
end
#=> "ciao"
