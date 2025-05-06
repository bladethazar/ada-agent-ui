# 📝 Project TODO – Argon POD + K3s Agent UI on Pi Zero

This checklist guides you from flashing the SD card to building and deploying a containerized `ada-agent-ui` in your K3s cluster with Helm.

---

## 📦 1. SD Card Setup (SanDisk Extreme Pro A2)

- [ ] Flash **Raspberry Pi OS Lite (64-bit)** onto the SD card.
- [ ] Enable SSH: place an empty `ssh` file in the `/boot` partition.
- [ ] Configure Wi-Fi or phone hotspot in `wpa_supplicant.conf`.
- [ ] Boot the Pi Zero and change the hostname (e.g. `ada-agent`).
- [ ] Run `sudo apt update && sudo apt upgrade`.

---

## 🖥️ 2. Argon POD Display Setup

- [ ] Install display + touch driver:
  ``curl https://download.argon40.com/podsystem.sh | bash`` -  Verify ``/dev/fb1`` exists.

- [ ] Install required packages:
    ``sudo apt install python3-pygame python3-evdev python3-pip libts-bin fbset``

- [ ] Calibrate touchscreen:
    ``ts_calibrate``

- [ ] Test rendering a basic ``pygame`` window to ``/dev/fb1``.

- [ ] Create new project using modular OOP structure

  - [ ] Implement background functions: reboot, shutdown, toggle BLE, backlight.

  - [ ] Implement touch input to switch display modes.

  - [ ] Test app locally via Python

## 🧠 3. Join K3s Cluster (as Agent)

- [ ] Join Pi Zero to K3s (RPI 5 is server):
    ``curl -sfL https://get.k3s.io | K3S_URL=https://<server-ip>:6443 K3S_TOKEN=<token> sh -``

- [ ] Label the node:
    ``kubectl label node rpi-ada-agent role=ai-agent``

## 🧱 4. Build ada-agent-ui Python App

- [ ] Implement touch-to-switch-mode logic

- [ ] Background functions: reboot, shutdown, BLE toggle, backlight control

- [ ] Use pygame with ``SDL_FBDEV=/dev/fb1``

## 🐳 5. Dockerize the UI App

- [ ] Create Dockerfile

- [ ] Build, test, push:
    ``docker build -t yourdockerhub/ada-agent-ui:latest .``
    ``docker run --privileged -v /dev:/dev ada-agent-ui``
    ``docker push <yourdockerhub>/ada-agent-ui:latest``

## ☸️ 6. Create Helm Chart for UI

- [ ] Scaffold chart:
    ``helm create ada-agent-ui``

- [ ] Edit deployment.yaml to:
  - [ ] Set privileged security context
  - [ ] Mount /dev/fb1 and /dev/input
  - [ ] Use nodeSelector

- [ ] Deploy:
    ``helm install ada-ui ./ada-agent-ui --namespace ada --create-namespace``

## 📡 7. MQTT + InfluxDB Integration

- [ ]  Publish button presses and mode changes via MQTT

- [ ]  Log system events (e.g. reboots, BLE toggles) to InfluxDB

- [ ]  Create Grafana dashboard (if needed)
