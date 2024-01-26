import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:android_with_firebase/Screen/Attendance/attendance_screen.dart';
import 'package:android_with_firebase/Screen/Schedule/schedule_screen.dart';
import 'package:android_with_firebase/Screen/Student%20id/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:type_text/type_text.dart';
import '../../Controller/data_controller.dart';
import '../Exam/exam_screen.dart';
import '../Homework/howework_screen.dart';
import '../Message/mail.dart';
import 'menu_home_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DataController().getUser();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: DataController().getUser(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }else{
            final user = snapshot.data;
            List<dynamic> attendances = user!['attendances'];
            int count = attendances.where((attendance) => attendance['status'] == true).length;
            int total = attendances.length;
            double percentage = total > 0 ? (count / total) * 100 : 0;
            return Scaffold(
              backgroundColor:primaryColor,
              body: Container(
                padding: EdgeInsets.only(top:height*5/100),
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Container(
                      height: height*30/100,
                      decoration:BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(defaultRadius),bottomLeft:Radius.circular(defaultRadius)),
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(left: defaultPadding,right:defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(children: [
                                      Text('Hi ',style: customStyleH2),
                                      SizedBox(
                                        width: width/2,
                                          child: TypeText(user['name'],duration:const Duration(seconds: 1),style: customStyleH1,overflow: TextOverflow.ellipsis,)),
                                    ]),
                                  ],
                                ),
                                CircleAvatar(
                                    radius: 55,
                                    backgroundImage: NetworkImage(user['image_url'],),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width*45/100,
                                  height: height*11/100,
                                  decoration:BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      const SizedBox(height: 5,),
                                      Text('Attendance',style:customStyleP),
                                      const Divider(height: 1,color: Colors.black),
                                      Text('${percentage.toString()}%',style:const TextStyle(fontSize: 30),),
                                      const SizedBox(height: 5,),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width*45/100,
                                  height: height*11/100,
                                  decoration:BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      const SizedBox(height: 5,),
                                      Text('Class',style: customStyleP,),
                                      const Divider(height: 1,color: Colors.black),
                                      Text('${user['class_id']}',style:const TextStyle(fontSize: 30),),
                                      const SizedBox(height: 5,),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height*60/100,
                      //padding:const EdgeInsets.only(top:70,left: 20,right: 20,bottom: 70),
                      decoration:const BoxDecoration(
                        borderRadius:BorderRadius.only(topLeft:Radius.circular(60),topRight: Radius.circular(60),),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height:defaultPadding+10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Menu(title:'Schedule',image: 'assets/Icons/schedule.svg',screen: ScheduleScreen(classId: user['class_id']),),
                              SizedBox(width:defaultPadding+10),
                              const Menu(title:'Attendence',image: 'assets/Icons/attendance.svg',screen: AttendanceScreen(),),
                            ],
                          ),
                          SizedBox(height:defaultPadding+10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Menu(title:'Homework',image: 'assets/Icons/homework.svg',screen: HomeworkScreen()),
                              SizedBox(width:defaultPadding+10),
                              const Menu(title:'Exam',image: 'assets/Icons/exam.svg',screen: ExamScreen(),),
                            ],
                          ),
                          SizedBox(height:defaultPadding+10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Menu(title:'Student ID',image: 'assets/Icons/studentid.svg',screen:ProfileScreen(),),
                              SizedBox(width:defaultPadding+10),
                              const Menu(title:'Mail',image: 'assets/Icons/mail.svg',screen: MailScreen(),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
    );
  }
}