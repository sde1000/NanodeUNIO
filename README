All Nanodes (should!) have a Microchip 11AA02E48 serial EEPROM chip
soldered to the underneath of the board (it's the three-pin
surface-mount device).  This chip contains a unique ethernet address
("MAC address") for the Nanode.

To read the MAC address using this library, use code like this in your
sketch:

#include <NanodeUNIO.h>

void setup() {
  byte macaddr[6];
  NanodeUNIO unio(NANODE_MAC_DEVICE);

  unio.read(macaddr,NANODE_MAC_ADDRESS,6);
}

(If you're using a library like NanodeUIP for networking on your
Nanode, you may find that it's already using this library to read the
MAC address from the chip.)

The MAC address only takes up 6 bytes in the chip.  The other 250
bytes are potentially available for you to use.  (By default the top
64 bytes are write-protected, leaving the lower 192 bytes available,
but you can disable this as long as you're careful not to overwrite
the pre-programmed MAC address.)

See the header file (NanodeUNIO.h) for more information on writing to
the chip.

Comments?  Suggestions?  Contact Stephen Early <steve@greenend.org.uk>
@sde1000 on Twitter
