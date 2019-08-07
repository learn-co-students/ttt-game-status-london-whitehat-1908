# Helper Method
#

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  # ETC, an array for each win combination
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def winner(board)
  winningCondition = won?(board)
  if (winningCondition != false)
    board[winningCondition[0]]
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win|
    if (board[win[0]] == board[win[1]]) && (board[win[1]] == board[win[2]]) && (board[win[0]] != " ") && (board[win[0]] != "")
      return (win)
    end
  end
  return false
end


def draw?(board)
  (full?(board) && !won?(board))
end


def full?(board)
  board.each do |item|
    if !((item == "X") || (item == "O"))
      return false
    end
  end
  true
end


def over?(board)
  return(won?(board) || draw?(board))
end

