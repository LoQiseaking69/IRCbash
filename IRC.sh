#!/bin/bash

# ====== Colors ======
RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# ====== Step 1: Check if irssi is installed ======
echo -e "${CYAN}[*] Checking for irssi installation...${NC}"
if ! command -v irssi &> /dev/null; then
  echo -e "${RED}[!] irssi is not installed.${NC}"
  echo -e "    ${YELLOW}Tip:${NC} ${CYAN}sudo apt-get install irssi${NC}"
  exit 1
else
  echo -e "${GREEN}[✓] irssi found.${NC}"
fi

# ====== Step 2: Prompt main choice ======
echo ""
echo -e "${CYAN}[?] What do you want to do?${NC}"
echo -e "  1. Add a custom server/channel"
echo -e "  2. Go straight to ${GREEN}WARGAMES${NC} [default]"
read -rp "${CYAN}Choose [1/2]: ${NC}" choice

# ====== Step 3: Default to WARGAMES if no input ======
choice=${choice:-2}

# ====== Step 4: Validate choice ======
if [[ "$choice" != "1" && "$choice" != "2" ]]; then
  echo -e "${RED}[!] Invalid choice. Exiting.${NC}"
  exit 1
fi

# ====== Step 5: Prepare server/channel based on choice ======
if [ "$choice" = "2" ]; then
  server="irc.overthewire.org"
  channel="#wargames"
  port="6667"
  use_ssl="no"
  echo -e "${GREEN}[✓] Selected WARGAMES (${CYAN}$server${NC}:${CYAN}$port${NC})${GREEN}.${NC}"
else
  echo ""
  read -rp "${CYAN}Enter IRC server address (example: irc.libera.chat): ${NC}" server
  if [ -z "$server" ]; then
    echo -e "${RED}[!] Server address cannot be empty. Exiting.${NC}"
    exit 1
  fi

  read -rp "${CYAN}Enter channel to join (example: #example): ${NC}" channel
  if [[ "$channel" != \#* ]]; then
    echo -e "${RED}[!] Channel must start with '#'. Exiting.${NC}"
    exit 1
  fi

  read -rp "${CYAN}Use SSL? [y/N]: ${NC}" ssl_choice
  if [[ "$ssl_choice" =~ ^[Yy]$ ]]; then
    port="6697"
    use_ssl="yes"
  else
    port="6667"
    use_ssl="no"
  fi

  echo -e "${GREEN}[✓] Selected custom server ${CYAN}$server${NC} on port ${CYAN}$port${NC}.${GREEN}${NC}"
fi

# ====== Step 6: Build connection command ======
if [ "$use_ssl" = "yes" ]; then
  irssi_cmd="irssi -c $server -p $port -ssl"
else
  irssi_cmd="irssi -c $server -p $port"
fi

# ====== Step 7: Launch irssi ======
echo ""
echo -e "${CYAN}[*] Launching irssi...${NC}"
echo -e "${YELLOW}[i] When connected, type:${NC} ${GREEN}/join $channel${NC}"
sleep 1
$irssi_cmd
