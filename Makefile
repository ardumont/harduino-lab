DEVICE=/dev/ttyACM0

install:
	cabal install harduino test-framework test-framework-hunit

rights:
	sudo chown $(USER): $(DEVICE)

blink:
	cd src && runhaskell $(DEVICE)

morse-tests:
	cd src && runhaskell MorseTests

tests: morse-tests
