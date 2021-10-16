#make a text file for gh-repos.txt
git@github.com:johnxandr/CurieTeam-HB.git
gh-repos.txt = ("git@github.com:johnxandr/CurieTeam-HB.git")
xargs -n1 git clone < gh-repos.txt
