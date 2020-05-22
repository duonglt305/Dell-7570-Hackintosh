DefinitionBlock ("", "SSDT", 2, "hack", "DELL", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)
    External (_SB_.PCI0.IGPU.LCD_, DeviceObj)
    External (_SB_.PCI0.IGPU.XRT6, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (LCD_, UnknownObj)
    External (RMDT.P2__, MethodObj)    // 2 Arguments

    Scope (_SB.PCI0.IGPU)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P2 ("DLeeDebug-", 0x0406)
                If ((Arg0 == One))
                {
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                }

                If ((Arg0 & 0x02))
                {
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                }
            }
            ElseIf (CondRefOf (XRT6))
            {
                XRT6 ()
            }
        }
    }
}

