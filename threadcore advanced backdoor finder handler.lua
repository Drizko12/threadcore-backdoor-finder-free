-- actual checks and shit handlers

local function scanForBackdoors()
    -- hold suspicious scripts
    local suspiciousScripts = {}

    local suspiciousKeywords = {
        "loadstring",
        "load(",
        "loadfile",
        "require",
        "HttpGet",
        "HttpPost"
    }

    local function scanScripts(instance)
        for _, child in pairs(instance:GetChildren()) do
            if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
                local source = nil
                local success, result = pcall(function()
                    return child.Source
                end)

                if success and result then
                    source = result:lower()  -- lowercase for case-insensitive check

                    -- check for suspicious keywords
                    for _, keyword in pairs(suspiciousKeywords) do
                        if source:find(keyword) then
                            table.insert(suspiciousScripts, child)
                            break  -- found a keyword, no need to check more for this script
                        end
                    end
                end
            end

            -- recursively scan children
            scanScripts(child)
        end
    end

    -- start scanning from these places
    local placesToScan = {
        game.Workspace,
        game.ReplicatedStorage,
        game.ServerScriptService,
        game.StarterPlayer,
        game.StarterGui,
        game.ServerStorage
    }

    for _, place in pairs(placesToScan) do
        scanScripts(place)
    end

    if #suspiciousScripts > 0 then
        print("we found suspicious scripts! 🔥")
        for _, scriptInstance in pairs(suspiciousScripts) do
            print("sus script: " .. scriptInstance:GetFullName())
        end
        return "loadstring check passed"
    else
        print("No suspicious scripts found.")
        return "none"
    end
end
