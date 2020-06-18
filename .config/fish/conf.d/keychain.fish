# keychain on Linux/WSL
if type -q keychain
    eval (keychain --eval --agents ssh id_rsa)
end
