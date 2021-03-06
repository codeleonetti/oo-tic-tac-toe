
class TicTacToe

    attr_accessor :board

    def initialize
        @board = Array.new(9, " ")
        board = @board
    end


    WIN_COMBINATIONS =[
        [0,1,2], #top
        [3,4,5], #middle rows
        [6,7,8], #bottom

        [0,3,6], #left
        [1,4,7], #center collums
        [2,5,8], #right

        [0,4,8], # diagonal
        [6,4,2]
    ]


    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts " -----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts " -----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(user_input)
         user_input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        (@board[index] == "X" ||  @board[index] == "O")

    end

    def valid_move?(position)
        position.between?(0, 8) && !position_taken?(position)

    end

    def turn_count
        count_turn = 0
         @board.each do | space |
            if space == "O" || space == "X"
                count_turn += 1
            end
        end
        return count_turn
    end

    def current_player
        
        if turn_count % 2 == 0
            return "X"
            else 
                return "O"
        end
    end

    def turn
        puts "Please enter a number 1 - 9"
        user_input = gets.chomp
        index = input_to_index(user_input)
        char = current_player
        if valid_move?(index)
            move(index, char)
            display_board
        else turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |element|
            pos_one = @board[element[0]]
            pos_two = @board[element[1]]
            pos_three = @board[element[2]]
            if pos_one == "X" && pos_two == "X" && pos_three == "X" || pos_one == "O" && pos_two == "O" && pos_three == "O"
                return element
            end
        end
        return false
    end

    def full?
        @board.all? {|occupied| occupied != " "}
    end


    def draw?
        !won? && full?
    end

    def over?
        full? || draw? || won?
    end

    def winner
        if won?
            array = won?
            winning = @board[array[0]]
            winning
        else
            nil
        end
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end





