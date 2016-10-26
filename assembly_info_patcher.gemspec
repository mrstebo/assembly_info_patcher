Gem::Specification.new do |s|
  s.name        = 'assembly_info_patcher'
  s.version     = '0.1.0'
  s.date        = '2016-10-26'
  s.summary     = 'Assembly Info Patcher'
  s.description = 'A ruby script for generating a generic nuspec file for a .NET project'
  s.authors     = ['mrstebo']
  s.email       = 'mrstebouk@gmail.com'
  s.files       = [
    'lib/assembly_info_patcher.rb',
    'lib/assembly_info_patcher/assembly_info.rb',
    'lib/assembly_info_patcher/dependency.rb',
    'lib/assembly_info_patcher/file.rb',
    'lib/assembly_info_patcher/nuspec_file.rb',
    'lib/assembly_info_patcher/templates/template.nuspec'
  ]
  s.homepage    = 'http://rubygems.org/gems/assembly_info_patcher'
  s.license     = 'MIT'
end
