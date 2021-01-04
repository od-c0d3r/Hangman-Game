dic = File.open('5desk.txt', 'r')
words = Array.new

# loop over every line in 5desk.txt and push it in #{words} array
dic.each do |word|
  words.push(word) if word.size >= 5 && word.size <= 12
end
# Pick a random word form the array
word = words.sample.chomp
# Break it down to chars
word_arr = word.split(//)
# clone the chars array with ' _ ' ['c','a','t']  => [' _ ',' _ ',' _ ']
result_arr = Array.new(word_arr.size, ' _ ')
# output the word array after changing every char with ' _ '
puts "Word = #{word.gsub(/\w/, ' _ ')}"


game_finished = false
until game_finished
  puts 'Enter a guss or type "save" to save your game and exit'
  user_input = gets.chomp
  if word_arr.include? user_input
    word_arr.each_with_index { |letter, index| result_arr[index] = " #{user_input} " if letter == user_input }
    p result_arr.join
  else
    puts 'wrong guss'
  end
end
