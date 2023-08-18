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

  def valid_capture?(_color, start, destination)
    row_diff = (destination[0] - start[0]).abs
    col_diff = (destination[1] - start[1]).abs

    row_diff == 1 && col_diff == 1
  end

  def valid_rook_move?(start, destination)
    return true if vertical_move?(start, destination) || horizontal_move?(start, destination)

    false
  end

  def valid_bishop_move?(start, destination)
    return true if diagonal_move?(start, destination)

    false
  end

  def valid_knight_move?(start, destination)
    x_diff = (start[0] - destination[0]).abs
    y_diff = (start[1] - destination[1]).abs

    (x_diff == 2 && y_diff == 1) || (x_diff == 1 && y_diff == 2)
  end

  def valid_king_move?(start, destination)
    x_diff = (start[0] - destination[0]).abs
    y_diff = (start[1] - destination[1]).abs

    x_diff <= 1 && y_diff <= 1
  end

  def valid_queen_move?(start, destination)
    valid_rook_move?(start, destination) || valid_bishop_move?(start, destination)
  end

  private

  def valid_white_advance?(row_diff, col_diff, first_move)
    return true if first_move && row_diff == 2 && col_diff.zero?

    row_diff == 1 && col_diff.zero?
  end

  def valid_black_advance?(row_diff, col_diff, first_move)
    return true if first_move && row_diff == 2 && col_diff.zero?

    row_diff == 1 && col_diff.zero?
  end
end

def vertical_move?(start, destination)
  start[1] == destination[1]
end

def horizontal_move?(start, destination)
  start[0] == destination[0]
end

def diagonal_move?(start, destination)
  (start[0] - destination[0]).abs == (start[1] - destination[1]).abs
end
