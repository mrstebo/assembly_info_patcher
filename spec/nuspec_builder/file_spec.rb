require 'spec_helper'
require 'nuspec_builder/file'

describe NuspecBuilder::File do
  describe '#to_s' do
    it 'should return xml element' do
      file = NuspecBuilder::File.new('./bin/Release/*.dll', 'lib')
      expect(file.to_s).to eq '<file src="./bin/Release/*.dll" target="lib" />'
    end
  end
end
