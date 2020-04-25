def gameSelection
    flag = false
    puts ""
    puts "---"
    puts "If you would like to crack the computer's code, type 'FIRST OPTION' in all caps."
    puts ""
    puts "If you would like to select a code and have the computer crack it, type 'SECOND OPTION' in all caps."
    puts "---"
    puts ""
    while !flag
        choice = gets.chomp
        if choice == "FIRST OPTION"
            require './human_mastermind.rb'
        elsif choice == "SECOND OPTION"
            require './computer_mastermind.rb'
        else
            puts "Please double check your input."
        end
    end
end

gameSelection