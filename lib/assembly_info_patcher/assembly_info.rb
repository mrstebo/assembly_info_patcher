class AssemblyInfoPatcher::AssemblyInfo
  def initialize(assembly_info_file)
    @assembly_info_file = assembly_info_file
  end

  def assembly_title
    @assembly_title ||= extract_value('AssemblyTitle')
  end

  def assembly_description
    @assembly_description ||= extract_value('AssemblyDescription')
  end

  def assembly_company
    @assembly_company ||= extract_value('AssemblyCompany')
  end

  def assembly_version
    @assembly_version ||= extract_value('AssemblyVersion')
  end

  def assembly_file_version
    @assembly_file_version ||= extract_value('AssemblyFileVersion')
  end

  private

  def contents
    @contents ||= File.open(@assembly_info_file) {|f| f.read}
  end

  def extract_value(name)
    match = contents.match(/#{name}\("(.*)"\)/)
    return match[1] if match
    return ''
  end
end
