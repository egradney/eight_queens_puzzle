require 'byebug'

class EightQueens


    def initialize(size)

        @size = size

        @queens_positions = []
        
    end

    def place_queen(row)

        picked = false
            
        while picked == false

            col = rand(@size)

             if @queens_positions.none? { |position| position[1] == col }

                new_queen_position = [row, col]
            
                @queens_positions << new_queen_position
                picked = true
               
            end

        end

    end

    def place_queens
        
        (0...@size).each { |row| place_queen(row) }

        print @queens_positions

    end

    def find_diagonals(current_position)

        queen_row, queen_col = current_position

        other_queen_positions = @queens_positions.reject { |position| position == current_position } 
        
        other_queen_positions.each do |other_queen_position|
            other_queen_row, other_queen_col = other_queen_position

            if (other_queen_row - queen_row).abs == (other_queen_col - queen_col).abs
                puts
                print 'diagonal found', current_position, other_queen_position
                puts
                return true
            end
        end
        
        false

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

        false

    end

    def find_verticals(current_position)

        queen_row, queen_col = current_position

        other_queen_positions = @queens_positions.reject { |position| position == current_position } 
        
        other_queen_positions.each do |other_queen_position|
            other_queen_row, other_queen_col = other_queen_position

            if other_queen_col == queen_col
                puts
                print 'vertical found', current_position, other_queen_position
                puts
                return true
            end
        end

        false

    end

    def find_solutions


    end
            


end