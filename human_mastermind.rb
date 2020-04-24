require './game.rb'

class HumanMastermind

    include Game

    def initialize
        @chosen_code = generateCode
        @turns = 1
        @check_finish = false
        @player = "You"
        startGame
    end

    def startGame
        while @turns <= 10 && !@check_finish
            choices
            @turns += 1
        end
    end

    def choices
        phrases = {1 => "first", 2 => "second", 3 => "third", 4 => "fourth", 5 => "fifth", 6 => "sixth"}
        remaining_options = colors.values
        picks = 1
        guess = []
        while picks <= 6
            puts "What do you think the #{phrases[picks]} color is?"
            puts "Your options are: #{remaining_options.join(", ")}."
            choice = gets.chomp
            if remaining_options.include?(choice.upcase)
                guess.push(choice.upcase)
                remaining_options.delete(choice.upcase)
                picks += 1
            else
                puts "Pssst! Choose one of the available colors!"
                next
            end
        end 
        localCheckGuess(guess)
    end

    def localCheckGuess(guess)
        if guess == @chosen_code
            puts "You got it!"
            @check_finish = true
        else
            checkGuess(guess, @chosen_code, @turns, @player, @check_finish)
            puts "Game over! The code was #{@chosen_code}." unless @turns < 10
        end
    end

end

test = HumanMastermind.new