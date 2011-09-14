#include <NanodeUNIO.h>

void setup() {
  byte macaddr[6];
  char buf[20];
  NanodeUNIO unio(NANODE_MAC_DEVICE);
  boolean r;

  Serial.begin(38400);
  Serial.println("Nanode MAC reader\n");
  Serial.print("Reading MAC address... ");
  r=unio.read(macaddr,NANODE_MAC_ADDRESS,6);
  if (r) Serial.println("success");
  else Serial.println("failure");
  sprintf(buf,"%02X:%02X:%02X:%02X:%02X:%02X",
          macaddr[0],macaddr[1],macaddr[2],
          macaddr[3],macaddr[4],macaddr[5]);
  Serial.print("MAC address is ");
  Serial.println(buf);
}

void loop() {
}
