#include <Wire.h>                    
#include <Adafruit_GFX.h>            
#include <Adafruit_SSD1306.h>         
#include <Servo.h>                    

#define SCREEN_WIDTH 128              
#define SCREEN_HEIGHT 64              
#define OLED_RESET    -1              
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

int sensorPin = A0;  
int sensorValue = 0; 
float voltage = 0.0; 
float moisture = 0.0; 
float sondeger = 0.0; 
int pos = 0;
Servo myServo;  

void setup() {
  Serial.begin(9600);  
  pinMode(sensorPin, INPUT); 

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("OLED ekran başlatılamadı"));
    while (1);  
  }
  
  display.display(); 
  delay(2000);        
  display.clearDisplay();  
  
  myServo.attach(9);
  myServo.write(90); 
}

void loop() {
  sensorValue = analogRead(sensorPin);

  voltage = sensorValue * (5.0 / 1023.0); 
  
  moisture = -(sensorValue / 1023.0) * 100;  
  moisture = moisture + 100;
  sondeger = abs(moisture); 

  
  Serial.print("Toprak Nem Oranı: ");
  Serial.print(sondeger);
  Serial.println("%");

  display.clearDisplay();
  display.setTextSize(1);      
  display.setTextColor(SSD1306_WHITE); 
  display.setCursor(0, 0);     
  display.print("Toprak Nem Orani: ");
  display.print(sondeger);
  display.print("%");

  
  display.display();

  
  if (sondeger < 60 ) {
    
    for (pos = 0; pos <= 180; pos += 1){
      myServo.attach(9);
      myServo.write(pos); 
      delay(10);  
    }
    
    myServo.detach();
   
    for (pos = 180; pos >= 0; pos -= 1){
      myServo.attach(9);
      myServo.write(pos); 
      delay(10);  
    }
    myServo.detach();
    
  }

  delay(600000);  
}
