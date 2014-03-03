require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Story do
  describe "Attributes" do

    let(:credentials) { Marver::Credentials.new("priv_key", 'pub_key') }
    let(:json) { fixture('story.json').read }
    let(:response) { Marver::REST::Response.new(json) }
    let(:data_container) { Marver::DataContainer.new(response) }
    let(:story) { Marver::Story.new(data_container.results, credentials) }

    it "#title - The story title." do
      expect(story.title).to eq "Cover #892"
    end

    it "#type - The story type e.g. interior story, cover, text story." do
      expect(story.type).to eq "cover"
    end

    it "#resource_uri - The canonical URL identifier for this resource." do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      expect(story.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/892?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
    end

    it '#description - A short description of the story.' do
      expect(story.description).to eq ""
    end

    it '#thumbnail - The representative image for this story.' do
      expect(story.description).to eq ""
    end

    it '#comics - A resource list containing comics in which this story takes place.' do
      expect(story.comics.class).to eq Array
      expect(story.comics.first.class).to eq Marver::ComicSummary
      expect(story.comics.first.name).to eq "Thor (1998) #81"
    end

    it '#series - A resource list containing series in which this story appears.' do
      expect(story.series.class).to eq Array
      expect(story.series.first.class).to eq Marver::SerieSummary
      expect(story.series.first.name).to eq "Thor (1998 - 2004)"
    end

    it '#events - A resource list of the events in which this story appears.' do
      expect(story.events.class).to eq Array
      expect(story.events.first.class).to eq Marver::EventSummary
      expect(story.events.first.name).to eq "Avengers Disassembled"
    end

    it '#characters - A resource list of characters which appear in this story.' do
      expect(story.characters.class).to eq Array
      expect(story.characters.first.class).to eq Marver::CharacterSummary
      expect(story.characters.first.name).to eq "Avengers"
    end

    it '#creators - A resource list of creators who worked on this story.' do
      expect(story.creators.class).to eq Array
      expect(story.creators.first.class).to eq Marver::CreatorSummary
      expect(story.creators.first.name).to eq "Steve Epting"
    end

    it '#original_issue - A summary representation of the issue in which this story was originally published.' do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      expect(story.original_issue.class).to eq Marver::ComicSummary
      expect(story.original_issue.name).to eq "Thor (1998) #81"
      expect(story.original_issue.resource_uri).to eq "http://gateway.marvel.com/v1/public/comics/715?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
    end

  end
end
