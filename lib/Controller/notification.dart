import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final firebaseMessage = FirebaseMessaging.instance;
  Future<void> notification() async {
    await firebaseMessage.requestPermission();
    final token = await firebaseMessage.getToken();
    print(token);
  }
}