# 特に使用しないけど値として入力されているので取得
input_num = gets.to_i

# 値の格納
square = []
(gets.chomp.split("\s")).each do |str|
  square << str.to_i
end

# yes, noのリストを先に作成
resultList = []
max_length = square.length - 1
# 100回(case max)行ってできなければNo
max_try = 100
(0..max_length).each do |i|
  if i == 0 || i == max_length
    resultList << (i == 0 ? "No" : "Yes")
    next
  end

  squareIndex = i
  squareValue = square[squareIndex]
  try_count = 0
  while squareValue != 0 do
    squareIndex += squareValue
    # index範囲外もしくは最大入力個数回トライしてだめならループ終了
    if try_count > max_try || squareIndex > max_length
      break
    end
    squareValue = square[squareIndex]
    try_count += 1
  end

  resultList << (squareIndex == max_length ? "Yes" : "No")
end

# 結果の表示
input_mass = gets.to_i
(0..input_mass - 1).each do |i|
  checkValue = gets.to_i
  puts (checkValue > max_length ? "No" : resultList[checkValue])
end
