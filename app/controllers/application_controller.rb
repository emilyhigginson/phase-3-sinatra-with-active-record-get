class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
    # get all the games from the database
    # return a JSON response with an array of all the game data
  end
  get '/games/:id' do
    # look up the game in the database using its ID
    game = Game.find(params[:id])
    game.to_json(include: { reviews: { include: :user } })

    # send a JSON-formatted response of the game data

  end

end
