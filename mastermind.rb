
def guess_the_input(count)
  puts "\nRound ##{count+1}"
  print "Insert your guess (1-8, 4 digit only): "
  guess_str = gets.chomp.split('').map {|item| item.to_i}
  guess_str = check_input(guess_str)
end

def check_input(guess_str)
  is_range = guess_str.none? { |item| item < 1 || item > 8}
  until guess_str.length == 4 and is_range == true
    print "Invalid Input.\nPlease re-enter input again (1-8) 4 digit only:"
    guess_str = gets.chomp.split('').map {|item| item.to_i}
    is_range = guess_str.none? { |item| item < 1 || item > 8}
  end
  guess_str
end

def show_previous(previous_indicator, previous_select, guess_str, red_clue, white_clue, count)
  previous_select.push(guess_str)
  previous_indicator[count] = red_clue + white_clue
  puts "\n+------------------------------Game Board------------------------------------------+"
  previous_select.each_with_index do |row,i|
    print "       Guess ##{i+1}: #{row}  "
    puts "            Guess's clue: #{previous_indicator[i]}"
    puts "+----------------------------------------------------------------------------------+"
  end
end

def check_win(red_clue)
  if red_clue.all?('O') && !red_clue.empty? && red_clue.length == 4
    puts "\nYOU WIN! You cracked the code!!!"
    return 1
  end
  0
end

def reset_indicator(red_clue, white_clue)
  red_clue.clear
  white_clue.clear
end

def loser_announcement(guess_this)
  puts "\nYOU LOSE!! Blyat!!!"
  puts "The code: #{guess_this}."
end

rand_num = [1,2,3,4,5,6,7,8]
guess_this = Array.new(4,0)
red_clue = Array.new
white_clue = Array.new
previous_select= Array.new
previous_indicator= Array.new

guess_this.map! do |element|
  item = rand_num[rand(rand_num.length)]
  element = item
  rand_num.delete(item)
end
#p guess_this

win = 0
10.times do |count|
  guess_str = guess_the_input(count)
  puts "Input: #{guess_str}"

  guess_this.each_with_index do |digit, i|
    if guess_str[i] == digit
      red_clue.push('O')
    elsif guess_str.any?(digit)
      white_clue.push('X')
    end
  end

  print "Game's clue: #{red_clue + white_clue}\n"
  show_previous(previous_indicator, previous_select, guess_str, red_clue, white_clue, count)

  win = check_win(red_clue)
  break if win>0
  reset_indicator(red_clue, white_clue)
end

loser_announcement(guess_this) unless win > 0



