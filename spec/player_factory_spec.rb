RSpec.describe PlayerFactory do
  describe 'Create players:' do
    it "creates a human player with a mark 'x' and the name 'human'" do
      allow($stdin).to receive(:gets).and_return('h')
      player_factory = player_factory_setup

      new_player = player_factory.create_player('x', 1)

      expect(new_player).to be_an_instance_of(HumanPlayer)
      expect(new_player.mark).to eq('x')
      expect(new_player.name).to eq('Human')
    end

    it "creates a computer player a with mark 'o' and the name 'computer'" do
      allow($stdin).to receive(:gets).and_return('c')
      player_factory = player_factory_setup
      display = display_setup

      new_player = player_factory.create_player('o', 2)

      expect(new_player).to be_an_instance_of(ComputerPlayer)
      expect(new_player.mark).to eq('o')
      expect(new_player.name).to eq('Computer')
    end
  end
end
