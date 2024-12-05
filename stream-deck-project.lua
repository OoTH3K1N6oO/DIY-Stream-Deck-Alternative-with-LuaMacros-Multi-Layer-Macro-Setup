-- Assign a logical name to the macro keyboard
-- Replace 'MACROS' with the physical ID of your keyboard if you already know it
-- Example: lmc_assign_keyboard('123456789') where '123456789' is the keyboard ID
lmc_assign_keyboard('MACROS')

-- Uncomment the following block to display the keyboard ID every time a key is pressed
-- This is useful to find the ID if you are unsure
-- lmc_set_handler('MACROS', function(button, direction, device)
--     if direction == 0 then   -- Trigger only when the key is pressed down
--         print("Key pressed. Keyboard ID: " .. device)
--     end
-- end)


-- Define the total number of layers (pages) and the current layer
local totalLayers = 3  -- Change this value to the total number of layers you need
local currentLayer = 1 -- Start from layer 1

-- Function to generate a table of keys for the macro keyboard
local function generateKeyTable()
    return {
        -- Function keys (F1-F5)
        [112] = function() print('F1 pressed on layer ' .. currentLayer) end,  -- F1
        [113] = function() print('F2 pressed on layer ' .. currentLayer) end,  -- F2
        [114] = function() print('F3 pressed on layer ' .. currentLayer) end,  -- F3
        [115] = function() print('F4 pressed on layer ' .. currentLayer) end,  -- F4
        [116] = function() print('F5 pressed on layer ' .. currentLayer) end,  -- F5

        -- Number and symbol keys
        [192] = function() print('` pressed on layer ' .. currentLayer) end,   -- ` (backtick)
        [49]  = function() print('1 pressed on layer ' .. currentLayer) end,   -- 1
        [50]  = function() print('2 pressed on layer ' .. currentLayer) end,   -- 2
        [51]  = function() print('3 pressed on layer ' .. currentLayer) end,   -- 3
        [52]  = function() print('4 pressed on layer ' .. currentLayer) end,   -- 4
        [53]  = function() print('5 pressed on layer ' .. currentLayer) end,   -- 5

        -- Alphabetic keys
        [81] = function() print('Q pressed on layer ' .. currentLayer) end,  -- Q
        [87] = function() print('W pressed on layer ' .. currentLayer) end,  -- W
        [69] = function() print('E pressed on layer ' .. currentLayer) end,  -- E
        [82] = function() print('R pressed on layer ' .. currentLayer) end,  -- R
        [84] = function() print('T pressed on layer ' .. currentLayer) end,  -- T
        [89] = function() print('Y pressed on layer ' .. currentLayer) end,  -- Y
        [85] = function() print('U pressed on layer ' .. currentLayer) end,  -- U
        [73] = function() print('I pressed on layer ' .. currentLayer) end,  -- I
        [79] = function() print('O pressed on layer ' .. currentLayer) end,  -- O
        [80] = function() print('P pressed on layer ' .. currentLayer) end,  -- P
        [65] = function() print('A pressed on layer ' .. currentLayer) end,  -- A
        [83] = function() print('S pressed on layer ' .. currentLayer) end,  -- S
        [68] = function() print('D pressed on layer ' .. currentLayer) end,  -- D
        [70] = function() print('F pressed on layer ' .. currentLayer) end,  -- F
        [71] = function() print('G pressed on layer ' .. currentLayer) end,  -- G
        [72] = function() print('H pressed on layer ' .. currentLayer) end,  -- H
        [74] = function() print('J pressed on layer ' .. currentLayer) end,  -- J
        [75] = function() print('K pressed on layer ' .. currentLayer) end,  -- K
        [76] = function() print('L pressed on layer ' .. currentLayer) end,  -- L
        [90] = function() print('Z pressed on layer ' .. currentLayer) end,  -- Z
        [88] = function() print('X pressed on layer ' .. currentLayer) end,  -- X
        [67] = function() print('C pressed on layer ' .. currentLayer) end,  -- C
        [86] = function() print('V pressed on layer ' .. currentLayer) end,  -- V
        [66] = function() print('B pressed on layer ' .. currentLayer) end,  -- B
        [78] = function() print('N pressed on layer ' .. currentLayer) end,  -- N
        [77] = function() print('M pressed on layer ' .. currentLayer) end,  -- M

        -- Special keys
        [27]  = function() print('ESC pressed on layer ' .. currentLayer) end,   -- ESC
        [9]   = function() print('TAB pressed on layer ' .. currentLayer) end,   -- TAB
        [20]  = function() print('Caps Lock pressed on layer ' .. currentLayer) end, -- Caps Lock
        [16]  = function() print('Shift pressed on layer ' .. currentLayer) end, -- Shift
        [32]  = function() print('Space pressed on layer ' .. currentLayer) end, -- Space
    }
end

-- Create a table for each layer
local layers = {}
for i = 1, totalLayers do
    layers[i] = generateKeyTable()
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- **Example on how to modify/add macros:**
-- You can modify these keys or add new ones by using the same pattern. For example:
-- layers[layerNumber][keyCode] = function() [action] end
-- Where:
-- 'layerNumber' is the number of the layer (e.g., 1 for layer 1, 2 for layer 2, etc.)
-- 'keyCode' is the key you want to assign a macro to (e.g., 49 for '1', 90 for 'Z', etc.)
-- [action] is the Lua function or command you want to execute when that key is pressed (e.g., lmc_spawn(), lmc_send_keys()).

-- **General Example:**
-- Let's say you want to add a macro for the 'Q' key (keycode 81) on layer 1 that opens a browser:
-- layers[1][81] = function() os.execute('start chrome') end -- Open Chrome with the Q key on layer 1

-- Modify keys for level 1
layers[1][49] = function() lmc_spawn("spotify") end  -- 1 spotify
layers[1][88]  = function() lmc_send_keys('^x') end  -- x cut
layers[1][67]  = function() lmc_send_keys('^c') end  -- c copy
layers[1][86]  = function() lmc_send_keys('^v') end  -- v paste
layers[1][90]  = function() lmc_send_keys('^z') end  -- z undo

-- Modify keys for level 2
layers[2][49]  = function() lmc_spawn("C:\\Users\\Username\\AppData\\Local\\Discord\\Update.exe --processStart Discord.exe") end  -- Discord
layers[2][90]  = function() lmc_send_keys('^+m') end  -- Z mute microphone
layers[2][88]  = function() lmc_send_keys('^+d') end  -- X Discord overlay


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Function to switch between layers
local function changeLayer(direction)
    if direction == "left" then
        currentLayer = (currentLayer - 1) < 1 and totalLayers or (currentLayer - 1)
    elseif direction == "right" then
        currentLayer = (currentLayer + 1) > totalLayers and 1 or (currentLayer + 1)
    end
    print("Current layer: " .. currentLayer)
end

-- General key handler
lmc_set_handler('MACROS', function(button, direction)
    if direction == 0 then  -- Trigger on key press
        local func = layers[currentLayer][button]
        if func then
            func()
        end
    end
end)

-- Use left Ctrl and left Alt to switch layers
local leftCtrl = 17  -- Left Ctrl key
local leftAlt = 18   -- Left Alt key

lmc_set_handler('MACROS', function(button, direction)
    if button == leftCtrl then
        if direction == 0 then
            changeLayer("left")
        end
    elseif button == leftAlt then
        if direction == 0 then
            changeLayer("right")
        end
    end
end)

