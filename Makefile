# Makefile to build and install the SDL library

top_builddir = .
srcdir  = .
objects = build
prefix = /usr/local/ps3dev/portlibs/ppu
exec_prefix = ${prefix}
bindir	= ${exec_prefix}/bin
libdir  = ${exec_prefix}/lib
includedir = ${prefix}/include
datarootdir = ${prefix}/share
datadir	= ${datarootdir}
auxdir	= ./build-scripts
distpath = $(srcdir)/..
distdir = SDL-1.3.0
distfile = $(distdir).tar.gz


SHELL	= /bin/sh
CC      = powerpc64-ps3-elf-gcc
INCLUDE = -I./include
CFLAGS  = -O2 -Wall -I/usr/local/ps3dev/psl1ght/ppu/include 
EXTRA_CFLAGS = -I./include  -maltivec -D__PSL1GHT__ -DHAVE_POW -DHAVE_MMAP=0 -DDEBUG_ERROR -I"/usr/local/ps3dev/psl1ght/ppu/include" -mcpu=cell 
LDFLAGS = -L/usr/local/ps3dev/psl1ght/ppu/lib -lrt -llv2
EXTRA_LDFLAGS =  -lm -lgcm_sys -lrsx -lsysutil -lio -laudio -lrt -llv2 -lio -laudio
LIBTOOL = $(SHELL) $(top_builddir)/libtool
INSTALL = /usr/bin/install -c
AR	= powerpc64-ps3-elf-ar
RANLIB	= powerpc64-ps3-elf-ranlib
WINDRES	= 

TARGET  = libSDL.la
OBJECTS = $(objects)/SDL.lo $(objects)/SDL_assert.lo $(objects)/SDL_compat.lo $(objects)/SDL_error.lo $(objects)/SDL_fatal.lo $(objects)/SDL_hints.lo $(objects)/SDL_log.lo $(objects)/SDL_atomic.lo $(objects)/SDL_spinlock.lo $(objects)/SDL_audio.lo $(objects)/SDL_audiocvt.lo $(objects)/SDL_audiodev.lo $(objects)/SDL_audiotypecvt.lo $(objects)/SDL_mixer.lo $(objects)/SDL_wave.lo $(objects)/SDL_cpuinfo.lo $(objects)/SDL_clipboardevents.lo $(objects)/SDL_events.lo $(objects)/SDL_gesture.lo $(objects)/SDL_keyboard.lo $(objects)/SDL_mouse.lo $(objects)/SDL_quit.lo $(objects)/SDL_touch.lo $(objects)/SDL_windowevents.lo $(objects)/SDL_rwops.lo $(objects)/SDL_render.lo $(objects)/SDL_yuv_mmx.lo $(objects)/SDL_yuv_sw.lo $(objects)/SDL_render_d3d.lo $(objects)/SDL_ndsrender.lo $(objects)/SDL_render_gl.lo $(objects)/SDL_shaders_gl.lo $(objects)/SDL_render_gles.lo $(objects)/SDL_render_gles2.lo $(objects)/SDL_shaders_gles2.lo $(objects)/SDL_PSL1GHTrender.lo $(objects)/SDL_blendfillrect.lo $(objects)/SDL_blendline.lo $(objects)/SDL_blendpoint.lo $(objects)/SDL_drawline.lo $(objects)/SDL_drawpoint.lo $(objects)/SDL_render_sw.lo $(objects)/SDL_getenv.lo $(objects)/SDL_iconv.lo $(objects)/SDL_malloc.lo $(objects)/SDL_qsort.lo $(objects)/SDL_stdlib.lo $(objects)/SDL_string.lo $(objects)/SDL_thread.lo $(objects)/SDL_timer.lo $(objects)/SDL_RLEaccel.lo $(objects)/SDL_blit.lo $(objects)/SDL_blit_0.lo $(objects)/SDL_blit_1.lo $(objects)/SDL_blit_A.lo $(objects)/SDL_blit_N.lo $(objects)/SDL_blit_auto.lo $(objects)/SDL_blit_copy.lo $(objects)/SDL_blit_slow.lo $(objects)/SDL_bmp.lo $(objects)/SDL_clipboard.lo $(objects)/SDL_fillrect.lo $(objects)/SDL_pixels.lo $(objects)/SDL_rect.lo $(objects)/SDL_shape.lo $(objects)/SDL_stretch.lo $(objects)/SDL_surface.lo $(objects)/SDL_video.lo $(objects)/SDL_joystick.lo $(objects)/SDL_haptic.lo $(objects)/SDL_power.lo $(objects)/SDL_PSL1GHTevents.lo $(objects)/SDL_PSL1GHTkeyboard.lo $(objects)/SDL_PSL1GHTmodes.lo $(objects)/SDL_PSL1GHTmouse.lo $(objects)/SDL_PSL1GHTvideo.lo $(objects)/SDL_syssem.lo $(objects)/SDL_systhread.lo $(objects)/SDL_sysmutex.lo $(objects)/SDL_syscond.lo $(objects)/SDL_sysjoystick.lo $(objects)/SDL_systimer.lo $(objects)/SDL_psl1ghtaudio.lo $(objects)/SDL_syshaptic.lo $(objects)/SDL_sysloadso.lo
VERSION_OBJECTS = 

