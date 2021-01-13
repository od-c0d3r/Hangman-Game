dic = File.readlines('5desk.txt')
words = []

# loop over every line in 5desk.txt and push it in #{words} array
dic.each do |word|
  words.push(word.chomp) if word.size >= 5 && word.size <= 12
end

p words

# Pick a random word form the array
word = words.sample.chomp.downcase
# Break it down to chars
word_arr = word.split(//)
# clone the chars array with ' _ ' ['c','a','t']  => [' _ ',' _ ',' _ ']
result_arr = Array.new(word_arr.size, ' _ ')
# keep track of gussed and missed chars
guessed = Array.new
missed = Array.new
system('cls')

# game loop
game_finished = false

until game_finished
  puts "Word = #{result_arr.join}"
  puts "Missed = #{missed}" unless missed.empty?
  puts "\nEnter a guess or type \"save\" to save your game and exit\n\n"
  user_input = gets.chomp.downcase
  # if i/p is 'save' execute save method
  if user_input == 'save'
    save(game)
    # if i/p included in word_arr
  elsif guessed.include? user_input
    puts 'You already guessed that'
    sleep(1)
    system('cls')
  elsif missed.include? user_input
    puts 'You already missed that'
    sleep(1)
    system('cls')
  elsif word_arr.include? user_input
    # change ' _ ' in result_arr to revel the right chosen char answer
    word_arr.each_with_index do |letter, index|
      if letter == user_input
        result_arr[index] = " #{user_input} "
        guessed.push(user_input)
      end
    end
    p guessed
    p word_arr
    puts 'Right guess'
    sleep(1)
    system('cls')
  else
    missed.push(user_input)
    p guessed
    p word_arr
    puts 'Wrong guess'
    sleep(0.7)
    system('cls')
  end

  if guessed.sort == word_arr.sort
    puts 'CongratZ'
    game_finished = true
  end

end
