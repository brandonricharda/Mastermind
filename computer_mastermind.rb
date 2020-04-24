require './game.rb'

class ComputerMastermind

    include Game

    def initialize
        @chosen_code = chooseCode
        @turns = 1
        @check_finish = false
        @player = "Computer"
        @feedback = []
        startGame
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

    def startGame
        while @turns <= 10 && !@check_finish
            computerGuess
        end
    end

    def computerGuess
        if @turns == 1
            guess = generateCode
            @feedback = checkGuess(guess, @chosen_code, @turns, @player, @check_finish)
            @turns += 1
            guess
        else
            guess = intelligentGuess(@feedback)
            @feedback = checkGuess(guess, @chosen_code, @turns, @player, @check_finish)
            @turns += 1
            guess
        end
    end

    def intelligentGuess(feedback)
        new_guess = ["a", "b", "c", "d", "e", "f"]
        remaining_options = colors
        correct = feedback.select { |item| item == item.upcase }
        
        correct.each do |item|
            remaining_options.delete(remaining_options.key(item))
        end
        
        feedback.each_with_index do |item, index|
            if item == item.upcase
                new_guess[index] = item
            else
                array = remaining_options.keys
                value = array.sample
                new_value = remaining_options[value]
                new_guess[index] = new_value
                remaining_options.delete(remaining_options.key(new_value))
            end
        end
        new_guess
    end
end

test = ComputerMastermind.new