SDLMAIN_TARGET = libSDLmain.a
SDLMAIN_OBJECTS = $(objects)/SDL_dummy_main.o

SRC_DIST = acinclude Android.mk autogen.sh Borland.html Borland.zip BUGS build-scripts configure configure.in COPYING CREDITS include INSTALL Makefile.minimal Makefile.in README* sdl-config.in sdl.m4 sdl.pc.in SDL.spec.in src test TODO VisualC.html VisualC VisualCE Watcom-Win32.zip WhatsNew Xcode Xcode-iPhoneOS
GEN_DIST = SDL.spec

HDRS = \
	SDL.h \
	SDL_assert.h \
	SDL_atomic.h \
	SDL_audio.h \
	SDL_blendmode.h \
	SDL_clipboard.h \
	SDL_compat.h \
	SDL_cpuinfo.h \
	SDL_endian.h \
	SDL_error.h \
	SDL_events.h \
	SDL_gesture.h \
	SDL_haptic.h \
	SDL_hints.h \
	SDL_input.h \
	SDL_joystick.h \
	SDL_keyboard.h \
	SDL_keycode.h \
	SDL_loadso.h \
	SDL_log.h \
	SDL_main.h \
	SDL_mouse.h \
	SDL_mutex.h \
	SDL_name.h \
	SDL_opengl.h \
	SDL_opengles.h \
	SDL_pixels.h \
	SDL_platform.h \
	SDL_power.h \
	SDL_quit.h \
	SDL_rect.h \
	SDL_render.h \
	SDL_rwops.h \
	SDL_scancode.h \
	SDL_shape.h \
	SDL_stdinc.h \
	SDL_surface.h \
	SDL_syswm.h \
	SDL_thread.h \
	SDL_timer.h \
	SDL_touch.h \
	SDL_types.h \
	SDL_version.h \
	SDL_video.h \
	begin_code.h \
	close_code.h

LT_AGE      = 0
LT_CURRENT  = 0
LT_RELEASE  = 1.3
LT_REVISION = 0
LT_LDFLAGS  = -no-undefined -rpath $(DESTDIR)$(libdir) -release $(LT_RELEASE) -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)

all: $(srcdir)/configure Makefile $(objects) $(objects)/$(TARGET) $(objects)/$(SDLMAIN_TARGET)

$(srcdir)/configure: $(srcdir)/configure.in
	@echo "Warning, configure.in is out of date"
	#(cd $(srcdir) && sh autogen.sh && sh configure)
	@sleep 3

Makefile: $(srcdir)/Makefile.in
	$(SHELL) config.status $@

Makefile.in:;

$(objects):
	$(SHELL) $(auxdir)/mkinstalldirs $@

update-revision:
	$(SHELL) $(auxdir)/updaterev.sh

