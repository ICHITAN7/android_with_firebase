
import 'package:android_with_firebase/Screen/EmailPasswordAuth/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore store = FirebaseFirestore.instance;
    void createAccount() async {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      try{
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
        await store.collection("students").doc(user.user!.uid).set({
          'email':email,
          'name':name,
          'class_id':'value',
          'student_id':user.user!.uid,
        });
        List<DocumentReference> references = [
          FirebaseFirestore.instance.collection('students').doc(user.user!.uid),
        ];
        FirebaseFirestore.instance.collection('classes').doc('12A').
        update({
          'student_id':FieldValue.arrayUnion(references),
        });
        Get.snackbar('Message','Created');
        Get.to(LoginScreen());
      }on FirebaseAuthException catch(ex){
        print(ex.code.toString());
      }
    }
    return Scaffold(
      appBar: AppBar(
        title:const Text('Register'),
      ),
      body: Form(
        key: keyForm,
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: nameController,
              ),
              TextFormField(
                controller: emailController,
              ),
              TextFormField(
                controller: passwordController,
              ),
              MaterialButton(
                onPressed: (){
                  createAccount();
              },
              child:const Text('Register'),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}