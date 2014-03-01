require './lib/marver/entities/summaries/comic_summary'
require './lib/marver/credentials'

describe Marver::ComicSummary do
  let(:credentials) { Marver::Credentials.new('pub_key', 'priv_key') }
  let(:comic_summary) { Marver::ComicSummary.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" }, credentials) }

  it '#id' do
    expect(comic_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(comic_summary.resource_uri).to eq "http://example.net?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#type should always be nil' do
    expect(comic_summary.type).to eq nil
  end

  it '#name' do
    expect(comic_summary.name).to eq "Hulk"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do
      pending
    end
  end
end
