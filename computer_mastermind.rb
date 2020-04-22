require './game.rb'

class ComputerMastermind < Game

    def initialize(turns, flag)
        @check_finish = flag
        @turns = turns
        @chosen_code = chooseCode
    end

    def chooseCode
        colors = ["RED", "BLUE", "GREEN", "BROWN", "WHITE", "BLACK"]
        code = []
        retry_flag = false
        until code.length == 6
            description = code.length == 0 ? "first" : "next"
            puts "Please select the #{description} color for your code." unless retry_flag
            puts "Choose from: #{colors}." unless retry_flag
            value = gets.chomp.upcase
            if colors.include?(value)
                code.push(value)
                colors.delete(value)
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

test = Game.new(HumanMastermind)