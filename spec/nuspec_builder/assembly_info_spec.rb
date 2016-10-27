require 'spec_helper'
require 'nuspec_builder/assembly_info'

DATA = %q{using System.Reflection;
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
[assembly: AssemblyVersion("1.0.0.0")]
[assembly: AssemblyFileVersion("1.0.0.0")]}

describe NuspecBuilder::AssemblyInfo do
  before do
    allow(File).to receive(:open).with('AssemblyInfo.cs').and_return(DATA)
  end

  describe '#assembly_title' do
    it 'should extract the AssemblyTitle' do
      assembly_info = NuspecBuilder::AssemblyInfo.new('AssemblyInfo.cs')
      expect(assembly_info.assembly_title).to eq 'Test App'
    end
  end

  describe '#assembly_description' do
    it 'should extract the AssemblyDescription' do
      assembly_info = NuspecBuilder::AssemblyInfo.new('AssemblyInfo.cs')
      expect(assembly_info.assembly_description).to eq 'Test Description'
    end
  end

  describe '#assembly_company' do
    it 'should extract the AssemblyCompany' do
      assembly_info = NuspecBuilder::AssemblyInfo.new('AssemblyInfo.cs')
      expect(assembly_info.assembly_company).to eq 'mrstebo'
    end
  end

  describe '#assembly_version' do
    it 'should extract the AssemblyVersion' do
      assembly_info = NuspecBuilder::AssemblyInfo.new('AssemblyInfo.cs')
      expect(assembly_info.assembly_version).to eq '1.0.0.0'
    end
  end

  describe '#assembly_file_version' do
    it 'should extract the AssemblyFileVersion' do
      assembly_info = NuspecBuilder::AssemblyInfo.new('AssemblyInfo.cs')
      expect(assembly_info.assembly_file_version).to eq '1.0.0.0'
    end
  end
end
