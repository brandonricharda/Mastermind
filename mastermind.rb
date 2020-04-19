#Note: It'd be a fun challenge to code this in a way where the code itself is only visible to a specific function. Every time the system wants to check, it has to run that function.

class Mastermind

    def initialize
        @chosen_code = chooseCode
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

    def checkGuess(guess)
        if guess == @chosen_code
            puts "You got it!"
            true #this will be the implicit return that tells the startGame method it can stop running
        else
            #code goes here that analyzes the guess and returns feedback on how accurate it was
        end
    end

    def code
        @chosen_code
    end

    def startGame
        turns = 0
        #code goes here that allows the choices method to run for 10 turns or until the correct guess is chosen
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

end

test = Mastermind.new

puts test.code

test.choices