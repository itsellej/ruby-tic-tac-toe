class Controller
  def initialize(game)
    @game = game
  end

  def play
    while @game.can_continue_playing? do @game.play_move end
    @game.tie_or_won
  end
end
