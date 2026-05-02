# Laptop Setup

## Prerequisites

Install [laptop](https://github.com/thoughtbot/laptop) to set up the base development environment.

---

## 1. Set Up Git SSH Key

a. Generate a new SSH key and start the ssh-agent:

```bash
ssh-keygen -t rsa -b 4096 -C "info@thrivewithnaomi.com"
eval "$(ssh-agent -s)"
```

b. Create an SSH config file:

```bash
touch ~/.ssh/config
open ~/.ssh/config
```

Add the following to the config file:

```text
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
```

c. Add your SSH private key to the ssh-agent and store your passphrase in the keychain:

```bash
ssh-add --apple-use-keychain ~/.ssh/id_rsa
```

d. Copy the public key and [add it to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent):

```bash
pbcopy < ~/.ssh/id_rsa.pub
```

---

## 2. Configure Git

```bash
git config --global user.name "Naomi Galinski"
git config --global user.email "info@thrivewithnaomi.com"
```

---

You're now ready to clone repos, commit, and push changes.

---

## 3. Set Up iTerm2 and Zsh

See [Customizing your Terminal — Becoming a zsh Power User](https://medium.com/@sammykerridge/customizing-your-terminal-becoming-a-zsh-power-user-d9a8aab5aad0) for reference.

1. Check that the zsh path in `zsh/.zshrc` is correct for your machine:

    ```bash
    export ZSH="/Users/naomigalinski/.oh-my-zsh"
    ```

2. You can run the full setup script to automate the steps below:

    ```bash
    ./iterm-zsh-setup.sh
    ```

    Or follow the steps manually:

3. Install Oh My Zsh:

    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

4. Install iTerm2:

    ```bash
    brew install --cask iterm2
    ```

5. Verify you're using the correct zsh:

    ```bash
    which zsh
    # Output should be: /usr/local/bin/zsh
    ```

6. Install Powerline fonts:

    ```bash
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    ```

7. Install the zsh-syntax-highlighting plugin:

    ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```

8. Install the zsh-autosuggestions plugin:

    ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions \
      ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    ```

9. Add the plugins to your `~/.zshrc` file:

    ```text
    plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions
    )
    ```

10. Enable iTerm2 shell integration:

    ```bash
    curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
    ```

11. Install powerlevel10k and follow the terminal configuration prompts:

    ```bash
    git clone https://github.com/romkatv/powerlevel10k.git \
      ~/.oh-my-zsh/custom/themes/powerlevel10k
    ```

12. Compare the `copy.zshrc` file with the `~/.zshrc` file, edit and reload shell:

    ```bash
    source ~/.zshrc
    ```

13. Remove the "last login" message from new terminal tabs:

    ```bash
    touch ~/.hushlogin
    ```

---

## 4. Configure iTerm2

1. Import the iTerm profile: **iTerm2 > Preferences > Profiles > Other Actions > Import JSON Profiles** and select `iterm2/Naomi_profile.json`.
    - Recommended color themes: 3024 Night, Argonaut, or Cobalt2.
    - For ligature support, install and set the [FiraCode font](https://github.com/tonsky/FiraCode), then check **Use Ligatures**.

2. [Download and import iTerm2 color schemes](https://github.com/mbadolato/iTerm2-Color-Schemes):

    ```bash
    git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git
    ```

    Go to **Preferences > Profiles > Colors > Color Presets** and import the desired theme from the `schemes` folder.

3. Additional iTerm2 settings:
    - **Preferences > Startup**: Set to "Use System Window Restoration Setting" to reopen all tabs on restart.
    - (Already configured in Naomi_profile.json settings?) **Preferences > Profiles > Keys > Key Bindings > Presets**: Select "Natural Text Editing".

---

## 5. Set Up Visual Studio Code

1. [Download VS Code](https://code.visualstudio.com).

2. Enable the `code` command for VS Code via **Command Palette > Shell Command: Install 'code' command in PATH**.

3. (Check if I still need to do this stel) Copy the terminal settings file (iTerm, zsh, and font settings) to the VS Code user directory:

    ```bash
    cp ~/gitRepos/laptop-setup/vscode/settings.json ~/Library/Application\ Support/Code/User/
    ```

4. (Check if I still need to do this stel) Install [Powerline fonts for the VS Code terminal](https://lingt.xyz/blog/2019/09/13/vscode-terminal-powerline/).

5. Install the following extensions:
    - markdownlint
    - GitLens
