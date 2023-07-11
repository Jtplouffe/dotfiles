if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/Synergy
fish_add_path /home/jt/.flutter/bin
fish_add_path /home/jt/.local/share/JetBrains/Toolbox/script
fish_add_path /var/lib/flatpak/exports/bin
fish_add_path /home/jt/.cargo/bin

starship init fish | source
zoxide init fish | source

