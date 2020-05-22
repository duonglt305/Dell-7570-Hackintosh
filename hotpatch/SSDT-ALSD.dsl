DefinitionBlock ("", "SSDT", 2, "hack", "_ALSD", 0x00000000)
{
    External (ALSE, IntObj)

    Method (_INI, 0, NotSerialized)  // _INI: Initialize
    {
        If (_OSI ("Darwin"))
        {
            ALSE = 0x02
        }
    }
}

