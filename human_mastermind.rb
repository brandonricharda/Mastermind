require './game.rb'

class HumanMastermind < Game

    def initialize(turns, flag)
        @chosen_code = chooseCode
        @turns = turns
        @check_finish = flag
        @player = "You"
        startGame
    end

    def chooseCode
        colors = {1 => "RED", 2 => "BLUE", 3 => "GREEN", 4 => "BROWN", 5 => "WHITE", 6 => "BLACK"}
        code = []
        until code.length == 6
            value = rand(1..6)
            if !code.include?(colors[value])
                code.push(colors[value])
            end
        end
        code
    end

    def startGame
        while @turns <= 10 && !@check_finish
            choices
            @turns += 1
        end
    end

    def choices
        phrases = {1 => "first", 2 => "second", 3 => "third", 4 => "fourth", 5 => "fifth", 6 => "sixth"}
        remaining_options = ["red", "blue", "green", "brown", "white", "black"]
        picks = 1
        guess = []
        while picks <= 6
            puts "What do you think the #{phrases[picks]} color is?"
            puts "Your options are: #{remaining_options.join(", ")}."
            choice = gets.chomp
            if remaining_options.include?(choice.downcase)
                guess.push(choice.upcase)
                remaining_options.delete(choice.downcase)
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

test = Game.new(HumanMastermind)