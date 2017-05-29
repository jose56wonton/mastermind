require "./code.rb"
#
def compair_codes answer, guess
  black = 0
  white = 0
  colors = Hash.new(0)
  guess.each{|color| colors[color]+=1}
  guess.each_with_index do |color, index|
    if answer[index] == guess[index]
      black+=1
    elsif answer.include?(color) && colors[color] < 2
      white+=1
    end
  end
  return [black.to_s,white.to_s]
end

def generate_list
  color = Code.new([])
  arr = []
  color.valid_colors.each_index do |a|
    color.valid_colors.each_index do |b|
      color.valid_colors.each_index do |c|
        color.valid_colors.each_index do |d|
          arr.push(Code.new([color.valid_colors[a],color.valid_colors[b],color.valid_colors[c],color.valid_colors[d]]))

        end
      end
    end
  end
  return arr
end

#
def codebreaker
  answer = Code.new([])
  answer.randomize

  12.downto(1) do |curr|

    guess = []
    prompt = "Please enter 4 colors: "
    print prompt
    while user_input = gets.chomp # loop while getting user input
      guess = Code.new(user_input.split(" "))

      if !guess.is_valid?
        puts "Invalid color combination!"
        print prompt # print the prompt, so the user knows to re-enter input
      else
        break
      end
    end
    if compair_codes(answer.color_array,guess.color_array)[0].to_i == 4
      puts "Nice Job! You guessed it in #{13-curr} guess(es)!"
      break
    elsif curr!=1
      puts "Black counter: #{compair_codes(answer.color_array,guess.color_array)[0]}"
      puts "White counter: #{compair_codes(answer.color_array,guess.color_array)[1]}"
      puts "You have #{curr-1} more guesses!"
    else
      puts "Unfortunately you have no more guesses :/"
      puts "The correct code is #{answer.print_code}"
    end
  end
end
#
def codemaker
  answer = []
  prompt = "Please enter 4 colors: "
  print prompt
  while user_input = gets.chomp # loop while getting user input
    answer = Code.new(user_input.split(" "))

    if !answer.is_valid?
      puts "Invalid color combination!"
      print prompt # print the prompt, so the user knows to re-enter input
    else
      break
    end
  end
  list = generate_list
  index = 7
  13.downto(1) do |curr|

    black = compair_codes( answer.color_array, list[index].color_array)[0]
    white = compair_codes( answer.color_array, list[index].color_array)[1]
    unless list.length == 1
      list.select! do |i|
        !((black == compair_codes( answer.color_array, i.color_array)[0]) && (white == compair_codes( answer.color_array, i.color_array)[1]))
      end
    end

    if compair_codes( answer.color_array, list[index].color_array)[0] == "4" || list.length == 1
      puts "The computer figured it out in #{13-curr} guesses!"
      print "The correct answer was: "
      list[index].print_code
      break
    elsif curr != 1
      puts "#{curr-1} more guesses!"
      print "The computer guessed: "
      list[index].print_code
      puts "\nBlack = #{compair_codes( answer.color_array, list[index].color_array)[0]}"
      puts "White = #{compair_codes( answer.color_array, list[index].color_array)[1]}"
      puts "List.length = #{list.length}\n\n"
      #puts compair_codes( answer.color_array, list[index].color_array)[0].to_s
      #puts compair_codes( answer.color_array, list[index].color_array)[1].to_s
      index = 0
    else
      puts "This computer is stupid! :/"
    end
  end





end
puts "Welcome to Mastermind!"
prompt = "Would you like to be the codemaker, the codebreaker, or exit?"
print prompt
while user_input = gets.chomp # loop while getting user input
  case user_input
  when "codemaker"
    codemaker
     # make sure to break so you don't ask again
  when "codebreaker"
    codebreaker
     # and again
   when "exit"
     break
  else
    puts "Please select a valid input"
    print prompt # print the prompt, so the user knows to re-enter input
  end
end
