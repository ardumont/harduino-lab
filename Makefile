DEVICE=/dev/ttyACM0

install:
	cabal install harduino

rights:
	sudo chown $(USER): $(DEVICE)

blink:
	cd src && runhaskell $(DEVICE)
