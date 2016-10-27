class NuspecBuilder::FileElement
  def initialize(src, target)
    @src = src
    @target = target
  end

  def to_s
    "<file src=\"#{@src}\" target=\"#{@target}\" />"
  end
end
