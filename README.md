# Argon POD Interface for Raspberry Pi Zero 2 W

A modular Python-based interface for the [Argon POD 2.8" Resistive Touch Display](https://argon40.com/products/pod-display-2-8inch), powered by a Raspberry Pi Zero 2 W. This project allows for dynamic mode switching via touch input and background task execution via physical buttons.

## 🎯 Project Goals

- Full-screen UI with multiple "modes" (console, AI face, K3s status, etc.)
- Button-triggered background actions (reboot, shutdown, backlight, Bluetooth)
- Maintainable and modular architecture using OOP principles
- Designed to run on `/dev/fb1` with ILI9341 SPI framebuffer driver

---

## 🖼️ Display Modes (Touch Controlled)

| Mode | Description                          |
|------|--------------------------------------|
| 1    | OS Console Output                    |
| 2    | AI Interface (face + TTS)            |
| 3    | K3s Agent Status Dashboard           |
| 4    | Utility Mode (e.g. media player)     |

Touch different regions of the screen to switch modes.

---

## 🔘 Physical Button Functions

| Button | Action                  |
|--------|-------------------------|
| 1      | Restart Raspberry Pi    |
| 2      | Toggle Bluetooth Pairing |
| 3      | Toggle Display Backlight |
| 4      | Shutdown                |

---

## 🧱 Project Structure

.
├── README.md
└── src
    ├── __init__.py
    ├── assets
    │   └── images
    ├── button_handler.py
    ├── display_manager.py
    ├── main.py
    ├── modes
    │   ├── __init__.py
    │   ├── mode_ai.py
    │   ├── mode_base.py
    │   ├── mode_cli.py
    │   ├── mode_k3s.py
    │   └── mode_utility.py
    ├── touch_handler.py
    └── utils
        ├── __init__.py
        ├── bluetooth_manager.py
        └── system_control.py

---

## 🛠️ Setup Instructions

### ⚙️ OS & Driver

1. __Flash Raspberry Pi OS Lite__ onto SD card.
2. __Install the display driver__ (ILI9341):

   ```bash
   curl https://download.argon40.com/podsystem.sh | bash