.PHONY: all update-revision install install-bin install-hdrs install-lib install-data uninstall uninstall-bin uninstall-hdrs uninstall-lib uninstall-data clean distclean dist $(OBJECTS:.lo=.d)

$(objects)/$(TARGET): $(OBJECTS) $(VERSION_OBJECTS)
	$(LIBTOOL) --mode=link $(CC) -o $@ $(OBJECTS) $(VERSION_OBJECTS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)

$(objects)/$(SDLMAIN_TARGET): $(SDLMAIN_OBJECTS)
	$(AR) cru $@ $(SDLMAIN_OBJECTS)
	$(RANLIB) $@

install: all install-bin install-hdrs install-lib install-data
install-bin:
	$(SHELL) $(auxdir)/mkinstalldirs $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 sdl-config $(DESTDIR)$(bindir)/sdl-config
install-hdrs: update-revision
	$(SHELL) $(auxdir)/mkinstalldirs $(DESTDIR)$(includedir)/SDL
	for file in $(HDRS); do \
	    $(INSTALL) -m 644 $(srcdir)/include/$$file $(DESTDIR)$(includedir)/SDL/$$file; \
	done
	$(INSTALL) -m 644 include/SDL_config.h $(DESTDIR)$(includedir)/SDL/SDL_config.h
	if test -f include/SDL_revision.h; then \
	    $(INSTALL) -m 644 include/SDL_revision.h $(DESTDIR)$(includedir)/SDL/SDL_revision.h; \
	else \
	    $(INSTALL) -m 644 $(srcdir)/include/SDL_revision.h $(DESTDIR)$(includedir)/SDL/SDL_revision.h; \
	fi

install-lib: $(objects) $(objects)/$(TARGET) $(objects)/$(SDLMAIN_TARGET)
	$(SHELL) $(auxdir)/mkinstalldirs $(DESTDIR)$(libdir)
	$(LIBTOOL) --mode=install $(INSTALL) $(objects)/$(TARGET) $(DESTDIR)$(libdir)/$(TARGET)
	$(INSTALL) -m 644 $(objects)/$(SDLMAIN_TARGET) $(DESTDIR)$(libdir)/$(SDLMAIN_TARGET)
	$(RANLIB) $(DESTDIR)$(libdir)/$(SDLMAIN_TARGET)
install-data:
	$(SHELL) $(auxdir)/mkinstalldirs $(DESTDIR)$(datadir)/aclocal
	$(INSTALL) -m 644 $(srcdir)/sdl.m4 $(DESTDIR)$(datadir)/aclocal/sdl.m4
	$(SHELL) $(auxdir)/mkinstalldirs $(DESTDIR)$(libdir)/pkgconfig
	$(INSTALL) -m 644 sdl.pc $(DESTDIR)$(libdir)/pkgconfig

uninstall: uninstall-bin uninstall-hdrs uninstall-lib uninstall-data
uninstall-bin:
	rm -f $(DESTDIR)$(bindir)/sdl-config
uninstall-hdrs:
	for file in $(HDRS); do \
	    rm -f $(DESTDIR)$(includedir)/SDL/$$file; \
	done
	rm -f $(DESTDIR)$(includedir)/SDL/SDL_config.h
	rm -f $(DESTDIR)$(includedir)/SDL/SDL_revision.h
	-rmdir $(DESTDIR)$(includedir)/SDL
uninstall-lib:
	$(LIBTOOL) --mode=uninstall rm -f $(DESTDIR)$(libdir)/$(TARGET)
	rm -f $(DESTDIR)$(libdir)/$(SDLMAIN_TARGET)
uninstall-data:
	rm -f $(DESTDIR)$(datadir)/aclocal/sdl.m4
	rm -f $(DESTDIR)$(libdir)/pkgconfig/sdl.pc

clean:
	rm -rf $(objects)
	if test -f test/Makefile; then (cd test; $(MAKE) $@); fi

