// ignore: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:googlecloud/Services/dataServices.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Cloud",
         style: TextStyle(
          fontWeight: FontWeight.bold
        )),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Life Expectancy"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(hintText: "Origin"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller3,
              decoration: const InputDecoration(hintText: "type"),
            ),
            TextButton(
                onPressed: () {
                  DataServices.getDogsData();
                },
                child: const Text("Get Data")),
            TextButton(
              onPressed: () {
              DataServices.addDogs(DogModel(
                id: 11,
                lifeExpectancy: 12,
                origin: "asd", 
                name: "Asdasd", 
                type: "asdasd"));
              },
              child: const Text("Post Data"),
            ),
            TextButton(
                onPressed: () {
                  DataServices.getSingleDog("dalmatian");
                },
                child: const Text("Get Data")),
          ],
        ),
      )),
    );
  }
}
