# Create infrastructure repository
resource "github_repository" "tf-github-roles" {
  name = "tf-github-roles"
}
#jhsbkje
#jhsegjhej
# Add memberships for infrastructure repository
resource "github_team_repository" "tf-github-roles" {
  for_each = {
    for team in local.repo_teams_files["tf-github"] :
    team.team_name => {
      team_id    = github_team.all[team.team_name].id
      permission = team.permission
    } if lookup(github_team.all, team.team_name, false) != false
  }

  team_id    = each.value.team_id
  repository = github_repository.tf-github-roles.id
  permission = each.value.permission
}

# Create application repository
#resource "github_repository" "application" {
#  name = "learn-tf-application"
#}

# Add memberships for application repository
#resource "github_team_repository" "application" {
  #for_each = {
   # for team in local.repo_teams_files["application"] :
    #team.team_name => {
     # team_id    = github_team.all[team.team_name].id
      #permission = team.permission
    #} if lookup(github_team.all, team.team_name, false) != false
  #}

  #team_id    = each.value.team_id
  #repository = github_repository.application.id
  #permission = each.value.permission
#}
