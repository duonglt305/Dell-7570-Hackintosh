/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL7I3Jby.aml, Fri May 22 20:46:08 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000113 (275)
 *     Revision         0x02
 *     Checksum         0x84
 *     OEM ID           "hack"
 *     OEM Table ID     "IMEI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "IMEI", 0x00000000)
{
    External (_SB_.PCI0.IGPU.GDID, FieldUnitObj)

    Device (_SB.PCI0.IMEI)
    {
        Name (_ADR, 0x00160000)  // _ADR: Address
    }

    Scope (_SB.PCI0.IMEI)
    {
        OperationRegion (RMP1, PCI_Config, 0x02, 0x02)
        Field (RMP1, AnyAcc, NoLock, Preserve)
        {
            MDID,   16
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Local1 = ^^IGPU.GDID /* External reference */
            Local2 = MDID /* \_SB_.PCI0.IMEI.MDID */
            If (((0x1C3A == Local2) && (Ones != Match (Package (0x02)
                                {
                                    0x0166, 
                                    0x0162
                                }, MEQ, Local1, MTR, Zero, Zero))))
            {
                Return (Package (0x02)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x3A, 0x1E, 0x00, 0x00                           // :...
                    }
                })
            }
            ElseIf (((0x1E3A == Local2) && (Ones != Match (Package (0x04)
                                {
                                    0x0116, 
                                    0x0126, 
                                    0x0112, 
                                    0x0122
                                }, MEQ, Local1, MTR, Zero, Zero))))
            {
                Return (Package (0x02)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x3A, 0x1C, 0x00, 0x00                           // :...
                    }
                })
            }

            Return (Package (0x00){})
        }
    }
}

