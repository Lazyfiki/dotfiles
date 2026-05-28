local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("ghostty +new-window"))
hl.bind(mainMod .. " + V", hl.dsp.window.close())

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
