def fizz_buzz(arg)
  if arg % 15 == 0
    "fizz_buzz"
  elsif arg % 3 == 0
    "fizz"
  elsif arg % 5 == 0
    "buzz"
  else
    arg.to_s
  end
end

# for i in 1..20 do
#   puts fizz_buzz(i)
# end
