# VIM

VIM and NVIM are terminal based text editors that are very powerful.

## Install Config

The /nvim folder contains my NeoVIM configuration. Do the following to immediately install it.

```sh
cd ~/Downloads
git clone https://github.com/Mooshy-Swags/nvim
mv nvim/nvim ~/.config
rm -rf nvim
```

### Etymology

NeoVIM started off as Vi (Visual), then got VIM (Vi IMproved) then we got NeoVIM

## Usage

VIM and NVIM both run on the terminal, and sit within the terminal. Most customisations therefore come from the terminal environment.

both of them use the same basic command structure, therefore, from here on, I will simply be describing only the base NVIM configuration and will be refering to it as vim for convenience.

I am really not using vim in the "correct" way either, since most people use it completely without the mouse, but my configuration adds mouse compatability for convenience.

## Key commands

Everything in vim is done through key commands. Some are simple one character commands, some can be more complex.

We denote key commands using <>. Examples are:
```
<c> -> Just the letter c.
<C-w> -> CTRL + w
<M-a> -> ALT + a
<S-p> -> SHIFT + p
```

<> are called chords. Doesn't matter, but sometimes useful to know the names.

Some commands need an initial chord, then another chord afterwards. This is called a sequential, with a leader and a follower.

```
"<C-w>v"
```

The above would be a CTRL + w followed by a v. These key commands will be denoted in the above way from now on. 


# Modes

vim comes with 4 main "modes" that it can be in.

The ways to enter each mode is at the top of each section.

The main heirarchy of modes is:

> Normal > Insert > Visual > Command

Very nice to know. Exiting a mode is always using ESC and will return you to either Insert or Normal (which ever was last used)

## Normal

The normal view is the standard view that we always start from. We move to other modes from here.

Here, we can use simple key combinations to do many different things.

### Cursor

```
<h> // Left
<j> // Down
<k> // Up
<l> // Right
```

 The standard arrow keys also work, but the hjkl movement is much closer to the default finger locations, making them faster to work with. We can also enter a number before the entering of these keys to move that many spots.

Example:
```
5 l
```
Moves you 5 spots to the left from the cursor.

The cursor, which is a thick bar hovers over the character and shows which one it is on. Editing the text itself requires you to be in Insert Mode. (Covered later)

It is also possible to go to the front and back of the line you are on using:

```
<0>
<$>
```

and for moving to the first and last lines of the file:

```
<g>g
<S-g>
```
<$>
The <g> header is used for a lot more things, but here, we'll leave it at just going to the first line.

You can delete what's being hovered using:

```
<x>
```

There are key commands for replacing text but that's less useful IMO.

### Window

Anything to do with making or modifying windows is done using the starter:

```
<C-w>
```

Splitting a window horizontally, then vertically:

```
<C-w>s
<C-w>v
```

which is just doing CTRL + w then s or v.

There is also changing the size of the menu, which uses

```
<C-w><
<C-w>>
```

Where it just uses < and > for size changing. You can also specify the number of characters this should extend the window size by.

---

These are the main Normal mode actions you may do. There are many other options in Normal mode, which you can find yourself if you need.

## Insert

Wow, we took this long to finally type something in a text editor. Entering Insert mode is done in two ways.

```
<a>
<i>
```

being append and insert respectively.

The append mode places the cursor right after the Normal mode hover, and the insert places right before. Both buttons do the same thing in bringing you to Insert mode, however, sometimes, you want to differentiate between the two modes.

## Visual

The name is very bad. It is a selection mode. Basically all the things you can do when grabbing a selection of text in any other situation. 

Visual mode is entered by doing

```
<v>
```

starting the selection on the selected character.

Entering Visual mode from Insert will return you to Insert after exiting Visual. Now, the only real way to enter Visual while in Insert is by using the mouse.

### Copy

Copying in vim is called a yank, which normally is done with <y> header, but my NVIM setup includes a <C-c> copy command.

### Paste

Use <C-S-v> as default on vim.

### Re-select

The <g> header comes back!

```
<g>v
```

in Normal mode actually re-selects the last selected Visual. Very useful.

## Command

We're finally at the scary one.

Command is entered using

```
<:>
```

It is like a mini vim terminal. It has many features, especially ones that are fundamentally required to use vim to its fullest.

### Saving and exiting

It's taken this long to talk about saving the file and exiting. Vim supports file caching, which keeps any file saved while the vim environment is running. Unless force quit, even if you move out of a file, the file will remain changed, even if unsaved.

My NVIM configuration comes with a file viewer called neo-tree, which allows you to see if files are unsaved.

Trying to exit vim without saving will cause a command error, and stops you from leaving. 

Exiting is done by

```
:q
```

where : is entered automatically upon entering Command mode. (This is visible in normal vim or unconfigured nvim. My config has a cool commandline that doesn't show :).

saving is done with

```
:w
```

and you can combine them.

```
:wq
```

which writes and quits.

You can also batch quit using

```
:qa
:wqa
```

Now if you want to void the saved cache, without saving the file, you can simply quit with

```
:q!
:qa!
```

Some forcing is sometimes needed when a file acts up.

