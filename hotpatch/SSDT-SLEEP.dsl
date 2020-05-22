/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLYjm0sH.aml, Fri May 22 20:47:37 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000015C (348)
 *     Revision         0x02
 *     Checksum         0x58
 *     OEM ID           "hack"
 *     OEM Table ID     "PRW0D6D"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "PRW0D6D", 0x00000000)
{
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)

    Scope (_SB)
    {
        Method (PPPW, 0, Serialized)
        {
            Return (Package (0x02)
            {
                0x6D, 
                Zero
            })
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC))
    {
        Scope (_SB.PCI0.XHC)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XDCI))
    {
        Scope (_SB.PCI0.XDCI)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.HDAS))
    {
        Scope (_SB.PCI0.HDAS)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.GLAN))
    {
        Scope (_SB.PCI0.GLAN)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }
}

