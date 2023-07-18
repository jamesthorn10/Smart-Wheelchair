#include <SoftwareSerial.h>
SoftwareSerial BT (2, 3);

const int m11=10;
const int m12=11;
const int m21=12;
const int m22=13;
const int LED=4;
const int HORN=5;

void setup(){
  BT.begin(9600);
  pinMode (m11, OUTPUT);
  pinMode (m12, OUTPUT);
  pinMode (m21, OUTPUT);
  pinMode (m22, OUTPUT);
  pinMode (LED, OUTPUT);
  pinMode (HORN, OUTPUT);
}

void loop()
{
  while(BT.available() > 0)
  {
    char data = BT.read();

      if(data == 'f')
      {
        forward();
      }
      else if(data=='b')
      {
        backward();
      }
      else if(data=='l')
      {
        left();
      }
      else if(data=='r')
      {
        right();
      }
      else if(data=='t')
      {
        stopit();
      }
      else if(data=='w')
      {
        digitalWrite(LED, HIGH);
      }
      else if(data=='y')
      {
        digitalWrite(LED, LOW);
      }
      else if(data=='z')
      {
        digitalWrite(HORN, HIGH);
        delay(200);
        digitalWrite(HORN, LOW);
      }
  }  
}

void forward()
{
 digitalWrite(m11,HIGH);
 digitalWrite(m21,HIGH);
 digitalWrite(m12,LOW);
 digitalWrite(m22,LOW);
}

void backward()
{
 digitalWrite(m11,LOW);
 digitalWrite(m21,LOW);
 digitalWrite(m12,HIGH);
 digitalWrite(m22,HIGH);
}

void left()
{
 digitalWrite(m11,HIGH);
 digitalWrite(m21,LOW);
 digitalWrite(m12,LOW);
 digitalWrite(m22,HIGH);
}

void right()
{
 digitalWrite(m11,LOW);
 digitalWrite(m21,HIGH);
 digitalWrite(m12,HIGH);
 digitalWrite(m22,LOW);
}

void stopit()
{
 digitalWrite(m11,LOW);
 digitalWrite(m21,LOW);
 digitalWrite(m12,LOW);
 digitalWrite(m22,LOW);
}