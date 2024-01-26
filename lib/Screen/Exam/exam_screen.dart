
import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:android_with_firebase/Screen/Exam/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Subjects'),centerTitle: true,foregroundColor: Colors.black,backgroundColor: primaryColor,),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            showDialog(
            context: context, 
            builder:(context){
              return AlertDialog(
                title:const Text('Exam : 1h30mn'),
                content:const Text('Do you want to start?'),
                actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(()=>const Questions());
              },
              child:const Text('Start'),
            ),
          ],
              );
            });
          },
          child: Container(
        
            margin: EdgeInsets.only(top:defaultPadding,left: defaultPadding,right: defaultPadding),
            padding: EdgeInsets.all(defaultPadding+5),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(defaultRadius))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Midterm Y3S1',style: customStyleBodyh1,),
                  Text('Subject: Java Programming',style: customStyleBodyp,),
                  Text('Start Time:23-11-2020',style: customStyleBodyp,),
                  Text('End Time:24-11-2020',style: customStyleBodyp,),
                  Text('Duration:1h30mn',style: customStyleBodyp,),
                ],
              ),
              const Icon(Icons.navigate_next_outlined)
            ],),
          ),
        ),
        ),
    );
  }
}