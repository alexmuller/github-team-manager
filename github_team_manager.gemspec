Gem::Specification.new do |s|
  s.name     = 'github_team_manager'
  s.version  = '0.0.1'
  s.date     = '2015-05-30'
  s.summary  = 'A gem for managing GitHub team membership'
  s.authors  = ['Alex Muller']
  s.license  = 'MIT'

  s.files = [
    'bin/github_team_manager',
    'lib/array_diff.rb',
    'lib/github_team_manager.rb',
  ]

  s.executables = ['github_team_manager']

  s.add_runtime_dependency 'diffy', '~> 3.0.0'
  s.add_runtime_dependency 'octokit', '~> 3.8.0'
  s.add_runtime_dependency 'trollop', '~> 2.1.0'

  s.add_development_dependency 'rspec', '3.2.0'
end
