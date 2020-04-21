class Mastermind

    def initialize
        @chosen_code = chooseCode
        @check_finish = false
        @turns = 1
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

    def checkGuess(guess)
        feedback = []
        if guess == @chosen_code
            puts "You got it!"
            @check_finish = true
        else
            guess.each_with_index do |item, index|
                if @chosen_code[index] == item
                    feedback.push(green(item))
                elsif @chosen_code.include?(item)
                    feedback.push(red(item))
                end
            end

            if @turns <= 10 && !@check_finish
                puts ""
                puts "---"
                puts "You guessed: #{feedback.join(", ")}."
                puts "Items in green are what you got right (both color and position). Items in red are in the wrong position."
                puts "Remaining turns: #{10 - @turns}."
                puts "---"
                puts ""
            end
            puts "Game over! The code was #{@chosen_code}." unless @turns < 10
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
        checkGuess(guess)
    end

    def colorize(text, color_code)
        "\e[#{color_code}m#{text}\e[0m"
    end

    def red(text)
        colorize(text, 31)
    end

    def green(text)
        colorize(text, 32)
    end

end

test = Mastermind.new

test.startGame