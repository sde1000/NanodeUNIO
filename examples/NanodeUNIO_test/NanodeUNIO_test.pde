#include <NanodeUNIO.h>

static void status(boolean r)
{
  if (r) Serial.println("(success)");
  else Serial.println("(failure)");
}

static void dump_eeprom(void)
{
  byte buf[256];
  char lbuf[80];
  char *x;
  int i,j;

  NanodeUNIO unio(NANODE_MAC_DEVICE);
  
  memset(buf,0,256);
  status(unio.read(buf,0,256));
  
  for (i=0; i<256; i+=16) {
    x=lbuf;
    sprintf(x,"%02X: ",i);
    x+=4;
    for (j=0; j<16; j++) {
      sprintf(x,"%02X",buf[i+j]);
      x+=2;
    }
    *x=32;
    x+=1;
    for (j=0; j<16; j++) {
      if (buf[i+j]>=32 && buf[i+j]<127) *x=buf[i+j];
      else *x=46;
      x++;
    }
    *x=0;
    Serial.println(lbuf);
  }
}

void setup() {
  char *x="The quick brown fox jumped over the lazy dog.";
  byte sr;
  NanodeUNIO unio(NANODE_MAC_DEVICE);
  
  Serial.begin(38400);
  Serial.println("NanodeUNIO test\n");

  Serial.println("Read status register...");
  status(unio.read_status(&sr));
  Serial.println(sr,HEX);
  
  Serial.println("Read the device...");
  dump_eeprom();
  
  Serial.println("Write to the device...");
  status(unio.simple_write((const byte *)x,10,strlen(x)+1));

  Serial.println("Read again...");
  dump_eeprom();

  Serial.println("Try writing in the write-protected area...");
  status(unio.simple_write((const byte *)x,0xd0,strlen(x)+1));

  Serial.println("Read again...");
  dump_eeprom();
}

void loop() {
}

