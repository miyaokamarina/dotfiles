# Set up Wine environment.
# This file depends on `MM_WINE_APP` variable,
# and should be sourced from the `"./${MM_WINE_APP}/env.sh"` script.

# Set Wine prefix path. Should not be overridden.
export WINEPREFIX="${HOME}/Wine/${MM_WINE_APP}/prefix"

# Set Wine's root directory.
export MM_WINE_ROOT="${WINEPREFIX}/drive_c"

# Disable `winemenubuilder`. Should not be overridden.
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

# Set Wine architecture. May be overridden after sourcing this file from `"./${MM_WINE_APP}/env.sh"`.
export WINEARCH="win32"

# Set Wine's home. Possibly may be overridden.
export MM_WINE_HOME="${MM_WINE_ROOT}/users/${USER}"

# Ensure existing of Wine's home.
mkdir -p "${MM_WINE_HOME}"

# Sandbox Wine from accessing real `$HOME`.
winetricks sandbox

# Go to Wine's home.
cd "${MM_WINE_HOME}"

if ! [ -f "${MM_WINE_HOME}/colors.reg" ]; then
    cp "${HOME}/Wine/colors.reg" "${MM_WINE_HOME}/colors.reg"
    wine reg import colors.reg
fi
