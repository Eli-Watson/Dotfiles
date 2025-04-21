# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Gitub/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "webdev"; then

  # Create a new window inline within session layout definition.
    new_window "nvim"
    new_window "server"
    
    select_window "nvim"
    run_cmd "nvim"

    select_window "server"
    run_cmd "cd ~/Github/"
    run_cmd "npx live-server"
    
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
