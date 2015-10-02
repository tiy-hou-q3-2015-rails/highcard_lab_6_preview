class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find params[:id]
  end

  def hit
    @game = Game.find params[:id]
    # add a card to each hand?
    @game.player_hand.cards << @game.deck.first
    @game.dealer_hand.cards << @game.deck.second
    redirect_to game_path(id: @game.id)
  end

  def create
    @game = Game.create
    @game.build_cards
    player_hand = Hand.create game_id: @game.id, player: true
    dealer_hand = Hand.create game_id: @game.id, player: false


    player_hand.cards << @game.deck.first
    dealer_hand.cards << @game.deck.second



    redirect_to game_path(id: @game.id)
  end
end
