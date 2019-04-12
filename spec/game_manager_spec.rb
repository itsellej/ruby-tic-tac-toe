require 'game_manager'

def manager_setup
  player_factory = PlayerFactory
  display = Display.new
  player_validator = PlayerValidator.new(display, player_factory)
  game_factory = GameFactory.new(player_validator)
  controller = Controller.new(display, game_factory)
  GameManager.new(controller, display)
end

RSpec.describe GameManager do
  describe 'Play again: ' do
    it 'returns true if the user inputs "Y"' do
      game_manager = manager_setup
      allow($stdin).to receive(:gets).and_return('Y')

      play_again = game_manager.play_again?

      expect(play_again).to eq(true)
    end

    it 'returns false if the user does not input "Y"' do
      game_manager = manager_setup
      allow($stdin).to receive(:gets).and_return('12')

      play_again = game_manager.play_again?

      expect(play_again).to eq(false)
    end

    it 'displays the exit message when the user inputs n' do
      allow($stdin).to receive(:gets)
        .and_return('h', 'h', '1', '2', '3', '5', '4', '6', '7', '9', '8', 'n')
      game_manager = manager_setup

      $stdout = StringIO.new

      game_manager.play
      output = $stdout.string.split("\n")

      expect(output.last).to eq('Thanks for playing Tic Tac Toe!')
    end
  end
end
