// ignore: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:provider/provider.dart';

class AllDogs extends StatefulWidget {
  const AllDogs({super.key});

  @override
  State<AllDogs> createState() => _AllDogsState();
}

class _AllDogsState extends State<AllDogs> {
  late Future<List<DogModel>?> _listOfDogs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listOfDogs = DataServices.gotAllDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "All Dogs",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: _listOfDogs,
            builder: (context, snapshot) {
              var dogs = snapshot.data;
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                        "Some error occured ${snapshot.error.toString()}"));
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: dogs!.length,
                    itemBuilder: (context, index) {
                      var dog = dogs[index];
                      return Card(
                        child: ListTile(
                          title: Text(dog.name),
                          subtitle: Text(dog.origin),
                          trailing: Text(dog.lifeExpectancy.toString()),
                          onTap: () {
                            DataServices().deleteDogData(dog.id);
                          },
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
            }),
      ),
    );
  }
}
