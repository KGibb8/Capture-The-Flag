require 'rails_helper'

describe UserGame do
  before do
    @bob = User.create(username: "Bob", email: "bob@bob.net", password: "123456", password_confirmation: "123456")
    @fred = User.create(username: "Fred", email: "fred@fred.net", password: "123456", password_confirmation: "123456")
    @game = Game.create(name: "Capture the Flag XIV", lat: 51.01245, lng: 42.16462, description: "Flagging", creator_id: @bob.id, start_time: "2016-10-14 11:23:00", end_time: "2016-10-14 11:23:00")
  end

  context 'creating a UserGame' do
    context 'with valid information' do
      it 'should not be valid when user has already joined this game' do
        @usergame1 = UserGame.create(game_id: @game.id, user_id: @fred.id)
        @usergame2 = UserGame.create(game_id: @game.id, user_id: @fred.id)
        expect(@usergame1).to be_valid
        expect(@usergame2).to_not be_valid
        expect(@usergame2.errors.messages.keys).to include(:duplicate)
        expect(@usergame2.errors.messages).equal?(["You are already registered to attend this game"])
      end
    end
  end

  context 'arriving at a UserGame' do
    context 'calling the is_present method' do
      it 'should set the is_present to true' do
  
      end
      it 'should automatically assign a each user_game a team' do

      end
    end
  end

end

