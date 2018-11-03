# Set up Wine environment.
# This file depends on `MM_WINE_APP` variable,
# and should be sourced from the `"./${MM_WINE_APP}/env.sh"` script.

# Set Wine bottle root.
export MM_WINE_BOTTLE="${HOME}/Wine/${MM_WINE_APP}"

# Set Wine prefix path. Should not be overridden.
export WINEPREFIX="${MM_WINE_BOTTLE}/prefix"

# Set Wine's root directory.
export MM_WINE_ROOT="${WINEPREFIX}/drive_c"

# Set Wine's home. Possibly may be overridden.
export MM_WINE_HOME="${MM_WINE_ROOT}/users/${USER}"

# Disable `winemenubuilder`. Should not be overridden.
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

. "${MM_WINE_BOTTLE}/arch.sh"

# Ensure Wine home exists.
mkdir -p "${MM_WINE_HOME}"

# Sandbox Wine from accessing real `$HOME`.
winetricks sandbox

# Go to Wine's home.
cd "${MM_WINE_HOME}"

if ! [ -f "${MM_WINE_HOME}/colors.reg" ]; then
    cp "${HOME}/Wine/colors.reg" "${MM_WINE_HOME}/colors.reg"
    $MM_WINE_BIN reg import colors.reg
fi
