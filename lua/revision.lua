--  revision.lua -- Monotone extension command "mtn revision"
--  usage: mtn --rcfile revision.lua revision

register_command(
    "revision", "",
    "Print info about actual revision.",
    "Determines the base revision and whether the current " ..
    "revision is different. Prints the information " ..
    "suitable for inclusion into restructured text.",
    "command_revision"
)   

function say(abc) io.stdout:write(abc .. "\n") end

function command_revision()
    rc, txt = mtn_automate("get_base_revision_id")
    base_rev = string.match(txt,"%x+")
    if nil == base_rev then
        base_rev = ""
    end
    input, output, pid = spawn_pipe("mtn", "ls", "changed")
    res, rc = wait(pid)
    changed = output:read('*a')
    if 0 == string.len(changed) and "" ~= base_rev then
        curr_rev = base_rev
    else
        rc, txt = mtn_automate("get_current_revision_id")
        curr_rev = string.match(txt,"%x+")
    end
    say(":Autor: Mathias Weidner")
    say(":Datum: " .. os.date('%Y-%m-%d'))
    say(":Basisrevision: " .. base_rev)
    say(":Aktuelle Revision: " .. curr_rev)
    say(":Lizenz: CC BY-SA 3.0 (Creative Commons)")
end
