require './lib/marver/rest/error.rb'

describe Marver::REST::Error do
  let(:error) { Marver::REST::Error.new({ "code" => "404", "status" => "Not found."}) }

  it '#code - the http status code of the error' do
    expect(error.code).to eq 404
  end

  it '#status - description of the error' do
    expect(error.status).to eq "Not found."
  end

end
