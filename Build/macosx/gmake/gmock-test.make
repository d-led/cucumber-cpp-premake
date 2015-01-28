# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

CC = gcc
CXX = g++
AR = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Debug/gmock-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Debug
  TARGET     = $(TARGETDIR)/gmock-test
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include -I../../../googlemock -I../../../googlemock/include -I../../../googlemock/gtest/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L../../../bin/macosx/gmake/x32/Debug -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Debug/libgooglemock.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Release/gmock-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Release
  TARGET     = $(TARGETDIR)/gmock-test
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include -I../../../googlemock -I../../../googlemock/include -I../../../googlemock/gtest/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L../../../bin/macosx/gmake/x32/Release -Wl,-x -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Release/libgooglemock.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/native/gmock-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/gmock-test
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include -I../../../googlemock -I../../../googlemock/include -I../../../googlemock/gtest/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L../../../bin/macosx/gmake -Wl,-x -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/libgooglemock.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Debug/gmock-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Debug
  TARGET     = $(TARGETDIR)/gmock-test
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include -I../../../googlemock -I../../../googlemock/include -I../../../googlemock/gtest/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L../../../bin/macosx/gmake/x64/Debug -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Debug/libgooglemock.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Release/gmock-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Release
  TARGET     = $(TARGETDIR)/gmock-test
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include -I../../../googlemock -I../../../googlemock/include -I../../../googlemock/gtest/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L../../../bin/macosx/gmake/x64/Release -Wl,-x -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Release/libgooglemock.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/native/gmock-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/gmock-test
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include -I../../../googlemock -I../../../googlemock/include -I../../../googlemock/gtest/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -L../../../bin/macosx/gmake -Wl,-x -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/libgooglemock.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/gmock_all_test.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking gmock-test
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning gmock-test
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/gmock_all_test.o: ../../../googlemock/test/gmock_all_test.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif