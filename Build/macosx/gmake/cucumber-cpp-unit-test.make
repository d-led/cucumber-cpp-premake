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
  OBJDIR     = ../../../obj/macosx/gmake/x32/Debug/cucumber-cpp-unit-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Debug
  TARGET     = $(TARGETDIR)/cucumber-cpp-unit-test
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x32/Debug -L. -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Debug/libcucumber-cpp.a ../../../bin/macosx/gmake/x32/Debug/libgooglemock.a ../../../bin/macosx/gmake/x32/Debug/libgooglemock-main.a
  LIBS      += $(LDDEPS) -lboost_system-mt -lboost_regex-mt -lboost_thread-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Release/cucumber-cpp-unit-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Release
  TARGET     = $(TARGETDIR)/cucumber-cpp-unit-test
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x32/Release -L. -Wl,-x -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Release/libcucumber-cpp.a ../../../bin/macosx/gmake/x32/Release/libgooglemock.a ../../../bin/macosx/gmake/x32/Release/libgooglemock-main.a
  LIBS      += $(LDDEPS) -lboost_system-mt -lboost_regex-mt -lboost_thread-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/native/cucumber-cpp-unit-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/cucumber-cpp-unit-test
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake -L. -Wl,-x -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/libcucumber-cpp.a ../../../bin/macosx/gmake/libgooglemock.a ../../../bin/macosx/gmake/libgooglemock-main.a
  LIBS      += $(LDDEPS) -lboost_system-mt -lboost_regex-mt -lboost_thread-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Debug/cucumber-cpp-unit-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Debug
  TARGET     = $(TARGETDIR)/cucumber-cpp-unit-test
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x64/Debug -L. -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Debug/libcucumber-cpp.a ../../../bin/macosx/gmake/x64/Debug/libgooglemock.a ../../../bin/macosx/gmake/x64/Debug/libgooglemock-main.a
  LIBS      += $(LDDEPS) -lboost_system-mt -lboost_regex-mt -lboost_thread-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Release/cucumber-cpp-unit-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Release
  TARGET     = $(TARGETDIR)/cucumber-cpp-unit-test
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x64/Release -L. -Wl,-x -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Release/libcucumber-cpp.a ../../../bin/macosx/gmake/x64/Release/libgooglemock.a ../../../bin/macosx/gmake/x64/Release/libgooglemock-main.a
  LIBS      += $(LDDEPS) -lboost_system-mt -lboost_regex-mt -lboost_thread-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/native/cucumber-cpp-unit-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/cucumber-cpp-unit-test
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake -L. -Wl,-x -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/libcucumber-cpp.a ../../../bin/macosx/gmake/libgooglemock.a ../../../bin/macosx/gmake/libgooglemock-main.a
  LIBS      += $(LDDEPS) -lboost_system-mt -lboost_regex-mt -lboost_thread-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/ContextManagerTest.o \
	$(OBJDIR)/CukeCommandsTest.o \
	$(OBJDIR)/RegexTest.o \
	$(OBJDIR)/StepCallChainTest.o \
	$(OBJDIR)/StepManagerTest.o \
	$(OBJDIR)/TableTest.o \
	$(OBJDIR)/TagTest.o \

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
	@echo Linking cucumber-cpp-unit-test
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
	@echo Cleaning cucumber-cpp-unit-test
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

$(OBJDIR)/ContextManagerTest.o: ../../../cucumber-cpp/tests/unit/ContextManagerTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/CukeCommandsTest.o: ../../../cucumber-cpp/tests/unit/CukeCommandsTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/RegexTest.o: ../../../cucumber-cpp/tests/unit/RegexTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/StepCallChainTest.o: ../../../cucumber-cpp/tests/unit/StepCallChainTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/StepManagerTest.o: ../../../cucumber-cpp/tests/unit/StepManagerTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/TableTest.o: ../../../cucumber-cpp/tests/unit/TableTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/TagTest.o: ../../../cucumber-cpp/tests/unit/TagTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
