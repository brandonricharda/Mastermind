class Game
    
    def initialize(mode)
        mode.new(1, false)
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

    def checkGuess(guess, code, turns, player, status)
        feedback = []
        guess.each_with_index do |item, index|
            feedback.push(code[index] == item ? green(item) : red(item))
        end
        deliverFeedback(turns, player, status, feedback) unless status || turns > 10
    end

    def deliverFeedback(turns, player, status, feedback)
        puts ""
        puts "---"
        puts "#{player} guessed: #{feedback.join(", ")}."
        puts "Items in green are what #{player} got right (both color and position). Items in red are in the wrong position."
        puts "Remaining turns: #{10 - turns}."
        puts "---"
        puts ""
    end

end