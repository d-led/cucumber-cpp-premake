# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug)
  OBJDIR     = Debug/obj/Debug/CppSpecCalculatorSteps
  TARGETDIR  = ../cucumber-cpp/examples/Calc/features/step_definitions
  TARGET     = $(TARGETDIR)/CppSpecCalculatorSteps
  DEFINES   += -DDEBUG -D_DEBUG
  INCLUDES  += -I.. -I../cppspec/include -I../googlemock/fused-src -I../cucumber-cpp/include -I../cucumber-cpp/examples/Calc/src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -v -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -L../bin/Debug
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += ../bin/Debug/libcucumber-cpp-main.a ../bin/Debug/libcucumber-cpp.a ../bin/Debug/libcppspec.a ../bin/Debug/libcucumber-cpp-cppspec-driver.a -lpthread -lboost_system-mt -lboost_regex-mt -lboost_chrono-mt -lboost_thread-mt
  LDDEPS    += ../bin/Debug/libcucumber-cpp-main.a ../bin/Debug/libcucumber-cpp.a ../bin/Debug/libcppspec.a ../bin/Debug/libcucumber-cpp-cppspec-driver.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = Release/obj/Release/CppSpecCalculatorSteps
  TARGETDIR  = ../cucumber-cpp/examples/Calc/features/step_definitions
  TARGET     = $(TARGETDIR)/CppSpecCalculatorSteps
  DEFINES   += -DRELEASE
  INCLUDES  += -I.. -I../cppspec/include -I../googlemock/fused-src -I../cucumber-cpp/include -I../cucumber-cpp/examples/Calc/src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -v -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -L../bin/Release -s
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += ../bin/Release/libcucumber-cpp-main.a ../bin/Release/libcucumber-cpp.a ../bin/Release/libcppspec.a ../bin/Release/libcucumber-cpp-cppspec-driver.a -lpthread -lboost_system-mt -lboost_regex-mt -lboost_chrono-mt -lboost_thread-mt
  LDDEPS    += ../bin/Release/libcucumber-cpp-main.a ../bin/Release/libcucumber-cpp.a ../bin/Release/libcppspec.a ../bin/Release/libcucumber-cpp-cppspec-driver.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/CppSpecCalculatorSteps.o \
	$(OBJDIR)/Calculator.o \

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
	@echo Linking CppSpecCalculatorSteps
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
	@echo Cleaning CppSpecCalculatorSteps
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
ifeq (posix,$(SHELLTYPE))
	-$(SILENT) cp $< $(OBJDIR)
else
	$(SILENT) xcopy /D /Y /Q "$(subst /,\,$<)" "$(subst /,\,$(OBJDIR))" 1>nul
endif
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
endif

$(OBJDIR)/CppSpecCalculatorSteps.o: ../cucumber-cpp/examples/Calc/features/step_definitions/CppSpecCalculatorSteps.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Calculator.o: ../cucumber-cpp/examples/Calc/src/Calculator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
