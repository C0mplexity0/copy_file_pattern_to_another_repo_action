# copy_file_pattern_to_another_repo_action
This GitHub Action copies a file, or a series of files, from the current repository to a location in another repository

This is a fork of [dmnemec/copy_file_to_another_repo_action](https://github.com/dmnemec/copy_file_to_another_repo_action), with the only difference being that it works with glob patterns rather than just single files.

# Example Workflow
```yaml
name: Push File

on: push

jobs:
  copy-file:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: Pushes test file
      uses: c0mplexity0/copy_file_pattern_to_another_repo_action@main
      env:
        API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
      with:
        source_pattern: './testfiles/foo.!(rst)'
        destination_repo: 'c0mplexity0/release-test'
        destination_folder: 'test-dir'
        user_email: 'example@email.com'
        user_name: 'c0mplexity0'
        commit_message: 'A custom message for the commit'
```

# Variables

The `API_TOKEN_GITHUB` needs to be set in the `Secrets` section of your repository options. You can retrieve the `API_TOKEN_GITHUB` [here](https://github.com/settings/tokens) (set the `repo` permissions).

* source_pattern: The glob pattern of the files or directories to be moved. Uses the same syntax as the `rsync` command. Incude the path for any files not in the repositories root directory.
* destination_repo: The repository to place the file or directory in.
* destination_folder: [optional] The folder in the destination repository to place the file in, if not the root directory.
* user_email: The GitHub user email associated with the API token secret.
* user_name: The GitHub username associated with the API token secret.
* destination_branch: [optional] The branch of the source repo to update, if not "main" branch is used.
* destination_branch_create: [optional] A branch to be created with this commit, defaults to commiting in `destination_branch`
* commit_message: [optional] A custom commit message for the commit. Defaults to `Update from https://github.com/${GITHUB_REPOSITORY}/commit/${GITHUB_SHA}`
* use_rsync: [optional] Uses `rsync -avh` instead of `cp -R` to perform the base operation. Currently works as an experimental feature (due to lack of testing) but can speed up updates to large collections of files with many small changes by only syncing the changes and not copying the entire contents again. Please understand your use case before using this, and provide feedback as issues if needed.

# Behavior Notes
The action will create any destination paths if they don't exist. It will also overwrite existing files if they already exist in the locations being copied to. It will not delete the entire destination repository.
