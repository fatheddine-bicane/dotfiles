#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $current_dir/utils.sh

HOSTS="google.com github.com example.com"
network_interface=$(get_tmux_option "@kanagawa-network-bandwidth" "en0")
wifi_label=$(get_tmux_option "@kanagawa-network-wifi-label" "")
ethernet_label=$(get_tmux_option "@kanagawa-network-ethernet-label" "Ethernet")

get_ssid() {
  # Check OS
  case $(uname -s) in
  Linux)
    SSID=$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p')
    if [ -n "$SSID" ]; then
      printf '%s' ""
    else
      echo ''
    fi
    ;;

  Darwin)
    local wifi_network_raw
    local airport_raw
    local wifi_network
    local airport

    wifi_network_raw=$(ipconfig getsummary $network_interface | awk -F ' SSID : ' '/ SSID : / {print $2}')
    airport_raw=$(networksetup -getairportnetwork $network_interface | cut -d ':' -f 2)

    # Trim leading/trailing whitespace
    wifi_network=$(echo "$wifi_network_raw" | xargs)
    airport=$(echo "$airport_raw" | xargs)

    if [[ $airport != "You are not associated with an AirPort network." ]]; then
      echo ""
    elif [[ $wifi_network != "" ]]; then
      echo ""
    else
      echo ''
    fi
    ;;

  CYGWIN* | MINGW32* | MSYS* | MINGW*)
    # leaving empty - TODO - windows compatability
    ;;

  *) ;;
  esac

}

main() {
  network="Offline"
  for host in $HOSTS; do
    if ping -q -c 1 -W 1 $host &>/dev/null; then
      network="$(get_ssid)"
      break
    fi
  done

  echo "$network"
}

#run main driver function
main
