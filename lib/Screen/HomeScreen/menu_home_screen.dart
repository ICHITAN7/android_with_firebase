import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Menu extends StatelessWidget {
  const Menu({
    super.key,
 required this.image, required this.screen, required this.title,
  });
  final String image;
  final Widget screen;
  final String title;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        goToPage(() => screen);
      },
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        width:width/2.5,
        height: height/6,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                primaryColor,
                secondaryColor
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black.withOpacity(0.5),
              offset:const Offset(3, 3),
              spreadRadius: 3
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(image,fit: BoxFit.contain,height: 70,),
            const Divider(),
            Text(title,style:customStyleP,)
          ],
        ),
      ),
    );
  }
}

