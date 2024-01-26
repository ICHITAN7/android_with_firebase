
import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    PlatformFile? pickerFile;
    Future selectFile()async {
       await Permission.storage.request();
      final result = await FilePicker.platform.pickFiles();
      if(result==null)return;
      setState(() {
        pickerFile==result.files.first;
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
          children: [
            Center(child: Text('Question : 30',style: customStyleH2,)),
            Container(
              width: width,
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(defaultRadius))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Q1 : What is CSE?',style: customStyleBodyh1,),
                  Text('A  : Container School Education'),
                  Text('A  : Container School Education'),
                  Text('A  : Container School Education')
                ],
              ),
            ),
            MaterialButton(onPressed: (){
              print('selected');
              selectFile();
            },
            child: Text('Add You File'),
            ),
            MaterialButton(onPressed: (){

            },
            child: Text('Submit You File'),
            ),
          ],
              ),
        )),
    );
  }
}