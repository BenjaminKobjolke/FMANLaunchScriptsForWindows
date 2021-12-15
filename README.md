## LaunchScripts Plugin

Plugin for [fman.io](https://fman.io) that gives you the ability to launch scripts in a specified directory in the command pallet of fman. 

I forked this plugin from [raguay](https://github.com/raguay/LaunchScripts) to make it compatible with windows.

# Install
install the plugin by copying the release to 
> %AppData%\Roaming\fman\Plugins\User

Or just use the "install plugin" function from within fman and search for FMANLaunchScriptsForWindows.


### Usage

Once loaded, use the `set script directory` command to set a directory where all your scripts will be placed. The default location is `~/bin`. Then use the other commands to interact with the scripts.

### Example bat file
```
@echo off
setlocal enabledelayedexpansion

set argCount=0
for %%x in (%*) do (
	set /A argCount+=1
	set "argVec[!argCount!]=%%~x"
)

echo Number of arguments to process: %argCount%

for /L %%i in (1,1,%argCount%) do (	
	REM !argVec[%%i] will either contain all the files or it will be just the directory,
	REM if no files were selected
	echo %%i- "!argVec[%%i]!"
	REM add your command here
)

pause
```
When you launch a script and you have files selected, then those files will be send as paremters to your script.

If you didn't select any file your current pane's directory will be send as first parameter.


#### HotKeys Set

None set.

#### Commands

`go to scripts dir`
This command will open the current pane to the scripts directory.

> currently not working on windows - disabled for now
`set show output`
This command will set the plug-in to show the output of running a script.

> currently not working on windows - disabled for now
`set not show output`
This command will set the plug-in to not show the output of running a script.

> currently not working on windows - disabled for now
`set not show output`
This command will set the plug-in to not show the output of running a script.

`set script directory`
This command sets the currently highlighted directory as the script directory for running and creating scripts.

> currently not working on windows - disabled for now
`set shell script`
This command allows the user to tell the plugin what script is their shell's initializing script. You can give it `~/.zshrc` and it will expand it to the absolute path. This is used to setup the proper environment for running the scripts.

`launch script`
This command will run a script out of the script directory. A list of script files in the script directory will be presented to the user. Once selected, that script will be ran.

`edit script`
This command will allow the user to edit the script selected. A list of scripts in the scripts directory will be presented to the user to choose from. Once selected, the `open with editor` command will be used to edit the file.

`create script`
This command will ask for a script name. If a file or directory doesn't exist with that name, it will be created, a base script template will be written to it, the execution bit will be set, and the `open with editor` command will be called to edit the newly created script.

`launch npm script`
This command will list all the npm scripts listed in the current directory's package.json file. It will then run the script the user selects from that list.

`run command line`
This command will prompt the user for a command line string. That string will be ran and the results display if the `set show output` is set. These command lines can use the following environment variables:

Currently there is one special variable you ca use:
$1 is the selected file

Executing del $1 for example would delete the currenlty selected file.

The commands are sorted and similar command lines are removed to compact the history. Therefore, you can run the same command many times, but it will be in the history only once. Unfortunately, this doesn't preserve the order of command execution.

#### Files Created and Used

New script files will be created in the user specified scripts directory when the `create script` command is issued.

### Example Scripts

Here you can find the examples: 
[https://github.com/BenjaminKobjolke/FMANLaunchScriptsForWindows/tree/master/examples](https://github.com/BenjaminKobjolke/FMANLaunchScriptsForWindows/tree/master/examples) of scripts that I use with this plugin. Give them a try and add your own!

### Features

- Set a scripts directory to store scripts.
- Launch scripts from the script directory.
- Edit scripts in the scripts directory.
- Create new scripts in the scripts directory.
- Run a command line and save them in a history buffer.

### Features Still in the Works

- Launch a NPM script in a directory with a `package.json` file.
