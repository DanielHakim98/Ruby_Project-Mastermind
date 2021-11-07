
rand_num = [1,2,3,4,5,6]
guess_this = Array.new(4,0)
guess_clue = Array.new
guess_this.map! do |element|
  item = rand_num[rand(rand_num.length)]
  element = item
  rand_num.delete(item)
end
p guess_this

print "Insert your guess (1-6): "
guess_str = gets.chomp.split('')[0..3].map {|item| item.to_i}
puts "guess_this: #{guess_this}"
puts "guess_str: #{guess_str}"

guess_str.each_with_index do |element, i|
  puts "-----number ##{i+1}: #{element}-----"
  a = guess_this.one?(element)
  puts "Contain this number in the secret numbers? #{a}."
  b = element == guess_this[i]
  puts "Is it at correct position? #{b}."
  c = guess_str.one?(element)
  puts "Only its kind of number in the user input? #{c}."
  puts "-----------------------"
end

#guess_str.each_with_index do |element,i|
#   if element.to_i == guess_this[i]
#     guess_clue.push('O')
#   elsif guess_this.any?{|item| item == element.to_i}
#     guess_clue.push('X')
#   end
#end
