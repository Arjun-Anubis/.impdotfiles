## Saturday 29 October 2022 01:56 PM

In the effort of trying tom compile Hyperland, the binaries downloaded from the page have been placed in /usr/bin follow instructions on https://wiki.hyprland.org/Getting-Started/Installation/



Now it gives the error libxcb-erros not found, for which I have found no ubuntu package, in that vain I have issued dapt install libxcb-*

Now I will compile it from source from the gitlab for xcb-source


It worked


```
Libraries have been installed in:
   /usr/local/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the '-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the 'LD_RUN_PATH' environment variable
     during linking
   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to '/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
```

dapt install seatd libstead-dev

+ Uninstalled seatd, as sway was enabling on startup, but it didnt work right, might try building from source


## Saturday 29 October 2022 04:18 PM

Trying to fix simple-scanner, might add some config, the github page on the ubuntu github is useless, thr true source can be found on gnome's gitlan

Fair warning it takes a while to clone

Cloned.

I'll be using a custom install command set


```
# initliazes the build dir, you can pick anotehr dir, but it must be changed in the -C flag in the following commands
meson build
# The reason you have to be root, is libhandy uses some files in .cache that are root owndd
doas ninja -C build all
# For actually installing
doas ninja -C build install
```

It worked.

I'll give it a test

It fast to startup

There seems to be an option for post processing, I'll add a tesseract script to that


Works fine, quite snappy infact

## Sunday 30 October 2022 02:29PM


Bug with telescope on ubuntu, the program used for listing files, fd is installed as fdfind

No simle way to change that program in telescope, plus the default program fd is in japanese, simples solution is to delete it and but fdfind at the local bin, as I have redone
