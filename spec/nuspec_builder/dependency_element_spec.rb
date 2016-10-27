require 'spec_helper'
require 'nuspec_builder/dependency_element'

describe NuspecBuilder::DependencyElement do
  describe '#to_s' do
    it 'should return xml element' do
      dependency = NuspecBuilder::DependencyElement.new('Test', '1.0')
      expect(dependency.to_s).to eq '<dependency id="Test" version="1.0" />'
    end
  end
end
