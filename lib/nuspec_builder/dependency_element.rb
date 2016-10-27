class NuspecBuilder::DependencyElement
  def initialize(id, version)
    @id = id
    @version = version
  end

  def to_s
    "<dependency id=\"#{@id}\" version=\"#{@version}\" />"
  end
end