distclean: clean
	rm -f Makefile Makefile.rules sdl-config
	rm -f SDL.qpg
	rm -f config.status config.cache config.log libtool
	rm -rf $(srcdir)/autom4te*
	find $(srcdir) \( \
	    -name '*~' -o \
	    -name '*.bak' -o \
	    -name '*.old' -o \
	    -name '*.rej' -o \
	    -name '*.orig' -o \
	    -name '.#*' \) \
	    -exec rm -f {} \;
	if test -f test/Makefile; then (cd test; $(MAKE) $@); fi

dist $(distfile):
	$(SHELL) $(auxdir)/mkinstalldirs $(distdir)
	(cd $(srcdir); tar cf - $(SRC_DIST)) | (cd $(distdir); tar xf -)
	tar cf - $(GEN_DIST) | (cd $(distdir); tar xf -)
	find $(distdir) \( \
	    -name '*~' -o \
	    -name '*.bak' -o \
	    -name '*.old' -o \
	    -name '*.rej' -o \
	    -name '*.orig' -o \
	    -name '.#*' \) \
	    -exec rm -f {} \;
	if test -f $(distdir)/test/Makefile; then (cd $(distdir)/test && make distclean); fi
	tar cvf - $(distdir) | gzip --best >$(distfile)
	rm -rf $(distdir)

rpm: $(distfile)
	rpmbuild -ta $?

# Run indent on the source to standardize coding style
indent:
	@echo "Running indent... modified files:"
	@cd $(srcdir) && \
	find . \( \
	    -name '*.h' -o \
	    -name '*.c' -o \
	    -name '*.cc' \) \
	    -print | fgrep -v ./Xcode | \
	while read file; do \
	    indent "$$file" -o "$$file.indent"; \
	    if cmp "$$file" "$$file.indent" >/dev/null; then \
	        rm -f "$$file.indent"; \
	    else \
	        echo "$$file"; \
	        mv -f "$$file.indent" "$$file"; \
	    fi; \
	done

# Run indent and then commit modified files
commit: indent
	hg commit

# Build rules for objects
-include $(OBJECTS:.lo=.d)

# Special dependency for SDL.c, since it depends on SDL_revision.h
./src/SDL.c: update-revision

