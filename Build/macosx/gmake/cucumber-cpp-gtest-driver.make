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
  OBJDIR     = ../../../obj/macosx/gmake/x32/Debug/cucumber-cpp-gtest-driver/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Debug
  TARGET     = $(TARGETDIR)/libcucumber-cpp-gtest-driver.a
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -m32 -L/usr/lib32
  LDDEPS    +=
  LIBS      += $(LDDEPS)
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Release/cucumber-cpp-gtest-driver/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Release
  TARGET     = $(TARGETDIR)/libcucumber-cpp-gtest-driver.a
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -Wl,-x -m32 -L/usr/lib32
  LDDEPS    +=
  LIBS      += $(LDDEPS)
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/native/cucumber-cpp-gtest-driver/x32
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/libcucumber-cpp-gtest-driver.a
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -Wl,-x -m32 -L/usr/lib32
  LDDEPS    +=
  LIBS      += $(LDDEPS)
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Debug/cucumber-cpp-gtest-driver/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Debug
  TARGET     = $(TARGETDIR)/libcucumber-cpp-gtest-driver.a
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -m64 -L/usr/lib64
  LDDEPS    +=
  LIBS      += $(LDDEPS)
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Release/cucumber-cpp-gtest-driver/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Release
  TARGET     = $(TARGETDIR)/libcucumber-cpp-gtest-driver.a
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -Wl,-x -m64 -L/usr/lib64
  LDDEPS    +=
  LIBS      += $(LDDEPS)
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/native/cucumber-cpp-gtest-driver/x64
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/libcucumber-cpp-gtest-driver.a
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L/usr/local/lib -Wl,-x -m64 -L/usr/lib64
  LDDEPS    +=
  LIBS      += $(LDDEPS)
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/GTestDriver.o \

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
	@echo Linking cucumber-cpp-gtest-driver
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
	@echo Cleaning cucumber-cpp-gtest-driver
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

$(OBJDIR)/GTestDriver.o: ../../../cucumber-cpp/src/drivers/GTestDriver.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
