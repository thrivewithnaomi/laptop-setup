# laptop-setup

1. Install [laptop](https://github.com/thoughtbot/laptop).
2. iTerm, zsh, and VSCode setup. Follow instructions in
https://gist.github.com/kevin-smets/8568070
3. iTerm configs
    * Open all tabs on restart
    * Preferences > Profiles > Keys > Key Mappings > Presets > Natural text editing
    * Add auto-complete using tab key with zsh-autosuggestions plugin
    * Add syntax highlighting with [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
    * Add DEFAULT_USER=$(whoami)
    * Add `code` command for vs code 
4. [Configure SSH keys](Generating a new SSH key and adding it to the ssh-agent) for your GitHub account.
5. Add username and email to git for commits

    ```bash
    git config --global user.name "Naomi Galinski"
    git config --global user.email "naomi.galinski@gmail.com"
    ```
6. Install [Powerline fonts for Visual Studio Code terminal](https://lingt.xyz/blog/2019/09/13/vscode-terminal-powerline/)
 

## First step

1. Install [laptop](https://github.com/thoughtbot/laptop).
2. Set up git ssh key.

    a. Run the following:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "naomi.galinski@gmail.com"

    eval "$(ssh-agent -s)"
    ```

    b. Create a config file and add:

    ```bash
    touch ~/.ssh/config
    open ~/.ssh/config
    ```

    ```text
    Host *
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/id_rsa
    ```

    c. Add your SSH private key to the ssh-agent and store your passphrase in the keychain
    
    ```bash
    ssh-add -K ~/.ssh/id_rsa
    ```
    
    d. Copy `id_rsa` key to GitHub.

    ```bash
    pbcopy < ~/.ssh/id_rsa.pub
    ```

3. Add username and email to gitconfig:

    ```bash
    git config --global user.name "Naomi Galinski"
    git config --global user.email "naomi.galinski@gmail.com"
    ```

4. Create a `gitRepos` folder and cd.
5. Clone `git@github.com:naomigalinski/laptop-setup.git`
6. Go into `zsh/.zshrc` file and check that the following path is correct:

    ```bash
    export ZSH="/Users/naomigalinski/.oh-my-zsh"
    ```

7. Run `./iterm-zsh-setup.sh`
8. [Download and import iterm colour themes.](https://github.com/mbadolato/iTerm2-Color-Schemes)
9. Open `ITerm2 > Preferences > Profiles` and import `iterm2/Naomi_profile.json`
    - Change theme to 3024 Night, Argonaut, or Cobalt2.
    - If you want ligature support get, install, and set the [FiraCode font](https://github.com/tonsky/FiraCode). Select `Use Ligatures` checkbox.
10. Download VSCode.
11. Run `./vscode.sh`.
12. Add following plugins:
    - markdownlint
    - GitLens
