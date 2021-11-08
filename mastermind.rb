
def check_input(guess_str)
  is_range = guess_str.none? { |item| item < 1 || item > 8}
  until guess_str.length == 4 and is_range == true
    print "Invalid Input, please re-enter input again (1-8) 4 digit only:"
    guess_str = gets.chomp.split('').map {|item| item.to_i}
    is_range = guess_str.none? { |item| item < 1 || item > 8}
  end
  guess_str
end
rand_num = [1,2,3,4,5,6,7,8]
guess_this = Array.new(4,0)
red_clue = Array.new
white_clue = Array.new

guess_this.map! do |element|
  item = rand_num[rand(rand_num.length)]
  element = item
  rand_num.delete(item)
end
p guess_this

10.times do |count|
  puts "Round ##{count+1}"
  print "Insert your guess (1-8, 4 digit only): "
  guess_str = gets.chomp.split('').map {|item| item.to_i}
  guess_str = check_input(guess_str)
  puts "input: #{guess_str}"

  guess_this.each_with_index do |digit, i|
    if guess_str[i] == digit
      red_clue.push('O')
    elsif guess_str.any?(digit)
      white_clue.push('X')
    end
  end
  p red_clue.concat(white_clue)
  red_clue.clear
  white_clue.clear
end
puts "The end!"
#puts guess_str.find_all {|e| guess_str.count(e)>1}


# guess_str.each_with_index do |element, i|
#   puts "-----number ##{i+1}: #{element}-----"
#   a = guess_this.one?(element)
#   puts "Existence? #{a}."
#   b = element == guess_this[i]
#   puts "correct position? #{b}."
#   c = guess_str.one?(element)
#   puts "Only its kind in input? #{c}."
#   puts "-----------------------"
# end

#guess_str.each_with_index do |element,i|
#   if element.to_i == guess_this[i]
#     guess_clue.push('O')
#   elsif guess_this.any?{|item| item == element.to_i}
#     guess_clue.push('X')
#   end
#end
