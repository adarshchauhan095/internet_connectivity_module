📡 Flutter Connectivity Status Listener

This Flutter utility class helps monitor the device’s internet connectivity status in real time. It uses the connectivity_plus package to detect changes in network state (WiFi, Mobile, Ethernet, or None) and verifies actual internet access by performing a DNS lookup.

🔧 Features
Real-time internet connectivity tracking

Checks both network availability and actual internet access

Broadcast stream for listening to connectivity changes

Singleton pattern for easy global access

Lightweight and easy to integrate into any Flutter app

🚀 How It Works
Listens for connectivity changes using connectivity_plus.

Performs a DNS lookup (InternetAddress.lookup('example.com')) to verify real internet access.

Streams the result (ConnectivityResult and online status) to subscribers.

📦 Usage
```dart
final myConnectivity = MyConnectivity.instance;

@override
void initState() {
  super.initState();
  myConnectivity.initialise();
  myConnectivity.myStream.listen((status) {
    // Handle connectivity update
    print(status);
  });
}
```
✅ Output
The stream emits a map like:
```dart
{ConnectivityResult.mobile: true}
```

📁 File Structure
my_connectivity.dart – Singleton class to manage connectivity status and stream updates.

📌 Requirements
connectivity_plus

Dart 2.12 or higher

Flutter SDK
