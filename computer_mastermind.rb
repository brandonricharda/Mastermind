require './game.rb'

class ComputerMastermind

    include Game

    def initialize
        @chosen_code = chooseCode
        @turns = 1
        @check_finish = false
        @player = "Computer"
        #startGame
    end

    def chooseCode
        options = colors.values
        code = []
        retry_flag = false
        until code.length == 6
            description = code.length == 0 ? "first" : "next"
            puts "Please select the #{description} color for your code." unless retry_flag
            puts "Choose from: #{options.join(", ")}." unless retry_flag
            value = gets.chomp.upcase
            if options.include?(value)
                code.push(value)
                options.delete(value)
                retry_flag = false
            else
                puts "Please select from the following options (case insensitive): #{colors}."
                retry_flag = true
            end
        end
        code
    end

    def computerGuess
        colors = {1 => "RED", 2 => "BLUE", 3 => "GREEN", 4 => "BROWN", 5 => "WHITE", 6 => "BLACK"}

    end

end

test = ComputerMastermind.new