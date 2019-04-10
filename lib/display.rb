class Display
  def display_board(board)
    print ''"
     #{board[0]} | #{board[1]} | #{board[2]}
    -----------
     #{board[3]} | #{board[4]} | #{board[5]}
    -----------
     #{board[6]} | #{board[7]} | #{board[8]}\n"''
  end

  def ask_for_move
    print 'Choose a position from 1-9: '
  end

  def show_current_player(mark, name)
    print "#{mark} (#{name}), play a move:\n"
  end

  def invalid_move_message
    "You have entered an invalid move. Please try again:\n"
  end

  def show_winner_message(player_mark)
    print "#{player_mark} is the winner!\n"
  end

  def show_tie_message
    print "The game is a tie!\n"
  end

  def show_game_outcome(outcome)
    if outcome == 'tie'
      show_tie_message
    else
      show_winner_message(outcome)
    end
  end

  def ask_play_again
    print "Play again? (Y/N):\n"
    $stdin.gets.chomp.upcase
  end

  def show_exit_message
    print "Thanks for playing Tic Tac Toe!\n"
  end

  def show_game_options
    print "Let's play Tic Tac Toe!\n"
  end

  def show_invalid_option_message
    print "Invalid option selected. Please try again:\n"
  end

  def ask_for_player1
    print "Please select player 1 (h = human, c = computer):\n"
  end

  def ask_for_player2
    print "Please select player 2 (h = human, c = computer):\n"
 end
end
