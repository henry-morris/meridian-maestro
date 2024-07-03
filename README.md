# Automating Meridian DSP5000 Speaker Activation for One-Click Audio Bliss

I love my Meridian DSP5000 speakers: they sound great and are all-digital. But I didn't love the process of turning them on… every time I wanted to listen to music, I had to go through the same tedious routine:

1. Activate the power plugs
2. Find the remote control
3. Turn on the speakers
4. Click-click-click my way up to the right volume

It felt like I was stuck in the past while the rest of my home was getting smarter. I knew there had to be a better way. I wanted the simplicity of smart home control for my high-end audio system. Imagine just tapping a button on my phone and having the speakers power up, set themselves to the perfect volume, and be ready to play in seconds.

That's exactly what I managed to achieve:

https://github.com/henry-morris/meridian-maestro/assets/23333300/23c97096-f46a-4fb2-b7d2-0b4ad9895a36

## This Post, a Roadmap to Audio Nirvana

In this post, I'll walk you through my journey of automating activating my Meridian DSP5000 speakers using a Raspberry Pi, a USB to RS232 cable, a bit of coding magic and HomeKit. Hopefully it'll be helpful to fellow Meridian DSP5000 owners who want the simplicity of one-click music!

## The Cast of Characters

Here's what I used:

1. Two Meridian DSP5000 speakers
2. Two HomeKit compatible Meross WiFi Smart Plugs
3. Raspberry Pi Zero W 2 with a fast MicroSD card
4. USB to Serial RS232 Adapter with FTDI Chipset
5. USB Plug Adaptor (for powering the Raspberry Pi)

It's important to note that one Meross WiFi Smart Plug powers both the Master Speaker and the Raspberry Pi (via the USB Power Adapter); this dual-powering is key to the automation process.

![Equipment Layout](path_to_equipment_photo.jpg)

## Plugging Into the Future: The Smart Plug Strategy

I connected the Master speaker and the Raspberry Pi's power supply to one Meross WiFi Smart Plug, and the Slave speaker to another. These plugs are compatible with HomeKit, allowing me to control the power to the speakers from my Apple devices. In the HomeKit app, I grouped these two plugs together under "Speakers," making it easy to turn both speakers on or off simultaneously.

## Wiring for Wonder: The Physical Connections Explained

The Raspberry Pi connects to the Master speaker via the RS232 adapter. This allows the Pi to send commands directly to the speaker. The Master and Slave speakers are connected via a Comms cable, which allows the Master to control the Slave. Here's how everything connects:

![diagram](https://github.com/henry-morris/meridian-maestro/assets/23333300/e5de70dd-60eb-40da-ae39-164f88d4d7e2)

## The Brain of the Operation: Configuring the Raspberry Pi

The Raspberry Pi acts as a bridge between the smart home ecosystem and the RS232 interface of the Meridian speakers. Here's how I set it up:

1. Operating System: I installed DietPi, a lightweight Debian-based OS, to ensure fast boot times
2. Boot Script (activate.sh), this script waits for the USB-to-Serial device to be available, then sends commands to set the speakers to CD input and 90% volume. 
3. Systemd Service (activate.service), to run the activate.sh script at boot, I created a systemd service

## The Grand Finale

With this setup, when I turn on the smart plugs via HomeKit, the first plug activates both the Master speaker and the Raspberry Pi simultaneously. The Pi boots up, runs the script to configure the speakers, and then shuts itself down. The whole process takes about 15 seconds from plug activation to having the speakers ready at the perfect volume.

## The Encore
What used to be a multi-step process is now as simple as tapping a button. It's a perfect blend of high-end audio and modern smart home technology. If you're considering a similar project, my advice is to go for it. The process might seem daunting at first, but the result is well worth the effort.
