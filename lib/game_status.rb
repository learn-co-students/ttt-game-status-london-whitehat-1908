# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each { |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    pos1 = board[win_index_1]
    pos2 = board[win_index_2]
    pos3 = board[win_index_3]

    if (pos1 == 'X' && pos2 == 'X' && pos3 == 'X') || (pos1 == 'O' && pos2 == 'O' && pos3 == 'O') then
      return combination
    end
  }
  return false
end

def full?(board)
  count = 0
  board.each { |n|
    if !(n == 'X' || n == 'O')
      return false
    end
  }
  return true
end

def draw?(board)
  if (full?(board) == true && won?(board) == false) then
    return true
  end
end

def over?(board)
  if (full?(board))
    return true
  else
    if (won?(board) != false)
      return true
    else
      return false
    end
  end
end

def winner(board)
  buffer = won?(board)
  if (buffer != false)
    return board[buffer[0]]
  else
    return nil
  end
end