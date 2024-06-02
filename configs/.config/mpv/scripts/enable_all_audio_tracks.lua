function enable_all_audio_tracks()
    local aid_count = 0
    local lavfi_complex = ""
    for _, track in pairs(mp.get_property_native('track-list')) do
        if track.type == 'audio' then
            lavfi_complex = lavfi_complex .. "[aid" .. track.id .. "]"
            aid_count = aid_count + 1
        end
    end
    if aid_count < 2 then
        return
    end
    lavfi_complex = lavfi_complex .. "amix=inputs=" .. aid_count .. "[ao]"
    mp.set_property("lavfi-complex", lavfi_complex)
end

mp.register_event("file-loaded", enable_all_audio_tracks)

mp.register_event("end-file", function ()
    mp.set_property("lavfi-complex", "")
end)
