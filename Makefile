all: prepare cinterop kotlin-native

prepare:
	@if [ ! -d build ]; then mkdir build; fi

kotlin-native: prepare
	@kotlinc-native \
		-o build/game \
		-l build/sdl.klib \
		-linker-options /usr/local/lib/libSDL2.dylib \
		Main.kt

cinterop: prepare
	@cinterop \
		-o build/sdl \
		-def sdl.def \
		-compilerOpts -I/usr/local/include/SDL2

run:
	@build/game.kexe

clean:
	@if [ -d build ]; then rm -rf build; fi
	@if [ -d sdl-build ]; then rm -rf sdl-build; fi
