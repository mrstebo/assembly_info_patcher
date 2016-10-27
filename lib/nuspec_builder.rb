require_relative 'nuspec_builder/assembly_info'
require_relative 'nuspec_builder/nuspec_template'

module NuspecBuilder
  def self.build(project_dir, tokens = {})
    assembly_info = AssemblyInfo.new(File.open("#{project_dir}/Properties/AssemblyInfo.cs") {|f| f.read})
    merged_tokens = tokens.merge({
      id: assembly_info.assembly_product.gsub(/\s+/, ""),
      version: assembly_info.assembly_version.split('.').take(3).join('.'),
      title: assembly_info.assembly_title,
      author: assembly_info.assembly_company,
      description: assembly_info.assembly_description,
      copyright: assembly_info.assembly_copyright
    })
    builder = NuspecTemplate.new(merged_tokens)
    builder.render
  end
end
