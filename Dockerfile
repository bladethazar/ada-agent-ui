FROM balenalib/raspberry-pi-python:3.11-bullseye-run

RUN apt-get update && apt-get install -y \
    python3-pygame python3-evdev libts-bin fbset && apt-get clean

ENV SDL_FBDEV=/dev/fb1
ENV SDL_VIDEODRIVER=fbcon

WORKDIR /app
COPY . .

RUN pip3 install -r requirements.txt
CMD ["python3", "main.py"]
