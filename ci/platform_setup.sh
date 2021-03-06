#!/bin/bash -xe

case "$(uname -s)" in
    "Linux")
        if [[ "$MAKER" = "deb" || -n "$APPVEYOR" ]]; then
          sudo apt-get install --yes --no-install-recommends fakeroot dpkg
        fi
        if [[ "$MAKER" = "rpm" || -n "$APPVEYOR" ]]; then
          sudo apt-get install --yes --no-install-recommends rpm
        fi
        if [[ "$MAKER" = "flatpak" || -n "$APPVEYOR" ]]; then
          "$(dirname $0)"/install_flatpak_dependencies.sh
        fi
        # if [[ "$MAKER" = "snap" || -n "$APPVEYOR" ]]; then
        #   "$(dirname $0)"/install_snap_dependencies.sh
        # fi
        ;;
esac