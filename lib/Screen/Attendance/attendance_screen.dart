import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('dd MMMM yyyy').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title:const Text('Attendance'),
        centerTitle: true,
       
      ),
      body: FutureBuilder(
        future: DataController().getUser(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          final user = snapshot.data;
          List<dynamic> attendances = user!['attendances'];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: attendances.length,
              itemBuilder: (context,index){
                final attendance = attendances[index];
                String daySet  = 'Today';
                if(today!=attendance['date']){
                  daySet = attendance['date'];
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius:const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date  : $daySet'),
                              Text('Class : ${attendance['class_id']}'),
                              Text('Time  : ${attendance['time']}'),
                            ],
                          ),
                          attendance['status']==false?
                          Container(
                            width: 80,
                            height: 35,
                            padding:const EdgeInsets.all(10),
                            decoration:const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:const Center(child: Text('Absent',style: TextStyle(color: Colors.white),)),
                          ):
                          Container(
                            width: 80,
                            height: 35,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius:const BorderRadius.all(Radius.circular(10))
                            ),
                            child:const Center(child: Text('Present',style: TextStyle(color: Colors.white),)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
