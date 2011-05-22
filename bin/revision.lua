#!/usr/bin/env lua
-- vim: set sw=4 ts=4 tw=78 et si:
-- version.lua - get base and current version

mtn_au = io.popen('mtn automate get_base_revision_id')
base_rev = mtn_au:read('*l')
mtn_au = io.popen('mtn ls changed')
changed = mtn_au:read('*a')
if 0 == string.len(changed) then
    curr_rev = base_rev
else
    mtn_au = io.popen('mtn automate get_current_revision_id')
    curr_rev = mtn_au:read('*l')
end
print(':Autor: Mathias Weidner')
print(':Datum: ' .. os.date('%Y-%m-%d'))
print(':Basisrevision: ' .. base_rev)
print(':Aktuelle Revision: ' .. curr_rev)
print(':Lizenz: CC BY-SA 3.0 (Creative Commons)')
