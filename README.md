
# IRCbash

**IRCbash** is a clean, lightweight Bash script for quickly connecting to an IRC server and joining a channel without modifying any configuration files.

It is designed for fast OverTheWire wargame access or custom IRC server connections.

---

## Features

- Fast interactive prompts
- Default auto-connection to OverTheWire's `#wargames`
- Custom server/channel support
- SSL (TLS) support option
- No temp files, no config pollution
- Professional terminal logging (colored, clear)

---

## Requirements

- `bash`
- `irssi` installed  
  (Install it with: `sudo apt-get install irssi`)

---

## Usage

```bash
chmod +x IRC.sh
./IRC.sh
```

### Then:

- Choose whether to connect to **OverTheWire** or a **custom IRC server**.
- If custom, enter server address and channel.
- If SSL is needed, choose it during prompt.

---

## Commands Inside irssi

Once connected:

- Join a channel manually (if needed):

  ```bash
  /join #yourchannel
  ```

- Exit cleanly:

  ```bash
  /quit
  ```

---

## Notes

- **No spoilers** if connecting to OverTheWire `#wargames`.
- **Be patient** — responses may take time.
- **Use pastebins** like `https://ghostbin.com/` for sharing long texts.

---

## Example Session (OverTheWire)

```text
$ ./IRC.sh
[?] What do you want to do?
  1. Add a custom server/channel
  2. Go straight to WARGAMES [default]
Choose [1/2]:
[✓] Connecting to irc.overthewire.org:6667...
[i] When connected, type: /join #wargames
```

Then inside irssi:

```bash
/join #wargames
```

```
[loq1101(+ix)] [2:overthewire/#wargames(+nrt)]
```

✅ Connected.

---

## License

MIT License.  
Use freely.
