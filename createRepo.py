from github import Github
import sys

repoName = str(sys.argv[1])
g = Github("6653643be0173ee9e780d1db476ebb7a94e32553")  # access token
u = g.get_user()
repo = u.create_repo(repoName)
print(f"Successfully created a repository named {repoName}")
