require 'spec_helper'

describe Marver::EventAttributesMapper do
  let(:json) { fixture('event.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:title]).to eq "Fall of the Mutants"
    expect(mapped_attributes[:description]).to include "The X-Men battled the Adversary in Dallas"
  end 
end