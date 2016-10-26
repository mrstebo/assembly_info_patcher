require 'spec_helper'
require 'assembly_info_patcher/nuspec_builder'

describe AssemblyInfoPatcher::NuspecBuilder do
  describe '#build' do
    it 'should build the contents for a nuspec file' do
      tokens = {
        id: 'TestApp',
        version: '1.0.0',
        title: 'Test App',
        author: 'mrstebo'
      }
      nuspec_builder = AssemblyInfoPatcher::NuspecBuilder.new(tokens)
      expect(nuspec_builder.build).to eq %q{<?xml version="1.0"?>
<package>
  <metadata>
    <id>TestApp</id>
    <version>1.0.0</version>
    <title>Test App</title>
    <authors>mrstebo</authors>
    <owners>mrstebo</owners>
    <licenseUrl></licenseUrl>
    <projectUrl></projectUrl>
    <iconUrl></iconUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <description></description>
    <releaseNotes></releaseNotes>
    <copyright></copyright>
    <tags></tags>
    <dependencies>
    </dependencies>
  </metadata>
  <files>
  </files>
</package>}
    end
  end
end
