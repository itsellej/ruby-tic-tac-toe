RSpec.describe Display do
  context 'Displaying game options:' do
    $stdout = StringIO.new

    it "displays 'Please enter the game name to load:" do
      display = display_setup
      display.game_name_prompt
      output = $stdout.string

      expect(output).to include('Please enter the game name')
    end

    it "displays 'You have entered an invalid game name. Please try again:" do
      display = display_setup
      display.invalid_game_message
      output = $stdout.string

      expect(output).to include('You have entered an invalid game name. Please try again:')
    end
  end

  context 'Asking the user for a move:' do
    $stdout = StringIO.new

    it 'displays "Choose a position from 1-9"' do
      display = display_setup
      allow($stdin).to receive(:gets).and_return('1')

      display.ask_for_move
      output = $stdout.string

      expect(output).to include('Choose a position from 1-9:')
    end
  end

  context 'Displaying a grid:' do
    $stdout = StringIO.new

    it 'accepts a grid as an argument and displays it' do
      display = display_setup
      display.display_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
      output = $stdout.string

      expect(output).to include('1 | 2 | 3')
      expect(output).to include('4 | 5 | 6')
      expect(output).to include('7 | 8 | 9')
    end
  end

  context 'Asking the user for a move:' do
    $stdout = StringIO.new

    it 'displays "Choose a position from 1-9"' do
      display = display_setup
      allow($stdin).to receive(:gets).and_return('1')

      display.ask_for_move
      output = $stdout.string

      expect(output).to include('Choose a position from 1-9:')
    end
  end

  context 'Displaying the current player:' do
    $stdout = StringIO.new

    it 'displays "The current player is x"' do
      display = display_setup
      display.show_current_player('x', 'Computer')
      output = $stdout.string

      expect(output).to include('x (Computer), play a move:')
    end
  end

  context 'Displays a message when a user enters an incorrect move:' do
    $stdout = StringIO.new

    it 'Displays "You have entered an invalid move. Please try again:"' do
      display = display_setup
      display.invalid_move_message
      output = $stdout.string

      expect(output)
        .to include('You have entered an invalid move. Please try again:')
    end
  end

  context 'Displays message, depending on game outcome' do
    $stdout = StringIO.new

    it "displays 'x is the winner!' when the outcome is x" do
      display = display_setup
      outcome = 'x'

      display.show_game_outcome(outcome)
      output = $stdout.string

      expect(output).to include('x is the winner!')
    end

    it "displays 'The game is a tie!\n' when the outcome is a tie" do
      display = display_setup
      outcome = 'tie'

      display.show_game_outcome(outcome)
      output = $stdout.string

      expect(output).to include('The game is a tie!')
    end
  end

  context 'Displays messages after game has ended ' do
    $stdout = StringIO.new

    it 'displays "Play again? (Y/N):"' do
      display = display_setup
      allow($stdin).to receive(:gets).and_return('Y')

      display.ask_play_again
      output = $stdout.string

      expect(output).to include('Play again? (Y/N):')
    end

    it 'displays "Thanks for playing Tic Tac Toe!"' do
      display = display_setup
      display.show_exit_message
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end

  context 'Game options ' do
    $stdout = StringIO.new

    it 'displays the available game options a user can select' do
      display = display_setup
      display.show_welcome_message
      output = $stdout.string

      expect(output)
        .to include("Let's play Tic Tac Toe!")
    end

    it 'displays "Invalid game option selected. Please try again:"' do
      display = display_setup
      display.show_invalid_option_message
      output = $stdout.string

      expect(output)
        .to include('Invalid option selected. Please try again:')
    end

    it 'displays reminder about saving and exiting a game' do
      display = display_setup
      allow(display).to receive(:sleep)
      display.save_exit_message
      output = $stdout.string

      expect(output)
        .to include("Type 'save' during your turn to save the current game")
      expect(output)
        .to include("Type 'exit' during your turn to exit the game without saving")
    end
  end

  context 'Player types ' do
    $stdout = StringIO.new

    it "displays 'Please select player 1 (h = human, c = computer):'" do
      display = display_setup
      display.ask_for_player_selection(1)
      output = $stdout.string

      expect(output)
        .to include('Please select player 1 (h = human, c = computer):')
    end

    it "displays 'Please select player 2 (h = human, c = computer):'" do
      display = display_setup
      display.ask_for_player_selection(2)
      output = $stdout.string

      expect(output)
        .to include('Please select player 2 (h = human, c = computer):')
    end
  end

  context 'Computer move ' do
    $stdout = StringIO.new

    it "displays 'Computer (x) is thinking. Please wait...'" do
      display = display_setup
      display.show_computer_thinking('x')
      output = $stdout.string

      expect(output)
        .to include('Computer (x) is thinking. Please wait...')
    end

    it 'displays "Computer (o) has selected position 3"' do
      display = display_setup
      display.show_computer_move(3, 'o')
      output = $stdout.string

      expect(output)
        .to include('Computer (o) has selected position 3')
    end
  end

  context 'Game type display ' do
    $stdout = StringIO.new

    it "displays 'Please enter 'new' to start a new game, or 'existing' to load an existing game:'" do
      display = display_setup
      display.game_type_prompt
      output = $stdout.string

      expect(output)
        .to include("Please enter 'new' to start a new game, or 'existing' to load an existing game:")
    end

    it "displays 'Invalid game type. Please enter 'new' or 'existing'':" do
      display = display_setup
      display.invalid_game_type_message
      output = $stdout.string

      expect(output)
        .to include("Invalid game type. Please enter 'new' or 'existing':")
    end

    it "displays 'Existing games: game1, game2':" do
      display = display_setup
      display.existing_game_names(%w[game1 game2])
      output = $stdout.string

      expect(output)
        .to include('Existing games: game1, game2')
    end
  end

  context 'Game saving messages ' do
    $stdout = StringIO.new

    it "displays 'A saved game with this name already exists. Please enter another name:" do
      display = display_setup
      display.game_name_exists_message
      output = $stdout.string

      expect(output)
        .to include('A saved game with this name already exists. Please enter another name:')
    end

    it "displays 'Current game saved!'" do
      display = display_setup
      allow(display).to receive(:sleep)
      display.save_game_confirmation
      output = $stdout.string

      expect(output)
        .to include('Current game saved!')
    end
  end
end
