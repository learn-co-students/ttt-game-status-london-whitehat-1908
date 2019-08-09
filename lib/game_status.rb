# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
def won? (board)
  WIN_COMBINATIONS.each { |combo| 
    pos1 = board[combo[0]]
    pos2 = board[combo[1]]
    pos3 = board[combo[2]]
  
    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      return combo
    end
    if pos1 == "O" && pos2 == "O" && pos3 == "O"
      return combo
    end
  }
  return nil
  
end

def winner (board)
  WIN_COMBINATIONS.each { |combos| 
    pos1 = board[combos[0]]
    pos2 = board[combos[1]]
    pos3 = board[combos[2]]
  
    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      return "X"
    end
    if pos1 == "O" && pos2 == "O" && pos3 == "O"
      return "O"
    end
  }
  return nil
end

def over? (board)
  if draw?(board) || won?(board)
    return true
  end
  return false 
end 

def draw?(board)
  if full?(board)== true && winner(board) == nil
    return true
  else
    return false
  end
end 

def full? (board)
  board.each { |space| 
    if space == " "
      return false
    end 
  }
  return true
end

