require 'spec_helper'

ASSEMBLY_INFO_DATA = %q{using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("Test App")]
[assembly: AssemblyDescription("Test Description")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("mrstebo")]
[assembly: AssemblyProduct("Test App")]
[assembly: AssemblyCopyright("Copyright ©  2016")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]

// Setting ComVisible to false makes the types in this assembly not visible
// to COM components.  If you need to access a type in this assembly from
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(false)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("7fa231b0-a24b-416d-bffa-e142c7012cc7")]

// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Build and Revision Numbers
// by using the '*' as shown below:
// [assembly: AssemblyVersion("1.0.0.0")]
[assembly: AssemblyVersion("1.2.3.0")]
[assembly: AssemblyFileVersion("1.2.3.1")]}

describe NuspecBuilder do
  describe '#build' do
    let(:nuspec_builder) { NuspecBuilder.new('TestApp') }

    before do
      allow(File).to receive(:open).and_call_original
      allow(File).to receive(:open)
        .with('TestApp/Properties/AssemblyInfo.cs')
        .and_return(ASSEMBLY_INFO_DATA)
    end

    it 'should return the contents for a nuspec file' do
      tokens = {
        license_url: 'license_url',
        project_url: 'project_url',
        icon_url: 'icon_url',
        require_license_acceptance: true,
        release_notes: 'release_notes',
        tags: 'test app',
        dependencies: [
          NuspecBuilder::DependencyElement.new('Library1', '1.0.0'),
          NuspecBuilder::DependencyElement.new('Library2', '1.1.0')
        ],
        files: [
          NuspecBuilder::FileElement.new('./bin/Release/*.dll', 'lib'),
          NuspecBuilder::FileElement.new('./bin/Release/*.ico', 'lib')
        ]
      }
      expect(nuspec_builder.build(tokens)).to eq %q{<?xml version="1.0"?>
<package>
  <metadata>
    <id>TestApp</id>
    <version>1.2.3</version>
    <title>Test App</title>
    <authors>mrstebo</authors>
    <owners>mrstebo</owners>
    <licenseUrl>license_url</licenseUrl>
    <projectUrl>project_url</projectUrl>
    <iconUrl>icon_url</iconUrl>
    <requireLicenseAcceptance>true</requireLicenseAcceptance>
    <description>Test Description</description>
    <releaseNotes>release_notes</releaseNotes>
    <copyright>Copyright ©  2016</copyright>
    <tags>test app</tags>
    <dependencies>
      <dependency id="Library1" version="1.0.0" />
      <dependency id="Library2" version="1.1.0" />
    </dependencies>
  </metadata>
  <files>
    <file src="./bin/Release/*.dll" target="lib" />
    <file src="./bin/Release/*.ico" target="lib" />
  </files>
</package>}
    end
  end
end
