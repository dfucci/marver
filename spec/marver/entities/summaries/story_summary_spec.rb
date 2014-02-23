require './lib/marver/entities/summaries/story_summary'
require './lib/marver/credentials'

describe Marver::StorySummary do
  let(:credentials) { Marver::Credentials.new('pub_key', 'priv_key') }
  let(:story_summary) { Marver::StorySummary.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" }, credentials) }

  it '#id' do
    expect(story_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(story_summary.resource_uri).to eq "http://example.net?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
  end

  it '#type should always be nil' do
    expect(story_summary.type).to eq nil
  end

  it '#name' do
    expect(story_summary.name).to eq "Hulk"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do
      pending
    end
  end
end
