tell application "pgAdmin 4" to activate

delay 5

set sqlFilePath to "pathofsqlfile.sql"
set sqlCommands to paragraphs of (read POSIX file sqlFilePath)

tell application "System Events"
    tell process "pgAdmin 4"
        click menu item "Query Tool" of menu 1 of menu bar item "Tools" of menu bar 1
        delay 5

        set screenshotcounter to 1

        repeat with sqlCommand in sqlCommands
            -- SQL command into the query field
            keystroke sqlCommand
            tell application "System Events" to key code 96 

            delay 2

            -- Taking screenshots
            set screenshotPath to "path_to_save" & "sc_" & screenshotcounter & ".png"
            do shell script "screencapture " & quoted form of screenshotPath

            set screenshotcounter to screenshotcounter + 1

            -- clearing the query field
            tell application "System Events" to keystroke "a" using {command down}
            tell application "System Events" to key code 51 -- Press Delete key

        end repeat
    end tell
end tell

tell application "pgAdmin 4" to quit
