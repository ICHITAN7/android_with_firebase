import 'package:flutter/material.dart';

import 'list_tiles.dart';
import '../../Controller/data_controller.dart';
class AddHomework extends StatelessWidget {
  const AddHomework({
    super.key,
    required this.titleController,
    required this.subtitleController,
  });

  final TextEditingController titleController;
  final TextEditingController subtitleController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:const Text('New Homework'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: subtitleController,
                    decoration: const InputDecoration(labelText: 'Subtitle'),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.trim();
                    String subtitle = subtitleController.text.trim();
                    DataController().addHomework(title: title, subtitle: subtitle);
                    titleController.clear();
                    subtitleController.clear();
                    Navigator.pop(context);
                  },
                  child:const Text('Add'),
                ),
              ],
            );
          },
        );
      },
      icon:const Icon(Icons.add),
    );
  }
}

class HomeworkList extends StatelessWidget {
  const HomeworkList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataController().listHomework(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        else {
          final data = snapshot.data;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:data!.length ,
            itemBuilder: (context,index){
              final homeworkData = data[index];
              final id = homeworkData.id;
              return ListUsers(
                title: homeworkData['title'],
                subtitle:homeworkData['sub_title'],
                check: homeworkData['check'],
                documentId: id,
              );
            },
          );
        }
      },
    );
  }
}