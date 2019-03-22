class Display
  def display_board(board)
    print """
     #{board[0]} | #{board[1]} | #{board[2]}
    -----------
     #{board[3]} | #{board[4]} | #{board[5]}
    -----------
     #{board[6]} | #{board[7]} | #{board[8]}\n"""
  end

  def ask_for_move
    print 'Choose a position from 1-9: '
    move = $stdin.gets.chomp
    move.to_i
  end

  def show_current_player(current_player_mark)
    print "The current player is #{current_player_mark}\n"
  end
end
