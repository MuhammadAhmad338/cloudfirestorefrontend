// ignore: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/dogModel.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Services/imageServices.dart';
import 'package:googlecloud/Views/signUpScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  final String? token;
  const HomeView({super.key, this.token});

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
    final imageProvider = Provider.of<ImageServices>(context);
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
             FutureBuilder(
                  future: DataServices().myUsers(widget.token),
                  builder: (context, snapshot) {
                    var user = snapshot.data;
                    if (user == null) {
                      return DrawerHeader(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imageProvider.image != null
                              ? Stack(
                                  children: [
                                    CircleAvatar(
                                        backgroundImage:
                                            FileImage(imageProvider.image!),
                                        radius: 36,
                                        backgroundColor: const Color.fromARGB(
                                            255, 252, 96, 148)),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          ImageServices()
                                                              .pickImage(
                                                                  ImageSource
                                                                      .gallery,
                                                                  context);
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 16.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Text("Gallery",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  248,
                                                                  228,
                                                                  191),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          ImageServices()
                                                              .pickImage(
                                                                  ImageSource
                                                                      .camera,
                                                                  context);
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 16.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: const Text(
                                                            "Camera",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                248,
                                                                228,
                                                                191),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: const Positioned(
                                        bottom: 0.80,
                                        left: 1.0,
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 25.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/user.png"),
                                      radius: 36,
                                      backgroundColor:
                                          Color.fromARGB(255, 252, 96, 148),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Positioned(
                                        bottom: 0.50,
                                        left: 1.0,
                                        child: Icon(
                                          Icons.add,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          const Text('Username Email',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ));
                    }
                    return DrawerHeader(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            imageProvider.image != null
                                ? Stack(
                                    children: [
                                      CircleAvatar(
                                          backgroundImage:
                                              FileImage(imageProvider.image!),
                                          radius: 36,
                                          backgroundColor: const Color.fromARGB(
                                              255, 252, 96, 148)),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            ImageServices()
                                                                .pickImage(
                                                                    ImageSource
                                                                        .gallery,
                                                                    context);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 16.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: Text(
                                                                "Gallery",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    248,
                                                                    228,
                                                                    191),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16)),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            ImageServices()
                                                                .pickImage(
                                                                    ImageSource
                                                                        .camera,
                                                                    context);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 16.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: const Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  248,
                                                                  228,
                                                                  191),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        child: const Positioned(
                                          bottom: 0.80,
                                          left: 1.0,
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 25.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/user.png"),
                                        radius: 36,
                                        backgroundColor:
                                            Color.fromARGB(255, 252, 96, 148),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            ImageServices()
                                                                .pickImage(
                                                                    ImageSource
                                                                        .gallery,
                                                                    context);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 16.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: Text(
                                                                "Gallery",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    248,
                                                                    228,
                                                                    191),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16)),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            ImageServices()
                                                                .pickImage(
                                                                    ImageSource
                                                                        .camera,
                                                                    context);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 16.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: const Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  248,
                                                                  228,
                                                                  191),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        child: const Positioned(
                                          bottom: 0.50,
                                          left: 1.0,
                                          child: Icon(
                                            Icons.add,
                                            size: 25.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            Text("${user.username}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "${user.email}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
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
