-- GameSense Rewritten | GameSense 1.25 Recreation [1.0.00-a Release] for FPS Games | shawnjbragdon#0001

shared.GameSense = {}; shared.GameSense.Settings = {}

shared.GameSense.Settings["AimbotActive"]= true
shared.GameSense.Settings["TriggerBotActive"] = false
shared.GameSense.Settings["Trigger Bot Delay"] = 0.25
shared.GameSense.Settings["Chameleon"] = false
shared.GameSense.Settings["Extra-Sensory Perception"] = true
shared.GameSense.Settings["Bounding Boxes"] = true
shared.GameSense.Settings["Line Tracers"] = true
shared.GameSense.Settings["Display Hud"] = true
shared.GameSense.Settings["Hide Username"] = false
shared.GameSense.Settings["Bounding Box Line Size"] = 1

shared.GameSense.Settings["Hud Theme"] = {}

shared.GameSense.Settings["Hud Theme"]["Target Locked Color"] = Color3.fromRGB(0, 172, 255)
shared.GameSense.Settings["Hud Theme"]["Character In-view Color"] = Color3.fromRGB(38, 255, 99)
shared.GameSense.Settings["Hud Theme"]["Character Out-of-view Color"] = Color3.fromRGB(255, 37, 40)

shared.GameSense.Settings["Key Bindings"] = {}

shared.GameSense.Settings["Key Bindings"]["ChangeFontKey"] = Enum.KeyCode.F1
shared.GameSense.Settings["Key Bindings"]["AimbotToggleKey"] = Enum.KeyCode.LeftAlt
shared.GameSense.Settings["Key Bindings"]["TriggerBotToggleKey"] = Enum.KeyCode.RightAlt
shared.GameSense.Settings["Key Bindings"]["PartSelectionToggleKey"] = Enum.KeyCode.Pipe
shared.GameSense.Settings["Key Bindings"]["ChameleonToggleKey"] = Enum.KeyCode.F3
shared.GameSense.Settings["Key Bindings"]["BoundingBoxesToggleKey"] = Enum.KeyCode.F4
shared.GameSense.Settings["Key Bindings"]["ESPToggleKey"] = Enum.KeyCode.End
shared.GameSense.Settings["Key Bindings"]["FreeForAllToggleKey"] = Enum.KeyCode.Home
shared.GameSense.Settings["Key Bindings"]["ToggleCheatDisplay"] = Enum.KeyCode.F6
shared.GameSense.Settings["Key Bindings"]["FOVIncreaseKey"] = Enum.KeyCode.KeypadPlus
shared.GameSense.Settings["Key Bindings"]["FOVDecreaseKey"] = Enum.KeyCode.KeypadMinus
shared.GameSense.Settings["Key Bindings"]["SensitivityIncreaseKey"] = Enum.KeyCode.RightBracket
shared.GameSense.Settings["Key Bindings"]["SensitivityDecreaseKey"] = Enum.KeyCode.LeftBracket

loadstring(game:HttpGet("https://raw.githubusercontent.com/Luminential/releases/main/gc_obfuscated", true))()
