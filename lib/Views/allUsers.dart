import 'package:flutter/material.dart';
import 'package:googlecloud/Models/userModel.dart';
import 'package:googlecloud/Services/dataServices.dart';

class AllUsers extends StatefulWidget {
  final String? token;
  const AllUsers({super.key, this.token});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Users",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: FutureBuilder<List<UserModel>?>(
              future: DataServices().alltheUsers(widget.token),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("No users exists",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var users = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text('${users.username}'),
                          subtitle: Text('${users.email}'),
                        ),
                      );
                    });
              })),
    );
  }
}
