class GameBroadcastJob < ApplicationJob
  queue_as :default

  def perform(action, object)
    send(action, object)
  end

  def updated(game)
    ActionCable.server.broadcast "game-#{game.id}",
      game: game,
      status: "updated",
      is_ready: game.is_ready?,
      dynamic: {
        good_chars: render_good_chars(game),
        bad_chars: render_bad_chars(game)
      }
  end

  private
    def render_bad_chars(game)
      ApplicationController.renderer.render partial: 'characters/game/bad_chars', locals: { game: game }
    end
    def render_good_chars(game)
      ApplicationController.renderer.render partial: 'characters/game/good_chars', locals: { game: game }
    end

end
