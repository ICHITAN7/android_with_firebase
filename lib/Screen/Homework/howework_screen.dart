import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:flutter/material.dart';

import 'homework.dart';
class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title:const Text('Homework',),centerTitle: true,backgroundColor: primaryColor,foregroundColor: Colors.black,),
      body: Padding(
        padding:  EdgeInsets.only(left:defaultPadding,right: defaultPadding,top: defaultPadding),
        child: const HomeworkList(),
      ),
    );
  }
}