class Word
  # Stores the provided word in an instance variable and
  # setups up any other instance variables.
attr_accessor :word, :array_of_letters, :displaying_word

  def initialize(word)
    @word = word
    @array_of_letters = @word.split("")
    @displaying_word = "_" * word.length
  end

  # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess?(letter)
    if @word.include?(letter)
      right = @array_of_letters.each_index.select { |i| @array_of_letters[i] == letter }
      right.each { |n| @displaying_word[n] = letter }
      puts "true"
      puts @displaying_word
    else
      puts 'false'
    end
  end

  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
    if @displaying_word == @word
      puts "CONGRATS"
      return true
    else
      return false
    end
  end

  # Display the current state of the guessed word for the player.
  def output_word
    puts @displaying_word
  end

  # Check whether a provided character is a letter
  def self.is_letter?(character)
  end
end

class MysteryWordGame
  # Initialize any state in the game, and start the game loop.
  def initialize
    @lives = 5
    @word
  end

  def ask_for_word
    puts "Player 1: Choose a word below, player 2 has 5 guesses"
    user_word = gets.chomp
    @word = Word.new(user_word) 
  end

  # Run the game loop, which continues until the player wins or loses.
  def game_loop
    game_over = false
    while @lives > 0 && game_over == false do
      puts "enter letter"
      user_letter = gets.chomp
      if @word.guess?(user_letter)
        @word.output_word
      else
        @lives -=1
        puts "Number of guesses remaining: #{@lives}"
        if @lives == 0
          puts "YOU LOSE"
        end
      end
      game_over=@word.guessed_all_correct?
    end
  end
end

# whodat = Word.new('crocodile')
game = MysteryWordGame.new
game.ask_for_word
game.game_loop

# whodat.guessed_all_correct?
# whodat.displaying_word
# whodat.word


