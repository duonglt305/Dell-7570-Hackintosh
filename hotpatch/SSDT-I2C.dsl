/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLpSRX8h.aml, Fri May 22 20:45:36 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000251 (593)
 *     Revision         0x02
 *     Checksum         0x01
 *     OEM ID           "hack"
 *     OEM Table ID     "I2C"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)
    External (_SB_.PCI0.GPI0.XSTA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.I2C0.TPD0, DeviceObj)
    External (_SB_.PCI0.I2C0.TPD0.SBFB, FieldUnitObj)
    External (_SB_.PCI0.I2C0.TPD0.SBFG, FieldUnitObj)
    External (_SB_.PCI0.I2C0.TPD0.XCRS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K.RMCF, UnknownObj)

    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }

            Return (XSTA ())
        }
    }

    Scope (_SB.PCI0.I2C0.TPD0)
    {
        If (_OSI ("Darwin"))
        {
            Name (SSCN, Package (0x03)
            {
                0x01B0, 
                0x01FB, 
                0x1E
            })
            Name (FMCN, Package (0x03)
            {
                0x48, 
                0xA0, 
                0x1E
            })
            Name (SBFX, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x001B
                    }
            })
        }

        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            If (_OSI ("Darwin"))
            {
                Return (ConcatenateResTemplate (SBFB, SBFX))
            }

            Return (XCRS ())
        }
    }

    If (_OSI ("Darwin"))
    {
        Name (_SB.PCI0.LPCB.PS2K.RMCF, Package (0x08)
        {
            "Mouse", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }, 

            "Synaptics TouchPad", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }, 

            "ALPS GlidePoint", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }, 

            "Sentelic FSP", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }
        })
    }
}

