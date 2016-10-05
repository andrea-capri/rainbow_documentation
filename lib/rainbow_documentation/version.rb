def current_git_tag
  current_tag = `git describe --tags --exact-match`

  current_tag.empty? ? nil : current_tag
end

# Automates versioning for gem releases
class RainbowDocumentation
  VERSION = current_git_tag
  RELEASE_DATE = `date +"%Y-%m-%d"`.freeze
end
