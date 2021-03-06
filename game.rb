module Game

    def colorize(text, color_code)
        "\e[#{color_code}m#{text}\e[0m"
    end

    def red(text)
        colorize(text, 31)
    end

    def green(text)
        colorize(text, 32)
    end

    def colors
        {1 => "RED", 2 => "BLUE", 3 => "GREEN", 4 => "BROWN", 5 => "WHITE", 6 => "BLACK"}
    end

    def generateCode
        code = []
        until code.length == 6
            value = rand(1..6)
            if !code.include?(colors[value])
                code.push(colors[value])
            end
        end
        code
    end

    def checkGuess(guess, code, turns, player, status)
        feedback = []
        computer_marker = []
        guess.each_with_index do |item, index|
            feedback.push(code[index] == item ? green(item) : red(item))
            computer_marker.push(code[index] == item ? item : item.downcase)
        end
        deliverFeedback(turns, player, status, feedback) unless status || turns > 10
        computer_marker
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