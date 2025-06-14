# 🛠️ dotfiles
🏠 Personal dotfiles for Linux and Windows OS.

<!-- _⚠️ Note: If needed switch to a specific branch for a particular OS config._ -->

## Get started

#### Create *~/dotfiles* folder.
```bash
mkdir ~/dotfiles
```

#### Run git command to create git bare repository.
```bash
# initialize git bare repo in ~/dotfiles
git init --bare
```

#### Add alias to `.bashrc`,`.zsh` or any other terminal app you use.
```bash
# Linux/Unix
echo "alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
```

- Add that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```bash
# Create this .gitignore in `$HOME` 
echo "dotfiles" >> .gitignore
```

### **Windows**
To make custom PowerShell aliases persistent, you should add them to your PowerShell profile. Here's how to do it:

⚡ Note: Open PowerShell as adminstrator.
1. First, check if you already have a PowerShell profile:

```powershell
Test-Path $PROFILE
```

2. If it returns False, create a new profile (returns true then follow skip this step):
```powershell
New-Item -Path $PROFILE -Type File -Force
```

3. Open your PowerShell profile in a text editor (like vim):
```powershelll
notepad $PROFILE
```

4. Add your custom aliases to the profile file. For example:
```powershell
function config {
    git --git-dir="$HOME\dotfiles" --work-tree="$HOME" $args
}
```

5. Save the file and close the editor.

6. Reload your PowerShell profile:
```powershell
. $PROFILE
```

**Now you can use `config` in PowerShell just like you would use `config` in Linux/Unix. For example:**
```powershell
config status
config add .bashrc
config commit -m "Update .bashrc"
```


- Run command to config Untrack file in git
```bash
config config --local status.showUntrackedFiles no
```




## Installing your dotfiles onto a new system (or migrate to this setup)

If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

- Before the installation make sure you have committed the alias to your `.bashrc`, `.zsh` and `powershell`:

```bash
# Linux/Unix
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

```

```powershell
# Windows PowerShell
function config {
    git --git-dir="$HOME\dotfiles" --work-tree="$HOME" $args
}
```

- Add that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```bash
# Create this .gitignore in `$HOME` 
echo "dotfiles" >> .gitignore
```

- Now clone your dotfiles into a bare repository in a "_dotfiles_" folder of your `$HOME`:

```bash
git clone --bare https://github.com/chamannarved/dotfiles.git  $HOME/dotfiles
```

- Define the alias in the current shell scope:

```bash
alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

- Checkout the actual content from the bare repository to your `$HOME`:

```bash
config checkout
```

- The step above might fail with a message like:

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because of `$HOME` folder might already have some stock configuration files that Git would overwrite. The solution is simple: back up the files if you care about them, and remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

- Re-run the checkout if you had problems:

```bash
config checkout
```

- Set the flag `showUntrackedFiles` to `no` on this specific (local) repository:

```bash
config config --local status.showUntrackedFiles no
```

- You're done, from now on you can now type `config` commands to add and update your dotfiles:

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```


## Create a script
Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script, store it as a GitHub snippet, create a short URL for it and call it like this:

```bash
curl -Lks <Github-snippet-link> | /bin/bash
```

**Script code**

```bash
git clone --bare https://github.com/chamannarved/dotfiles.git $HOME/dotfiles

# Linux/Unix
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'" >> $HOME/.bashrc

mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dotfiles.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
