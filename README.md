
# Automatic Plant Watering System

Bu proje, toprak nem sensörü kullanarak bitkilerin otomatik olarak sulanmasını sağlar. %60 nem oranının altına düştüğünde, servo motor ile sulama işlemi yapılır.

## Kullanılan Bileşenler
- Arduino (Uno, Nano, vs.)
- MG995 Servo Motor
- Toprak Nem Sensörü (Analog)
- OLED Ekran (SSD1306)
- 5V Güç Kaynağı

## Proje Açıklaması
Toprak nem sensörü ile toprağın nem oranını ölçer. Eğer nem oranı %60'ın altına düşerse, servo motor bir su pompasını tetikler ve bitkilerin sulanmasını sağlar. Ayrıca, OLED ekranda nem oranı gösterilir.

### Bağlantı Şeması
- Servo Motor: Pin 9
- Nem Sensörü: Pin A0
