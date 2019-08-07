# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
  [ [0, 1, 2], # across
    [3, 4, 5],
    [6, 7, 8],

    [0, 3, 6], # down
    [1, 4, 7],
    [2, 5, 8],

    [0, 4, 8], # diag
    [2, 4, 6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    return combination if combination.all? { |i| board[i] == 'X' }\
                       || combination.all? { |i| board[i] == 'O'}
  end
  return false
end

def full?(board)
  board.select { |cell| cell == 'X' || cell == 'O'}.length >= 8
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  win_row = won? board
  board[win_row.first] if win_row
end