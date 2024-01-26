import 'package:flutter/material.dart';
class ProgramCard extends StatelessWidget {
  final String image;
  final String title;
  final int color;
  final String date;
  const ProgramCard({
    super.key, required this.image, required this.title, required this.color, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration:BoxDecoration(
          color:Color(color),
          borderRadius:const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 140,
                ),
              ),
              Text(title,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Row(children:[const Spacer(),Text(date,style:const TextStyle(color: Colors.black),),const Spacer()])
            ],
          ),
        ),
      ),
    );
  }
}