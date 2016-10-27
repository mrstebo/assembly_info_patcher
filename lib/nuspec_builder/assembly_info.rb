class NuspecBuilder::AssemblyInfo
  def initialize(assembly_info)
    @assembly_info = assembly_info
  end

  def assembly_title
    @assembly_title ||= extract_value('AssemblyTitle')
  end

  def assembly_description
    @assembly_description ||= extract_value('AssemblyDescription')
  end

  def assembly_configuration
    @assembly_configuration ||= extract_value('AssemblyConfiguration')
  end

  def assembly_company
    @assembly_company ||= extract_value('AssemblyCompany')
  end

  def assembly_product
    @assembly_product ||= extract_value('AssemblyProduct')
  end

  def assembly_copyright
    @assembly_copyright ||= extract_value('AssemblyCopyright')
  end

  def assembly_trademark
    @assembly_trademark ||= extract_value('AssemblyTrademark')
  end

  def assembly_culture
    @assembly_culture ||= extract_value('AssemblyCulture')
  end

  def com_visible
    @com_visible ||= extract_value('ComVisible', 'false')
  end

  def guid
    @guid ||= extract_value('Guid')
  end

  def assembly_version
    @assembly_version ||= extract_value('AssemblyVersion')
  end

  def assembly_file_version
    @assembly_file_version ||= extract_value('AssemblyFileVersion')
  end

  private

  def extract_value(name, default_value = '')
    match = @assembly_info.match(/^\[assembly:\s#{name}\("?(.*?)"?\)\]$/)
    return match[1] if match
    return default_value
  end
end
