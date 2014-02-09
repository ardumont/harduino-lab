harduino-lab [![Build Status](https://travis-ci.org/ardumont/harduino-lab.png?branch=master)](https://travis-ci.org/ardumont/harduino-lab)
============

Mess around with arduino and haskell

# Pre-requisite

- haskell-platform
- cabal

# Install

```sh
make install deps
```

# Run

## blinking led 

- led connected on pin 13 on the arduino uno.

```sh
cd src && runhaskell Blink /dev/ttyACM0
```

# Problems

## GNU/Linux

You need to be in the group dialout.
But for some reason, It's not sufficient for me.

As a brutal workaround (for now), I change the owner/group to be me instead of root.

```sh
sudo chown $USER: $DEVICE
```

- $DEVICE is /dev/ttyACM0 for me
