/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLmXiCDm.aml, Fri May 22 20:47:12 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000128 (296)
 *     Revision         0x02
 *     Checksum         0x00
 *     OEM ID           "hack"
 *     OEM Table ID     "_SATA"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190703 (538511107)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_SATA", 0x00000000)
{
    External (_SB_.PCI0.SATA, DeviceObj)

    Scope (_SB.PCI0.SATA)
    {
        OperationRegion (RMP1, PCI_Config, 0x02, 0x02)
        Field (RMP1, AnyAcc, NoLock, Preserve)
        {
            SDID,   16
        }

        Name (SDDL, Package (0x09)
        {
            0x282A, 
            0x2822, 
            Zero, 
            Package (0x04)
            {
                "device-id", 
                Buffer (0x04)
                {
                     0x29, 0x28, 0x00, 0x00                           // )(..
                }, 

                "compatible", 
                Buffer (0x0D)
                {
                    "pci8086,2829"
                }
            }, 

            0xA103, 
            0x9D03, 
            0xA282, 
            Zero, 
            Package (0x04)
            {
                "device-id", 
                Buffer (0x04)
                {
                     0x02, 0xA1, 0x00, 0x00                           // ....
                }, 

                "compatible", 
                Buffer (0x0D)
                {
                    "pci8086,a102"
                }
            }
        })
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Local0 = Match (SDDL, MEQ, ^SDID, MTR, Zero, Zero)
            If ((Ones != Local0))
            {
                Local0 = Match (SDDL, MEQ, Zero, MTR, Zero, (Local0 + One))
                Return (DerefOf (SDDL [(Local0 + One)]))
            }

            Return (Package (0x00){})
        }
    }
}

