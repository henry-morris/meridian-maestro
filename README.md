# Automating Meridian DSP5000 Speaker Activation for One-Click Audio Bliss

I love my Meridian DSP5000 speakers, but turning them on was a hassle: activate plugs, find remote, power up, adjust volume. It felt outdated compared to my smart home. I envisioned a simpler solution - one click/tap on my Mac/iPhone to power up the speakers and set the perfect volume. As the video below show, that's what I've managed to achieve!:

[![Demo Video](https://github.com/henry-morris/meridian-maestro/assets/23333300/23c97096-f46a-4fb2-b7d2-0b4ad9895a36)](https://github.com/henry-morris/meridian-maestro/assets/23333300/23c97096-f46a-4fb2-b7d2-0b4ad9895a36)

I'll walk you through my set-up which automates activating my Meridian DSP5000 speakers using a Raspberry Pi, a USB to RS232 cable, a bit of coding magic and HomeKit. Hopefully, it'll be helpful to fellow Meridian DSP5000 owners who want the simplicity of one-tap music.

## The Cast of Characters: The Kit

1. Two Meridian DSP5000 speakers:

   ![Meridian DSP5000 speakers](https://github.com/henry-morris/meridian-maestro/assets/23333300/6b72d956-83bd-4fd6-b4c1-edcb700664f8)

2. Two HomeKit compatible Meross WiFi Smart Plugs grouped together in HomeKit:

   ![Meross WiFi Smart Plugs](https://github.com/henry-morris/meridian-maestro/assets/23333300/2264031d-7366-42a9-bb96-c8dcbf960138)

3. Raspberry Pi Zero W 2 with a fast MicroSD card:

    ![shopping](https://github.com/henry-morris/meridian-maestro/assets/23333300/0594247e-783f-40e5-80a9-58e0151b3e8f)

4. USB to Serial RS232 Adapter with FTDI Chipset:

   ![USB to Serial RS232 Adapter](https://github.com/henry-morris/meridian-maestro/assets/23333300/aed0f1ab-02e1-4197-90ec-97580fd44632)

5. USB Plug Adaptor (for powering the Raspberry Pi):

    ![61XKbOo1-6L _AC_SL1500_](https://github.com/henry-morris/meridian-maestro/assets/23333300/8e2a9b31-beb3-42f5-bde3-e5a4a6e206a5)

## The Cast of Characters: The Connections

Here's how everything connects:

```mermaid
graph TD
    A[iPhone] -.->|HomeKit| B[Home Network]
    J[Mac] -.->|HomeKit| B
    B -.->|WiFi| C[Meross Smart Plug 1]
    B -.->|WiFi| D[Meross Smart Plug 2]
    C -->|Power| E[Meridian DSP5000 Master Speaker]
    C -->|Power| H[USB Power Adapter]
    H -->|Power| G[Raspberry Pi Zero W 2]
    D -->|Power| F[Meridian DSP5000 Slave Speaker]
    B -.->|WiFi| G
    G -->|USB| I[USB to RS232 Adapter]
    I -->|RS232| E
    E -->|Comm cable| F

    style A fill:#f9f,stroke:#333,stroke-width:2px
    style J fill:#f9f,stroke:#333,stroke-width:2px
    style B fill:#ccf,stroke:#333,stroke-width:2px
    style C fill:#cfc,stroke:#333,stroke-width:2px
    style D fill:#cfc,stroke:#333,stroke-width:2px
    style E fill:#fcc,stroke:#333,stroke-width:2px
    style F fill:#fcc,stroke:#333,stroke-width:2px
    style G fill:#fcf,stroke:#333,stroke-width:2px
    style H fill:#cff,stroke:#333,stroke-width:2px
    style I fill:#ffc,stroke:#333,stroke-width:2px
```

## The Brain of the Operation: Configuring the Raspberry Pi

The Raspberry Pi acts as a bridge between the smart home ecosystem and the RS232 interface of the Meridian speakers by the adapter. Here's how I set it up:

1. Operating System: [DietPi](https://dietpi.com), a lightweight Debian-based OS, to ensure fast boot times
2. Boot Script ([activate.sh](https://github.com/henry-morris/meridian-maestro/blob/main/activate.sh)), this script waits for the USB-to-Serial device to be available, then sends commands to set the speakers to CD input and 90% volume. 
3. Systemd Service ([activate.service](https://github.com/henry-morris/meridian-maestro/blob/main/activate.service)), to run the activate.sh script at boot

## The Grand Finale

With this setup, when I turn on the smart plugs via HomeKit, the first plug activates both the Master speaker and the Raspberry Pi simultaneously. The Pi boots up, runs the script to configure the speakers, and then shuts itself down. The whole process takes about 15 seconds from plug activation to having the speakers ready at the perfect volume.
