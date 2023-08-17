# frozen_string_literal: true

# validator.rb
class Validator
  def valid_advance?(color, start, destination, first_move)
    row_diff = (destination[0] - start[0]).abs
    col_diff = (destination[1] - start[1]).abs

    if color == 'white'
      return valid_white_advance?(row_diff, col_diff, first_move)
    elsif color == 'black'
      return valid_black_advance?(row_diff, col_diff, first_move)
    end

    false
  end

  def valid_capture?(color, start, destination)
    row_diff = (destination[0] - start[0]).abs
    col_diff = (destination[1] - start[1]).abs

    return row_diff == 1 && col_diff == 1
  end

  def valid_rook_move?(start, destination)
    return true if vertical_move?(start, destination) || horizontal_move?(start, destination)

    false
  end

  private

  def valid_white_advance?(row_diff, col_diff, first_move)
    return true if first_move && row_diff == 2 && col_diff == 0
    return row_diff == 1 && col_diff == 0
  end

  def valid_black_advance?(row_diff, col_diff, first_move)
    return true if first_move && row_diff == 2 && col_diff == 0
    return row_diff == 1 && col_diff == 0
  end
end

def vertical_move?(start, destination)
  start[1] == destination[1]
end

def horizontal_move?(start, destination)
  start[0] == destination[0]
end
