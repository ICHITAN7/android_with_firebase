import 'package:android_with_firebase/Controller/data_controller.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/colors.dart';
import '../../Components/size.dart';
import '../../Components/text_style.dart';
import '../EmailPasswordAuth/login_screen.dart';
import 'student_id_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text("ID Card"),
        backgroundColor: primaryColor,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: DataController().getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final student = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              FlipCard(
                direction: FlipDirection.VERTICAL,
                front: StudentIdCard(
                  width: width,
                  name: student['name'],
                  id: student['student_id'],
                  classId: student['class_id'],
                  department: 'Computer Science',
                  urlImage: student['image_url'],
                  year: '2023-2024',
                ),
                back: back(width, student),
              ),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: (){
                  DataController().logout();
                  Get.off(()=>const LoginScreen());
                },
                child:Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius))
                  ),
                  child:Center(child: Text('Logout',style: customStyleBodyp,)),
                ),
              ),
            ]);
          }
        },
      ),
    );
  }

  SizedBox back(double width, student) {
    return SizedBox(
                width: width,
                height: 250,
                child: Container(
                    margin: EdgeInsets.only(
                        left: defaultPadding, right: defaultPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(defaultRadius)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(4, 4),
                            color: Colors.black.withOpacity(0.3))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(defaultRadius),
                                topRight: Radius.circular(defaultRadius)),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: BarcodeWidget(
                              data: student['student_id'],
                              barcode: Barcode.qrCode()),
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(defaultRadius),
                                bottomRight: Radius.circular(defaultRadius)),
                          ),
                        ),
                      ],
                    )),
              );
  }
}