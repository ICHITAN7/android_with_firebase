import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  Future<Map<String, dynamic>> getUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> users =
    await FirebaseFirestore.instance.collection('students').doc(uid).get();
    return users.data() ?? {};
  }
  Future<DocumentSnapshot<Map<String, dynamic>>> oneClass({required classId}) async {
    DocumentSnapshot<Map<String, dynamic>> classes =
    await FirebaseFirestore.instance.collection('classes').doc(classId).get();
    return classes;
  }
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> listHomework() async {
    QuerySnapshot<Map<String, dynamic>> users =
    await FirebaseFirestore.instance.collection('homeworks').get();
    return users.docs;
  }
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> listProgram() async {
    QuerySnapshot<Map<String, dynamic>> users =
    await FirebaseFirestore.instance.collection('programs').get();
    return users.docs;
  }
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> listClass() async {
    QuerySnapshot<Map<String, dynamic>> users =
    await FirebaseFirestore.instance.collection('classes').get();
    return users.docs;
  }
  Future<void> addHomework({required String title, required String subtitle}) async {
    try{
      await FirebaseFirestore.instance.collection('homeworks').add({
        'title': title,
        'sub_title': subtitle,
        'check': false
      });
      Get.snackbar('Message', 'Success');
    }on FirebaseException{
      print(FirebaseException);
    }
  }
  Future<Map<String, dynamic>> message() async {
    DocumentSnapshot<Map<String, dynamic>> mail = await FirebaseFirestore.instance.collection('mail').doc('student1').get();
    return mail.data() ?? {};
  }
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }
}