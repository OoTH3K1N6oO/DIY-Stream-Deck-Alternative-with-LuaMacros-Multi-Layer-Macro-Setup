# DIY-Stream-Deck-Alternative-with-LuaMacros-Multi-Layer-Macro-Setup

Hi everyone! 👋
I've been working on a project to turn a secondary keyboard into a DIY stream deck using LuaMacros, with support for multiple layers/pages—a feature I noticed is often missing in similar projects. Each layer acts as a "profile" for different macros, and you can switch between them using specific keys (e.g., Left Ctrl to go left, Left Alt to go right). The script is flexible and highly customizable!

The only caveat is that it doesn't have a GUI, so you'll need to modify the code yourself. However, the comments in the script make it easier to understand and tweak for your needs.

Features:
Multi-layer support: Think of each layer as a profile for custom macros, switchable via dedicated keys (Left Ctrl and Left Alt).
Keyboard ID assignment: Avoid configuring the keyboard every time by directly setting its ID in the script.
Cost-effective solution: No need for expensive hardware like a stream deck—just repurpose an old keyboard!
Why it’s cool:
While it lacks the GUI of a traditional stream deck, it offers similar functionality for those who prefer a keyboard-first workflow. It’s perfect for gamers, programmers, or anyone who loves automation.

If you're interested, feel free to try it out and let me know your thoughts! I'm also open to suggestions for improving the script or adding new features.

# List of Useful Macro Functions for Customizable Keybinds and Automation

Here's the list of common macros you can add, with examples of how to implement them. These macros cover actions like sending keys, launching applications, system management, and copy-paste operations.

Macros for Sending Keys
Sending Key Combinations:

layers[1][49] = function() lmc_send_keys('^c') end  -- Ctrl + C (Copy)
layers[1][50] = function() lmc_send_keys('^v') end  -- Ctrl + V (Paste)
layers[1][51] = function() lmc_send_keys('^x') end  -- Ctrl + X (Cut)
layers[1][52] = function() lmc_send_keys('^z') end  -- Ctrl + Z (Undo)
layers[1][53] = function() lmc_send_keys('^y') end  -- Ctrl + Y (Redo)
layers[1][27] = function() lmc_send_keys('esc') end  -- ESC
layers[1][13] = function() lmc_send_keys('enter') end  -- Enter
Key Combinations for Applications:

Open Browser:
layers[1][81] = function() os.execute('start chrome') end  -- Q: Open Chrome
Volume Control (Windows):
layers[1][65] = function() lmc_send_keys('^+v') end  -- A: Volume up (Ctrl + Shift + V)
layers[1][83] = function() lmc_send_keys('^+b') end  -- S: Volume down (Ctrl + Shift + B)
Macros for Launching Programs
Launch a Specific Application:

layers[2][49] = function() lmc_spawn("C:\\Path\\To\\App.exe") end  -- 1: Launch a custom app
layers[2][50] = function() lmc_spawn("C:\\Program Files\\Notepad++\\notepad++.exe") end  -- 2: Launch Notepad++
Open a Folder:

layers[2][51] = function() os.execute('start C:\\Users\\username\\Documents\\') end  -- 3: Open a specific folder
Macros for System Management
Shutdown or Restart the Computer:

layers[3][49] = function() os.execute('shutdown -s -f -t 0') end  -- 1: Immediate shutdown
layers[3][50] = function() os.execute('shutdown -r -f -t 0') end  -- 2: Immediate restart
Lock the Computer:

layers[3][51] = function() os.execute('rundll32.exe user32.dll,LockWorkStation') end  -- 3: Lock the computer
Macros for Productivity Applications
Manage Application Windows:
Minimize Active Window:
layers[1][57] = function() lmc_send_keys('^w') end  -- 9: Ctrl + W (Close window)
Maximize Active Window:
layers[1][58] = function() lmc_send_keys('^+up') end  -- 0: Ctrl + Shift + Up arrow (Maximize window)
Macros for Discord or Communication Apps
Mute/Unmute Microphone in Discord:

layers[2][49] = function() lmc_send_keys('^+m') end  -- 1: Mute/Unmute microphone in Discord (Ctrl + Shift + M)
layers[2][50] = function() lmc_send_keys('^+d') end  -- 2: Enable/Disable Discord overlay (Ctrl + Shift + D)
Launch Discord Directly:

layers[2][51] = function() lmc_spawn("C:\\Users\\user\\AppData\\Local\\Discord\\Update.exe --processStart Discord.exe") end  -- 3: Launch Discord
Macros for File Management
Copy, Move, or Delete Files:
Copy a File:
layers[1][57] = function() os.execute('copy C:\\path\\to\\file.txt D:\\path\\to\\destination\\') end  -- 9: Copy a file
Delete a File:
layers[1][58] = function() os.execute('del C:\\path\\to\\file.txt') end  -- 0: Delete a file
Macros for Game or Application Automation
Game Scripts:
Simulate Mouse Clicks (if supported by the library):
layers[2][65] = function() lmc_mouse_click(1) end  -- A: Left mouse click
layers[2][83] = function() lmc_mouse_click(2) end  -- S: Right mouse click
Macros for Web Navigation
Switch Browser Tabs:
Go to the Next Tab:
layers[1][60] = function() lmc_send_keys('^+{TAB}') end  -- F1: Go to the next tab
Go to the Previous Tab:
layers[1][61] = function() lmc_send_keys('^+{SHIFT}{TAB}') end  -- F2: Go to the previous tab
Macros for Clipboard Management
Copy to Clipboard:

layers[1][67] = function() lmc_send_keys('^c') end  -- C: Copy to clipboard
Clear Clipboard (if needed):

Clear the Clipboard:
layers[3][67] = function() os.execute('echo off | clip') end  -- C: Clear clipboard
Macros for Streaming Applications
Launch a Streaming App (e.g., OBS Studio):
layers[3][49] = function() lmc_spawn("C:\\Program Files\\obs-studio\\bin\\64bit\\obs64.exe") end  -- 1: Launch OBS Studio
These are just some examples of the macros you can add. Of course, you can combine these commands to create more complex macros depending on your needs.
