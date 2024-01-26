import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/textFormField.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:android_with_firebase/Screen/HomeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    void login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        if(userCredential.user!=null){
          Get.snackbar('Message', 'Success');
          Get.off(const HomePage());
        }
      }on FirebaseAuthException catch(ex){
        Get.snackbar('Error', ex.code.toString());
      }
    }
    return Scaffold(
      body: Form(
        key: keyForm,
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(controller: emailController, labelText: 'Email', hintText: 'boot@example.com',focusedBorderColor: primaryColor,isEmailField: true,labelColor: primaryColor,),
              const SizedBox(height: 20,),
              CustomTextField(controller: passwordController, labelText: 'Password', hintText: '8 Charator',focusedBorderColor: primaryColor,isPasswordField: true,labelColor: primaryColor,),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: (){
                  if (keyForm.currentState!.validate()) {
                    keyForm.currentState!.save();
                  login();
                }
              },
              child:Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius))
                  ),
                  child:Center(child: Text('Login',style: customStyleBodyp,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}