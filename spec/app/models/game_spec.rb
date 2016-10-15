require 'rails_helper'

describe Game do
  before do
    @bob = User.create(username: "Bob", email: "bob@bob.net", password: "123456", password_confirmation: "123456")
    @fred = User.create(username: "Fred", email: "fred@fred.net", password: "123456", password_confirmation: "123456")
  end

  context "creating a game" do
    context "with valid creation information" do
      it 'should have a creator' do
        @game = Game.new(name: "Capture the Flag XIV", lat: 51.01245, lng: 42.16462, description: "Flagging", creator_id: @bob.id, start_time: "2016-10-14 11:23:00", end_time: "2016-10-14 11:23:00")
        @game.save
        expect(@game).to be_valid
      end
    end
    it 'should not be valid without a creator' do
      @game = Game.create(name: "Capture the Flag XIV", lat: 51.01245, lng: 42.16462, description: "Flagging", start_time: "2016-10-14 11:23:00", end_time: "2016-10-14 11:23:00")
      expect(@game).to_not be_valid
      expect(@game.errors.messages.keys).to include(:creator)
      expect(@game.errors.messages).equal?(["A game must have a registered creator"])
    end

    it 'should not be valid without a lat and lng' do
      @game = Game.create(name: "Capture the Flag XIV", creator_id: @bob.id, description: "Flagging", start_time: "2016-10-14 11:23:00", end_time: "2016-10-14 11:23:00")
      expect(@game).to_not be_valid
      expect(@game.errors.messages.keys).to include(:missing_latitude)
      expect(@game.errors.messages.keys).to include(:missing_longitude)
      expect(@game.errors.messages).equal?(["A game must have a latitude"])
      expect(@game.errors.messages).equal?(["A game must have a longitude"])
    end

  end

  context "destroying a game" do

  end


end

