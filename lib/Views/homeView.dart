// ignore: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Views/signUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller0 = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  String? email;
// This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void instance() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString('login');
    }

    instance();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 248, 228, 191),
        title: const Text("Google Cloud",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 248, 228, 191),
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
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
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Id"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller0,
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
              controller: _controller4,
              decoration: const InputDecoration(hintText: "ImageUrl"),
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
                if (_controller.text.isNotEmpty &&
                    _controller0.text.isNotEmpty &&
                    _controller1.text.isNotEmpty &&
                    _controller2.text.isNotEmpty &&
                    _controller3.text.isNotEmpty) {

                  DataServices.addDogs(DogModel(
                      id: int.parse(_controller.text),
                      lifeExpectancy: int.parse(_controller0.text),
                      origin: _controller1.text,
                      name: _controller2.text,
                      type: _controller3.text));
                      
                  setState(() {});
                }
                _controller.clear();
                _controller0.clear();
                _controller1.clear();
                _controller2.clear();
                _controller3.clear();
                _controller4.clear();
              },
              child: const Text("Post Data"),
            ),
            TextButton(
                onPressed: () {
                  DataServices.getSingleDog("dalmatian");
                },
                child: const Text("Get Data")),
            TextButton(
                onPressed: () {
                  DataServices.gotAllDogs();
                },
                child: const Text("Get Data")),
                  TextButton(
                onPressed: () {
                  DataServices.signOut();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  const SignUpScreen()), (route) => false);
                },
                child: const Text("Sign Out")),
          ],
        ),
      )),
    );
  }
}
