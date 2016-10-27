require 'spec_helper'
require 'nuspec_builder/nuspec_template'

describe NuspecBuilder::NuspecTemplate do
  describe '#render' do
    it 'should render a nuspec file' do
      tokens = {
        id: 'TestApp',
        version: '1.0.0',
        title: 'Test App',
        author: 'mrstebo'
      }
      nuspec_template = NuspecBuilder::NuspecTemplate.new(tokens)
      expect(nuspec_template.render).to eq %q{<?xml version="1.0"?>
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