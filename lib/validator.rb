# validator.rb
class Validator
  def valid_advance?(color, start, destination, first_move)
    if color == 'white'
      if first_move && destination[0] - start[0] == 2 && destination[1] == start[1]
        return true
      elsif destination[0] - start[0] == 1 && destination[1] == start[1]
        return true
      end
    elsif color == 'black'
      if first_move && start[0] - destination[0] == 2 && destination[1] == start[1]
        return true
      elsif start[0] - destination[0] == 1 && destination[1] == start[1]
        return true
      end
    end

    false
  end

  def valid_capture?(color, start, destination)
    if color == 'white'
      if destination[0] - start[0] == 1 && (destination[1] - start[1]).abs == 1
        return true
      end
    elsif color == 'black'
      if start[0] - destination[0] == 1 && (destination[1] - start[1]).abs == 1
        return true
      end
    end

    false
  end
end
