// ignore: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Views/homeView.dart';

import 'allUsers.dart';

class AllDogs extends StatefulWidget {
  final String? token;
  const AllDogs({super.key, this.token});

  @override
  State<AllDogs> createState() => _AllDogsState();
}

class _AllDogsState extends State<AllDogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 248, 228, 191),
        title: const Text(
          "All Dogs",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const HomeView()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 248, 228, 191),
          child: ListView(
            children: [
              FutureBuilder(
                  future: DataServices().myUsers(widget.token),
                  builder: (context, snapshot) {
                    var user = snapshot.data;
                    if (user == null) {
                      return const DrawerHeader(child: Text('Username Email'));
                    }
                    return DrawerHeader(
                        child: Text("${user.username} ${user.email}"));
                  }),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AllUsers(token: widget.token)));
                },
              ),
              ListTile(
                title: const Text(
                  'LogOut',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  DataServices.signOut();
                },
              ),
            ],
          )),
      body: SafeArea(
        child: FutureBuilder(
            future: DataServices.gotAllDogs(),
            builder: (context, snapshot) {
              var dogs = snapshot.data;
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
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
                              DataServices.deleteDogData(dog.id);
                              setState(() {});
                            },
                          ),
                        );
                      });
                } else {
                  return const Center(
                      child: Text("Error fetching data",
                          style: TextStyle(fontWeight: FontWeight.bold)));
                }
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
