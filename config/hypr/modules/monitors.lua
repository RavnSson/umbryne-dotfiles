------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

--Monitor Central
hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@180.00",
    position = "0x0",
    scale    = "1",
})

--Monitor Izquierda
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@74.97",
    position = "-1920x0",
    scale    = "1",
})