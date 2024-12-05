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

### 1. **Open Programs**
   - **Open a program by path**:
     ```lua
     lmc_spawn("C:\\path\\to\\your\\program.exe")
     ```
   - **Open a program with parameters**:
     ```lua
     lmc_spawn("C:\\path\\to\\program.exe --parameter")
     ```

### 2. **Send Keystrokes**
   - **Send a single key press**:
     ```lua
     lmc_send_keys('A')  -- Presses the "A" key
     ```
   - **Send a combination of keys**:
     ```lua
     lmc_send_keys('^c')  -- Sends Ctrl + C (Copy)
     lmc_send_keys('^v')  -- Sends Ctrl + V (Paste)
     lmc_send_keys('^z')  -- Sends Ctrl + Z (Undo)
     ```

### 3. **Control System Functions**
   - **Minimize all windows**:
     ```lua
     lmc_send_keys('^d')  -- Sends Ctrl + D (Minimize all)
     ```
   - **Lock the computer**:
     ```lua
     lmc_send_keys('^l')  -- Sends Ctrl + L (Lock screen)
     ```

### 4. **Browser Control**
   - **Open a URL in the default browser**:
     ```lua
     lmc_spawn("start https://www.example.com")
     ```
   - **Navigate backward in a browser**:
     ```lua
     lmc_send_keys('^[')  -- Sends Ctrl + [ (Browser back)
     ```

### 5. **Media Control**
   - **Play/Pause media**:
     ```lua
     lmc_send_keys('^p')  -- Sends Ctrl + P (Play/Pause)
     ```
   - **Next/Previous media track**:
     ```lua
     lmc_send_keys('^n')  -- Sends Ctrl + N (Next track)
     lmc_send_keys('^b')  -- Sends Ctrl + B (Previous track)
     ```

### 6. **Virtual Desktop Control (Windows)**
   - **Switch between virtual desktops**:
     ```lua
     lmc_send_keys('^#left')  -- Switches to the previous virtual desktop
     lmc_send_keys('^#right') -- Switches to the next virtual desktop
     ```

### 7. **Clipboard Management**
   - **Clear clipboard**:
     ```lua
     os.execute("echo off | clip")  -- Clears the clipboard
     ```
   - **Copy specific text to clipboard**:
     ```lua
     os.execute('echo "Text to copy" | clip')  -- Copies "Text to copy" to clipboard
     ```

### 8. **System Volume Control**
   - **Increase system volume**:
     ```lua
     lmc_send_keys('^up')  -- Increases volume (using the volume hotkeys)
     ```
   - **Decrease system volume**:
     ```lua
     lmc_send_keys('^down')  -- Decreases volume (using the volume hotkeys)
     ```

### 9. **Clipboard Text Operations**
   - **Replace clipboard text**:
     ```lua
     local clipboardText = lmc_clipboard()
     clipboardText = string.gsub(clipboardText, "old", "new")  -- Replace "old" with "new"
     lmc_set_clipboard(clipboardText)
     ```

### 10. **Control Mouse**
   - **Move the mouse to specific coordinates**:
     ```lua
     lmc_move_mouse(x, y)  -- Move mouse to coordinates (x, y)
     ```
   - **Click at a specific location**:
     ```lua
     lmc_mouse_click(x, y)  -- Click the mouse at coordinates (x, y)
     ```

### 11. **System Sleep**
   - **Sleep for a specified time**:
     ```lua
     lmc_sleep(1000)  -- Sleep for 1000 milliseconds (1 second)
     ```

### 12. **Automate Text Entry**
   - **Type a series of characters with a delay**:
     ```lua
     lmc_send_keys("Hello World")  -- Types "Hello World"
     ```

### 13. **Control Wi-Fi**
   - **Turn Wi-Fi on/off (using netsh command)**:
     ```lua
     os.execute("netsh interface set interface 'Wi-Fi' admin=disable")  -- Disable Wi-Fi
     os.execute("netsh interface set interface 'Wi-Fi' admin=enable")   -- Enable Wi-Fi
     ```

### 14. **Control Bluetooth**
   - **Turn Bluetooth on/off (using devmgmt.msc or PowerShell)**:
     ```lua
     os.execute("powershell -Command \"Enable-Bluetooth\"")  -- Enable Bluetooth
     os.execute("powershell -Command \"Disable-Bluetooth\"") -- Disable Bluetooth
     ```

### 15. **Opening Websites**
   - **Open a specific website**:
     ```lua
     lmc_spawn("start https://www.google.com")  -- Opens Google
     ```

### 16. **Running Custom Scripts**
   - **Run a custom script**:
     ```lua
     lmc_spawn("C:\\path\\to\\your\\script.bat")  -- Executes a custom script
     ```
