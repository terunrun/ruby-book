print "Text?:"
text = gets.chomp

begin
  print "Pattern?:"
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
# RegexpErrorクラスのみを捕捉
rescue RegexpError => e
  puts "Invalid Pattern:#{e.message}"
  # beginから再実行する
  retry
end

# text内のregexpに合致する文字列をmatches配列に格納
matches = text.scan(regexp)
if matches.size > 0
  puts "Matched:#{matches.join(",")}"
  puts "Matched:#{matches}"
else
  puts "Nothing mathced."
end
