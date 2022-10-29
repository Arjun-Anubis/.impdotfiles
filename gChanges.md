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
