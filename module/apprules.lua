-- Focus urgent windows
client.connect_signal("property::urgent", function(c)
    c.minimized = false
    c:jump_to()
end)
