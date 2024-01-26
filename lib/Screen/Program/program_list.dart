
import 'package:flutter/material.dart';

import '../../Controller/data_controller.dart';
import 'program_card.dart';
class ProgramList extends StatelessWidget {
  const ProgramList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataController().listProgram(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }else{
            final data = snapshot.data;
            return SizedBox(
              height: 250,
              child: GridView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: data!.length,
                  itemBuilder:(context,index){
                    final programData = data[index];
                    return ProgramCard(
                        image: programData['img'],
                        title: programData['title'],
                        color: programData['color'],
                        date:  programData['date']
                    );
                  }
              ),
            );
          }
        }
    );
  }
}