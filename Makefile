DEVICE=/dev/ttyACM0

deps: update
	cabal install harduino test-framework test-framework-hunit

update:
	cabal update

install:
	sudo apt-get install -y haskell-platform

rights:
	sudo chown $(USER): $(DEVICE)

blink:
	cd src && runhaskell $(DEVICE)

morse-tests:
	cd src && runhaskell MorseTests

tests: morse-tests
