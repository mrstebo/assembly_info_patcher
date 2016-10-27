class NuspecBuilder::NuspecTemplate
  def initialize(tokens)
    @tokens = tokens
  end

  def render
    template
      .gsub(/\$id\$/, id)
      .gsub(/\$version\$/, version)
      .gsub(/\$title\$/, title)
      .gsub(/\$author\$/, author)
      .gsub(/\$license_url\$/, license_url)
      .gsub(/\$project_url\$/, project_url)
      .gsub(/\$icon_url\$/, icon_url)
      .gsub(/\$require_license_acceptance\$/, require_license_acceptance)
      .gsub(/\$description\$/, description)
      .gsub(/\$release_notes\$/, release_notes)
      .gsub(/\$copyright\$/, copyright)
      .gsub(/\$tags\$/, tags)
      .gsub(/\$dependencies\$/, dependencies)
      .gsub(/\$files\$/, files)
      .each_line.reject {|line| line.strip == ''}
      .join
      .strip
  end

  private

  def template
    @template ||= File.open("#{__dir__}/templates/template.nuspec") {|f| f.read}
  end

  def id
    @tokens[:id]
  end

  def version
    @tokens[:version]
  end

  def title
    @tokens[:title]
  end

  def author
    @tokens[:author]
  end

  def license_url
    @tokens.fetch(:license_url, '')
  end

  def project_url
    @tokens.fetch(:project_url, '')
  end

  def icon_url
    @tokens.fetch(:icon_url, '')
  end

  def require_license_acceptance
    @tokens.fetch(:require_license_acceptance, false).to_s
  end

  def description
    @tokens.fetch(:description, '')
  end

  def release_notes
    @tokens.fetch(:release_notes, '')
  end

  def copyright
    @tokens.fetch(:copyright, '')
  end

  def tags
    @tokens.fetch(:tags, '')
  end

  def dependencies
    @tokens.fetch(:dependencies, []).map(&:to_s).join("\n      ")
  end

  def files
    @tokens.fetch(:files, []).map(&:to_s).join("\n    ")
  end
end
