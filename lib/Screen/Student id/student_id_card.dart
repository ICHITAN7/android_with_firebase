import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
class StudentIdCard extends StatelessWidget {
  const StudentIdCard({
    super.key,
    required this.width,
    required this.name,
    required this.id,
    required this.classId,
    required this.department,
    required this.year,
    required this.urlImage,
  });

  final double width;
  final String name;
  final String id;
  final String classId;
  final String department;
  final String year;
  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 250,
      child: Container(
        margin: EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
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
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultRadius),
                    topRight: Radius.circular(defaultRadius)),
              ),
              child: Center(
                  child: Text(
                'School name',
                style: customStyleBodyh1,
              )),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  width: width * 35 / 100,
                  height: 175,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(defaultRadius)),
                    child: Image.network(urlImage, fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: defaultPadding, right: defaultPadding),
                  width: width * 60 / 100,
                  height: 175,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name : $name',
                        style: customStyleBodyp,
                      ),
                      Text(
                        'ID : $id',
                        style: customStyleBodyp,
                      ),
                      Text(
                        'Class : $classId',
                        style: customStyleBodyp,
                      ),
                      Text(
                        'Department : $department',
                        style: customStyleBodyp,
                      ),
                      Text(
                        'Year : $year',
                        style: customStyleBodyp,
                      ),
                      BarcodeWidget(
                        height: 40,
                        data: id,
                        barcode: Barcode.code128(),
                        drawText: false,
                      ),
                    ],
                  ),
                )
              ],
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
        ),
      ),
    );
  }
}
