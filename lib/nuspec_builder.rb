class NuspecBuilder
  def initialize(project_dir)
    @project_dir = project_dir
  end

  def build(tokens = {})
    builder = NuspecTemplate.new(tokens.merge({
      id: assembly_info.assembly_product.gsub(/\s+/, ""),
      version: assembly_info.assembly_version.split('.').take(3).join('.'),
      title: assembly_info.assembly_title,
      author: assembly_info.assembly_company,
      description: assembly_info.assembly_description,
      copyright: assembly_info.assembly_copyright
    }))
    builder.render
  end

  private

  def assembly_info
    @assembly_info ||= AssemblyInfo.new(File.open("#{@project_dir}/Properties/AssemblyInfo.cs") {|f| f.read})
  end
end

require 'nuspec_builder/all'
