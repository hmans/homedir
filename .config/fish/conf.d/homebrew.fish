# macOS
if test -d /opt/homebrew/bin
    eval (/opt/homebrew/bin/brew shellenv)
end

# WSL
if test -d /home/hmans/.linuxbrew/bin
    eval (/home/hmans/.linuxbrew/bin/brew shellenv)
end

# Linux
if test -d /home/linuxbrew/.linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
