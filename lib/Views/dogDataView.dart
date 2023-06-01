// ignore_for_file: file_names, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:googlecloud/Services/dataServices.dart';

class DogData extends StatefulWidget {
  const DogData({super.key});

  @override
  State<DogData> createState() => _DogDataState();
}

class _DogDataState extends State<DogData> {
  late Future<DogModel?> _dogData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dogData = DataServices.getSingleDog("dalmatian");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _dogData,
            builder: (context, snapshot) {
              var dogData = snapshot.data;
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error.toString()}"));
              } else if (snapshot.hasData) {
                return Center(
                    child: Card(
                        child: ListTile(
                  title: Text(dogData!.name),
                  subtitle: Text(dogData.type),
                  trailing: IconButton(
                      onPressed: () {
                        DataServices().deleteDogData(dogData.id);
                      },
                      icon: const Icon(Icons.delete)),
                )));
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              }
            }),
      ),
    );
  }
}
