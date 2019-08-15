from github import Github
import sys

repoName = str(sys.argv[1])
g = Github("Your access token")  # access token
u = g.get_user()
repo = u.create_repo(repoName)
print(f"Successfully created a repository named {repoName}")
