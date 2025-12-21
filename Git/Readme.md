# Git Cheat Sheet

## Quick Reference Guide

### SETUP
Configuring user information used across all local repositories

```bash
git config --global user.name "[firstname lastname]"
# Set a name that is identifiable for credit when review version history

git config --global user.email "[valid-email]"
# Set an email address that will be associated with each history marker

git config --global color.ui auto
# Set automatic command line coloring for Git for easy reviewing
```

### SETUP & INIT
Configuring user information, initializing and cloning repositories

```bash
git init
# Initialize an existing directory as a Git repository

git clone [url]
# Retrieve an entire repository from a hosted location via URL
```

### STAGE & SNAPSHOT
Working with snapshots and the Git staging area

```bash
git status
# Show modified files in working directory, staged for your next commit

git add [file]
# Add a file as it looks now to your next commit (stage)

git reset [file]
# Unstage a file while retaining the changes in working directory

git diff
# Diff of what is changed but not staged

git diff --staged
# Diff of what is staged but not yet committed

git commit -m "[descriptive message]"
# Commit your staged content as a new commit snapshot
```

### BRANCH & MERGE
Isolating work in branches, changing context, and integrating changes

```bash
git branch
# List your branches. A * will appear next to the currently active branch

git branch [branch-name]
# Create a new branch at the current commit

git checkout [branch-name]
# Switch to another branch and check it out into your working directory

git merge [branch]
# Merge the specified branch's history into the current one

git log
# Show all commits in the current branch's history
```

### SHARE & UPDATE
Retrieving updates from another repository and updating local repos

```bash
git remote add [alias] [url]
# Add a git URL as an alias

git fetch [alias]
# Fetch down all the branches from that Git remote

git merge [alias]/[branch]
# Merge a remote branch into your current branch to bring it up to date

git push [alias] [branch]
# Transmit local branch commits to the remote repository branch

git pull
# Fetch and merge any commits from the tracking remote branch
```

### TRACKING PATH CHANGES
Versioning file removes and path changes

```bash
git rm [file]
# Delete the file from project and stage the removal for commit

git mv [existing-path] [new-path]
# Change an existing file path and stage the move

git log --stat -M
# Show all commit logs with indication of any paths that moved
```

### TEMPORARY COMMITS
Temporarily store modified, tracked files in order to change branches

```bash
git stash
# Save modified and staged changes

git stash list
# List stack-order of stashed file changes

git stash pop
# Write working from top of stash stack

git stash drop
# Discard the changes from top of stash stack
```

### INSPECT & COMPARE
Examining logs, diffs and object information

```bash
git log
# Show the commit history for the currently active branch

git log branchB..branchA
# Show the commits on branchA that are not on branchB

git log --follow [file]
# Show the commits that changed file, even across renames

git diff branchB...branchA
# Show the diff of what is in branchA that is not in branchB

git show [SHA]
# Show any object in Git in human-readable format
```

### REWRITE HISTORY
Rewriting branches, updating commits and clearing history

```bash
git rebase [branch]
# Apply any commits of current branch ahead of specified one

git reset --hard [commit]
# Clear staging area, rewrite working tree from specified commit
```

### IGNORING PATTERNS
Preventing unintentional staging or committing of files

```bash
git config --global core.excludesfile [file]
# System wide ignore pattern for all local repositories
```

Create a `.gitignore` file with desired patterns:

```
logs/
*.notes
pattern*/
```

---

## 📚 Resources

- **Official Git Documentation:** [git-scm.com](https://git-scm.com)
- **GitHub Learning Lab:** [github.com/skills](https://github.com/skills)
- **GitHub Education:** [education.github.com](https://education.github.com)

---

## 📖 Original PDF

For the complete official cheat sheet with additional details, please refer to the original PDF:
[GitHub Education Git Cheat Sheet PDF](https://education.github.com/git-cheat-sheet-education.pdf)