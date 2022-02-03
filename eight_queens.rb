require 'byebug'

class EightQueens


    def initialize(size)

        @size = size

        @queens_positions = []

        @solutions = []
        
    end

    def place_queens
        
        (0...@size).each do |row|

            picked = false
            
            while picked == false

                col = rand(@size)

                 if @queens_positions.none? { |position| position[1] == col }
                    @queens_positions << [row, col]
                    picked = true
                end

            end

        end

        print @queens_positions

    end

    def find_diagonals(current_position)

        queen_row, queen_col = current_position

        other_queen_positions = @queens_positions.reject { |position| position == current_position } 
        
        other_queen_positions.each do |other_queen_position|
            other_queen_row, other_queen_col = other_queen_position

            if other_queen_row - queen_row == other_queen_col - queen_col
                puts
                print 'diagonal found', current_position, other_queen_position
                puts
            end
        end
        

    end

    def find_horizontals(current_position)

        queen_row, queen_col = current_position

        other_queen_positions = @queens_positions.reject { |position| position == current_position } 
        
        other_queen_positions.each do |other_queen_position|
            other_queen_row, other_queen_col = other_queen_position

            if other_queen_row == queen_row
                puts
                print 'horizontal found', current_position, other_queen_position
                puts
                return true
            end
        end
        

    end

    def find_solutions

        self.place_queens

        @queens_positions.each do |position| 
            find_diagonals(position)
            find_horizontals(position)
        end

        @solutions << @queens_positions

        puts 'found a solution'


    end
            


end

EightQueens.new(8).find_solutions