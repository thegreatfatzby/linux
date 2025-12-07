DefinitionBlock ("mydev.aml", "SSDT", 2, "QEMU", "MYDEV", 0x00000001)
{
    Scope (\_SB)
    {
        Device (MYDV)
        {
            Name (_HID, "QEMU0001")
            Name (_UID, 1)

            Method (_STA, 0) {
                Return (0x0F)
            }

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                               0xFEDC0000,   // example
                               0x1000)
            })
        }
    }
}

