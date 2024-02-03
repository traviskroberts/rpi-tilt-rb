# RPi Tilt Ruby

App to receive data from a Tilt hydrometer and display graphs of gravity/temperature.

## Prerequisites

- Raspberry Pi running [tilt-pitch](https://github.com/linjmeyer/tilt-pitch)
- This app running on a domain that is acessible by tilt-pitch

## Setup

Once you have this app running on an accessible ip/domain, you'll want to create a `pitch.json` config for tilt-pitch.

_Assuming you have a black Tilt (change color to match your Tilt)_

```json
{
  "black_name": "My Beer",
  "black_original_gravity": 1.054, # change to your beer's OG
  "webhook_urls": ["https://url.of.server/tilt_data"],
  "webhook_limit_period": 1800 # send data every 30 minutes
}
```

Start tilt-pitch with the specified configuration.

## Setting tilt-pitch as a systemd service

1. Create a `pitch.service` file with the following contents (set `WorkingDirectory` to where you want tilt-pitch to run - where the `pitch.json` file resides)

```
[Unit]
Description=Pitch
After=network.target

[Service]
ExecStart=/usr/bin/python3 -m pitch
WorkingDirectory=/path/to/directory
StandardOutput=inherit
StandardError=inherit
Restart=always
User=travis

[Install]
WantedBy=multi-user.target
```

2. Move the file to the `/etc/systemd/system` directory.
3. Run `systemctl enable pitch`
4. Run `systemctl start pitch`
5. You should see data start to appear in the app.
