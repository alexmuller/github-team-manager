require 'array_diff'
require 'octokit'
require 'yaml'

class GitHubTeamManager
  def self.manage config_file, owners_file
    config = YAML.load_file(config_file)

    client = Octokit::Client.new(access_token: config['access_token'])

    owners_team = client.org_teams(config['org']).find do |team|
      team.name == 'Owners'
    end

    current_owners = client.team_members(owners_team.id).map do |user|
      user.login
    end

    requested_owners = YAML.load_file(owners_file)['owners']

    diff = ArrayDiff.new(current_owners, requested_owners)

    if diff.has_differences?
      puts "Updating owners:"
      puts diff.pretty_print

      diff.additions.each do |username|
        client.add_team_member(owners_team.id, username)
      end

      diff.removals.each do |username|
        client.remove_team_member(owners_team.id, username)
      end
    else
      puts "No changes to owners."
    end
  end
end
