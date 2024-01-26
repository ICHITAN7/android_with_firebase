import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:android_with_firebase/Controller/data_controller.dart';
import 'package:flutter/material.dart';
class MailScreen extends StatelessWidget {
  const MailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Mail"),
      ),
      body: FutureBuilder(
        future: DataController().message(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child:CircularProgressIndicator(),);
          }else if (snapshot.hasError){
              return const Text('Have some error');
          }
          final data = snapshot.data;
          final count = data['message'].length;
          return ListView.builder(
            itemCount: count,
            itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.all(defaultPadding),
                margin: EdgeInsets.only(top: defaultPadding,left: defaultPadding,right: defaultPadding),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultRadius),topRight: Radius.circular(defaultRadius),bottomRight: Radius.circular(defaultRadius))
                ),
                child: Text(data['message'][index],style: customStyleP,),
              );
            },
            );
        },
      ),
    );
  }
}