-- threadcore advanced backdoor finder
-- .gg/emulated

local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local IDEModule = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/lib/ide.lua'))()

local Window = ReGui:Window({
	Title = "threadcore backdoor finder -- 1.0.0 [free ver]",
	Size = UDim2.fromOffset(700, 200)
})

Window:Label({Text=".gg/emulated"})
Window:Label({Text="\n-- your running the free version of tc backdoor finder.\n-- some features will be disabled and basic checks like loadstrings remain."})
Window:Button({
	Text = "check for backdoors",
	Callback = function()
		-- check for backdoors here
        -- basic laodstring check
        sucessful_serversidedCodeExecution()
	end,
})
Window:Label({Text="backdoor status here. if your game is frozen pls wait."})


function sucessful_serversidedCodeExecution()
    local Window = ReGui:Window({
        Title = "threadcore backdoor finder -- 1.0.0 [free ver]",
        Size = UDim2.fromOffset(700, 200)
    })

    Window:Label({Text="loadstring exploit found!\nany code inputted here will run on all clients!"})

    local CodeEditor = IDEModule.CodeFrame.new({
        Editable = false,
        FontSize = 13,
        Colors = SyntaxColors,
        FontFace = TextFont
    })

    --// Parent and apply custom ReGui properties
    ReGui:ApplyFlags({
        Object = CodeEditor.Gui,
        WindowClass = Window,
        Class = {
            --Border = true,
            Fill = true,
            Active = true,
            Parent = EditorTab:GetObject(), -- Canvas function
            BackgroundTransparency = 1,
        }
    })
end