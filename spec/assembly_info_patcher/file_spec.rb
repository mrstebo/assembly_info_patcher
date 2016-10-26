require 'spec_helper'
require 'assembly_info_patcher/file'

describe AssemblyInfoPatcher::File do
  describe '#to_s' do
    it 'should return xml element' do
      file = AssemblyInfoPatcher::File.new('./bin/Release/*.dll', 'lib')
      expect(file.to_s).to eq '<file src="./bin/Release/*.dll" target="lib" />'
    end
  end
end
