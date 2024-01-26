import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ListUsers extends StatefulWidget {
  final String title;
  final String subtitle;
  late bool check;
  final String documentId;
  ListUsers({
    super.key, required this.title, required this.subtitle, required this.check, required this.documentId,
  });

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  void updateCheckValueInFirestore(String documentId, bool newValue) async {
    await FirebaseFirestore.instance.collection('homeworks').doc(documentId).update({
      'check': newValue,
    });

    // Update the local state with the new value
    setState(() {
      widget.check = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom: defaultPadding),
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding:EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Text(widget.title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(widget.subtitle,style: const TextStyle(color: Colors.black),)
                ],
              ),
              Checkbox(
                  value:widget.check,
                  activeColor: Colors.black,
                  onChanged: (newValue) {
                      updateCheckValueInFirestore(widget.documentId, newValue!);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
