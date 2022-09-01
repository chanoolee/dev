#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>

const char* wifiId = "itschool303";
const char* wifiPwd = "!itschool303";
ESP8266WebServer server(80);

const int led = 14;
String s,s_head;

void handleRoot() {
  digitalWrite(led, HIGH);
  s=s_head+"<h1>아두이노 wifi test !</h1><br><h3>wifi 켜짐</h3><br>";
  server.send(200, "text/html", s); 
  //server.send(200, "text/plain", "hello from esp8266!");
  
}

void handleNotFound(){
  digitalWrite(led, 1);
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET)?"GET":"POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i=0; i<server.args(); i++){
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
  digitalWrite(led, 0);
}
// WIFI_STA (Station mode, Stand-alone mode)
// 다른 공유기에 접속해서 IP를 할당받고, HTTP 통신을 사용하는 모드입니다
void setupWifi() {
  WiFi.mode(WIFI_STA); 
  WiFi.begin(wifiId, wifiPwd);
  Serial.println("");

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print("-");
  }
  Serial.println("");
  Serial.print(wifiId);
  Serial.println("로 연결 성공");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void setup(void){
  pinMode(led, OUTPUT);
  digitalWrite(led, LOW);
  Serial.begin(9600);

  // 여기 프로그램 부분을 함수로처리
  setupWifi();

  // 스마트폰에 맟게 크기 조정, html에서 한글 출력하게 설정
  s_head="<meta name='viewport' content='width=device-width, initial-scale=1.0'/>";
  //s=s+"<meta http-equiv='refresh' content='5'/>";
  s_head=s_head+"<meta http-equiv='Content-Type' content='text/html;charset=utf-8' />";


  
  server.on("/", handleRoot);
  server.on("/wifiOff", [](){
    //server.send(200, "text/plain", "this works as well");
    digitalWrite(led, LOW);
    s=s_head+"<h1>아두이노 wifi test !</h1><br><h3>wifi 꺼짐</h3><br>";
    server.send(200, "text/html", s); 
  });

  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP 서버를 시작합니다.");
}

void loop(void){
  server.handleClient();
}
