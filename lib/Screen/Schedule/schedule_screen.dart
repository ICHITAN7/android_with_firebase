import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/size.dart';
import 'package:android_with_firebase/Controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key, required this.classId});

  final String classId;

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}
String getDayName(){
  DateTime now = DateTime.now();
  return DateFormat('EEEE').format(now);
}
class _ScheduleScreenState extends State<ScheduleScreen> {

  List<String> day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  DateTime focusedDay = DateTime.now();
  DateTime firstDay = DateTime(2020);
  DateTime lastDay = DateTime.utc(2024);
  final dayCheck = getDayName().toString();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Schedule'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: primaryColor,
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: DataController().oneClass(classId: widget.classId),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child:CircularProgressIndicator(),);
                }else if (snapshot.hasError){
                  return const Text('Have some error');
                }
                final classes = snapshot.data;
                return dayCheck=='Sunday'?
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://i.pinimg.com/474x/44/10/f3/4410f37c52ddef5e6e20eaa89f680e7e.jpg'),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREIlrS13dqlwhYt2nUL4Hux1NwP16DFMD3YQ&usqp=CAU'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://i.pinimg.com/474x/d9/10/e9/d910e9b141e178c8596fd696cf43f6cc.jpg'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ],
                ):
                ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: classes!['schedule']['day'].length,
                    scrollDirection: Axis.vertical,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: EdgeInsets.only(top: defaultPadding,left: defaultPadding,right: defaultPadding),
                        child: Container(
                          height: 100,
                          decoration:BoxDecoration(
                            color: dayCheck==day[index]?primaryColor.withOpacity(0.7):primaryColor.withOpacity(0.2),
                            borderRadius:BorderRadius.all(Radius.circular(defaultRadius)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 3,),
                              SizedBox(width:100, child: Text(day[index])),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:const [
                                  Text('07:30am-09:00am : '),
                                  SizedBox(height: 10,),
                                  Text('09:15am-11:00am : '),
                                ],
                              ),
                              const SizedBox(width: 3,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${classes['schedule']['day'][index]['time1']}',style:const TextStyle(overflow: TextOverflow.ellipsis),),
                                  const SizedBox(height: 10,),
                                  Text('${classes['schedule']['day'][index]['time2']}',style:const TextStyle(overflow: TextOverflow.ellipsis),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              },
            ),
          ],
        ),
      ) ,
    );
  }
}
