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
  OBJDIR     = ../../../obj/macosx/gmake/x32/Debug/cppspec-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Debug
  TARGET     = $(TARGETDIR)/cppspec-test
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x32/Debug -L. -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Debug/libcppspec.a ../../../bin/macosx/gmake/x32/Debug/libgooglemock.a
  LIBS      += $(LDDEPS) -lboost_regex-mt -lboost_program_options-mt -lboost_filesystem-mt -lboost_date_time-mt -lboost_chrono-mt -lboost_thread-mt -lboost_system-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/Release/cppspec-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake/x32/Release
  TARGET     = $(TARGETDIR)/cppspec-test
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x32/Release -L. -Wl,-x -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/x32/Release/libcppspec.a ../../../bin/macosx/gmake/x32/Release/libgooglemock.a
  LIBS      += $(LDDEPS) -lboost_regex-mt -lboost_program_options-mt -lboost_filesystem-mt -lboost_date_time-mt -lboost_chrono-mt -lboost_thread-mt -lboost_system-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native32)
  OBJDIR     = ../../../obj/macosx/gmake/x32/native/cppspec-test/x32
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/cppspec-test
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake -L. -Wl,-x -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/macosx/gmake/libcppspec.a ../../../bin/macosx/gmake/libgooglemock.a
  LIBS      += $(LDDEPS) -lboost_regex-mt -lboost_program_options-mt -lboost_filesystem-mt -lboost_date_time-mt -lboost_chrono-mt -lboost_thread-mt -lboost_system-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Debug/cppspec-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Debug
  TARGET     = $(TARGETDIR)/cppspec-test
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x64/Debug -L. -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Debug/libcppspec.a ../../../bin/macosx/gmake/x64/Debug/libgooglemock.a
  LIBS      += $(LDDEPS) -lboost_regex-mt -lboost_program_options-mt -lboost_filesystem-mt -lboost_date_time-mt -lboost_chrono-mt -lboost_thread-mt -lboost_system-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/Release/cppspec-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake/x64/Release
  TARGET     = $(TARGETDIR)/cppspec-test
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake/x64/Release -L. -Wl,-x -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/x64/Release/libcppspec.a ../../../bin/macosx/gmake/x64/Release/libgooglemock.a
  LIBS      += $(LDDEPS) -lboost_regex-mt -lboost_program_options-mt -lboost_filesystem-mt -lboost_date_time-mt -lboost_chrono-mt -lboost_thread-mt -lboost_system-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),native64)
  OBJDIR     = ../../../obj/macosx/gmake/x64/native/cppspec-test/x64
  TARGETDIR  = ../../../bin/macosx/gmake
  TARGET     = $(TARGETDIR)/cppspec-test
  DEFINES   += -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I../../../googlemock/fused-src -I../../../cucumber-cpp/include -I../../../cppspec/include -I/usr/local/include
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../bin/macosx/gmake -L. -Wl,-x -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/macosx/gmake/libcppspec.a ../../../bin/macosx/gmake/libgooglemock.a
  LIBS      += $(LDDEPS) -lboost_regex-mt -lboost_program_options-mt -lboost_filesystem-mt -lboost_date_time-mt -lboost_chrono-mt -lboost_thread-mt -lboost_system-mt
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/BoostTimerTest.o \
	$(OBJDIR)/DummyReporter.o \
	$(OBJDIR)/ExceptionThrowingSpecificationTest.o \
	$(OBJDIR)/ExpectationTest.o \
	$(OBJDIR)/InvocationTest.o \
	$(OBJDIR)/InvokingTypeTest.o \
	$(OBJDIR)/JUnitReporterTest.o \
	$(OBJDIR)/main.o \
	$(OBJDIR)/MatcherTest.o \
	$(OBJDIR)/SpecDoxReporterTest.o \
	$(OBJDIR)/SpecificationRegistryTest.o \
	$(OBJDIR)/SpecificationTest.o \
	$(OBJDIR)/SpecRunnerTest.o \
	$(OBJDIR)/TypeHasStreamingOperatorTest.o \
	$(OBJDIR)/VoidSpecification.o \

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
	@echo Linking cppspec-test
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
	@echo Cleaning cppspec-test
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

$(OBJDIR)/BoostTimerTest.o: ../../../cppspec/test/BoostTimerTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/DummyReporter.o: ../../../cppspec/test/DummyReporter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/ExceptionThrowingSpecificationTest.o: ../../../cppspec/test/ExceptionThrowingSpecificationTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/ExpectationTest.o: ../../../cppspec/test/ExpectationTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/InvocationTest.o: ../../../cppspec/test/InvocationTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/InvokingTypeTest.o: ../../../cppspec/test/InvokingTypeTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/JUnitReporterTest.o: ../../../cppspec/test/JUnitReporterTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/main.o: ../../../cppspec/test/main.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/MatcherTest.o: ../../../cppspec/test/MatcherTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/SpecDoxReporterTest.o: ../../../cppspec/test/SpecDoxReporterTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/SpecificationRegistryTest.o: ../../../cppspec/test/SpecificationRegistryTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/SpecificationTest.o: ../../../cppspec/test/SpecificationTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/SpecRunnerTest.o: ../../../cppspec/test/SpecRunnerTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/TypeHasStreamingOperatorTest.o: ../../../cppspec/test/TypeHasStreamingOperatorTest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/VoidSpecification.o: ../../../cppspec/test/VoidSpecification.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif