require 'spec_helper'

describe NuspecBuilder::FileElement do
  describe '#to_s' do
    it 'should return xml element' do
      file = NuspecBuilder::FileElement.new('./bin/Release/*.dll', 'lib')
      expect(file.to_s).to eq '<file src="./bin/Release/*.dll" target="lib" />'
    end
  end
end
