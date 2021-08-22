; // RAS_TEST.mc 

; // This is the header section.


SeverityNames=(Success=0x0:STATUS_SEVERITY_SUCCESS
               Informational=0x1:STATUS_SEVERITY_INFORMATIONAL
               Warning=0x2:STATUS_SEVERITY_WARNING
               Error=0x3:STATUS_SEVERITY_ERROR
              )


FacilityNames=(System=0x0:FACILITY_SYSTEM
               Runtime=0x2:FACILITY_RUNTIME
               Stubs=0x3:FACILITY_STUBS
               Io=0x4:FACILITY_IO_ERROR_CODE
              )

LanguageNames=(English=0x409:MSG00409)
LanguageNames=(Japanese=0x411:MSG00411)


; // The following are the categories of events.

MessageId = 0x2
Severity = Error
Facility = System
SymbolicName = MSG_MEMORY_ERROR
Language = English
Memory Error
.
Language = Japanese
memory error
.

MessageId = 0x177D
Severity = Error
Facility = System
SymbolicName = MSG_TEST_ERROR
Language = English
TEST Error
.
Language = Japanese
TEST %1 error %2
.
