require 'spec_helper'
require 'nuspec_builder/dependency'

describe NuspecBuilder::Dependency do
  describe '#to_s' do
    it 'should return xml element' do
      dependency = NuspecBuilder::Dependency.new('Test', '1.0')
      expect(dependency.to_s).to eq '<dependency id="Test" version="1.0" />'
    end
  end
end
