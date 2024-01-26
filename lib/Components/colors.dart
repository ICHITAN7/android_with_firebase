import 'package:flutter/material.dart';
import 'package:get/get.dart';
Color primaryColor =const Color(0xFF40E8B5);
Color secondaryColor =const Color(0xFF0B6348);
void goToPage( Function() page){
  Get.to(page,transition: Transition.native,duration:const Duration(milliseconds: 700));
}