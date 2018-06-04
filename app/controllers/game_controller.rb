require 'open-uri'
require 'json'

class GameController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    return @letters
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters]
    attempt_letters = @answer.upcase.chars
    grid_array = @letters.chars

    dictionary_serialized = open("https://wagon-dictionary.herokuapp.com/#{@answer}").read
    word = JSON.parse(dictionary_serialized)

    if attempt_letters.all? { |letter| grid_array.count(letter) >= attempt_letters.count(letter)}
      if word["found"] == true
        @score = "Good job! Thats an English word"
      else
        @score = "Ooee, i'm sorry but that is not an English word"
      end
    else
      @score = "Sorry but #{@answer} could not be built out of #{@letters}"
    end
  end
end


# The word can't be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