$(objects)/SDL.lo: ./src/SDL.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_assert.lo: ./src/SDL_assert.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_compat.lo: ./src/SDL_compat.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_error.lo: ./src/SDL_error.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_fatal.lo: ./src/SDL_fatal.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_hints.lo: ./src/SDL_hints.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_log.lo: ./src/SDL_log.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_atomic.lo: ./src/atomic/SDL_atomic.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_spinlock.lo: ./src/atomic/SDL_spinlock.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_audio.lo: ./src/audio/SDL_audio.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_audiocvt.lo: ./src/audio/SDL_audiocvt.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_audiodev.lo: ./src/audio/SDL_audiodev.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_audiotypecvt.lo: ./src/audio/SDL_audiotypecvt.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_mixer.lo: ./src/audio/SDL_mixer.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_wave.lo: ./src/audio/SDL_wave.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_cpuinfo.lo: ./src/cpuinfo/SDL_cpuinfo.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_clipboardevents.lo: ./src/events/SDL_clipboardevents.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_events.lo: ./src/events/SDL_events.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_gesture.lo: ./src/events/SDL_gesture.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_keyboard.lo: ./src/events/SDL_keyboard.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_mouse.lo: ./src/events/SDL_mouse.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_quit.lo: ./src/events/SDL_quit.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_touch.lo: ./src/events/SDL_touch.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_windowevents.lo: ./src/events/SDL_windowevents.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_rwops.lo: ./src/file/SDL_rwops.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_render.lo: ./src/render/SDL_render.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_yuv_mmx.lo: ./src/render/SDL_yuv_mmx.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_yuv_sw.lo: ./src/render/SDL_yuv_sw.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_render_d3d.lo: ./src/render/direct3d/SDL_render_d3d.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_ndsrender.lo: ./src/render/nds/SDL_ndsrender.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_render_gl.lo: ./src/render/opengl/SDL_render_gl.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_shaders_gl.lo: ./src/render/opengl/SDL_shaders_gl.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_render_gles.lo: ./src/render/opengles/SDL_render_gles.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_render_gles2.lo: ./src/render/opengles2/SDL_render_gles2.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_shaders_gles2.lo: ./src/render/opengles2/SDL_shaders_gles2.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_PSL1GHTrender.lo: ./src/render/psl1ght/SDL_PSL1GHTrender.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blendfillrect.lo: ./src/render/software/SDL_blendfillrect.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blendline.lo: ./src/render/software/SDL_blendline.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blendpoint.lo: ./src/render/software/SDL_blendpoint.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_drawline.lo: ./src/render/software/SDL_drawline.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_drawpoint.lo: ./src/render/software/SDL_drawpoint.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_render_sw.lo: ./src/render/software/SDL_render_sw.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_getenv.lo: ./src/stdlib/SDL_getenv.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_iconv.lo: ./src/stdlib/SDL_iconv.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_malloc.lo: ./src/stdlib/SDL_malloc.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_qsort.lo: ./src/stdlib/SDL_qsort.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_stdlib.lo: ./src/stdlib/SDL_stdlib.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_string.lo: ./src/stdlib/SDL_string.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_thread.lo: ./src/thread/SDL_thread.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_timer.lo: ./src/timer/SDL_timer.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_RLEaccel.lo: ./src/video/SDL_RLEaccel.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit.lo: ./src/video/SDL_blit.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_0.lo: ./src/video/SDL_blit_0.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_1.lo: ./src/video/SDL_blit_1.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_A.lo: ./src/video/SDL_blit_A.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_N.lo: ./src/video/SDL_blit_N.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_auto.lo: ./src/video/SDL_blit_auto.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_copy.lo: ./src/video/SDL_blit_copy.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_blit_slow.lo: ./src/video/SDL_blit_slow.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_bmp.lo: ./src/video/SDL_bmp.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_clipboard.lo: ./src/video/SDL_clipboard.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_fillrect.lo: ./src/video/SDL_fillrect.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_pixels.lo: ./src/video/SDL_pixels.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_rect.lo: ./src/video/SDL_rect.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_shape.lo: ./src/video/SDL_shape.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_stretch.lo: ./src/video/SDL_stretch.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_surface.lo: ./src/video/SDL_surface.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_video.lo: ./src/video/SDL_video.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_joystick.lo: ./src/joystick/SDL_joystick.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_haptic.lo: ./src/haptic/SDL_haptic.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_power.lo: ./src/power/SDL_power.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_PSL1GHTevents.lo: ./src/video/psl1ght/SDL_PSL1GHTevents.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_PSL1GHTkeyboard.lo: ./src/video/psl1ght/SDL_PSL1GHTkeyboard.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_PSL1GHTmodes.lo: ./src/video/psl1ght/SDL_PSL1GHTmodes.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_PSL1GHTmouse.lo: ./src/video/psl1ght/SDL_PSL1GHTmouse.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_PSL1GHTvideo.lo: ./src/video/psl1ght/SDL_PSL1GHTvideo.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_syssem.lo: ./src/thread/psl1ght/SDL_syssem.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_systhread.lo: ./src/thread/psl1ght/SDL_systhread.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_sysmutex.lo: ./src/thread/generic/SDL_sysmutex.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_syscond.lo: ./src/thread/generic/SDL_syscond.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_sysjoystick.lo: ./src/joystick/psl1ght/SDL_sysjoystick.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_systimer.lo: ./src/timer/psl1ght/SDL_systimer.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_psl1ghtaudio.lo: ./src/audio/psl1ght/SDL_psl1ghtaudio.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_syshaptic.lo: ./src/haptic/dummy/SDL_syshaptic.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@

$(objects)/SDL_sysloadso.lo: ./src/loadso/dummy/SDL_sysloadso.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@


$(objects)/SDL_dummy_main.o: ./src/main/dummy/SDL_dummy_main.c
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -MMD -MT $@ -c $< -o $@
