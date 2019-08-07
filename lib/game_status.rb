# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def all_same?(board, index_arr)
  index_arr.all? do |i|
    board[i] && board[i] == board[index_arr[0]] && board[i] != " "
  end
end

def full?(board)
  board.all? { |e| ["X", "O"].include?(e) } 
end

def draw?(board)
  won?(board) ? false : full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_indicies = won?(board)
  winning_indicies ? board[winning_indicies[0]] : nil
end

def won?(board)
  WIN_COMBINATIONS.each do |arr|
    if all_same?(board, arr)
      return arr
    end
  end
  nil
end