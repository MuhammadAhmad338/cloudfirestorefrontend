// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Services/imageServices.dart';
import 'package:googlecloud/Views/homeView.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
    var imageProvider = Provider.of<ImageServices>(context);

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
                  .push(MaterialPageRoute(builder: (_) =>  HomeView(token: widget.token!,)));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          imageProvider.pickImage(ImageSource.camera, context);
        },
        tooltip: 'Pick Image',
        child: const Icon(Icons.add),
      ),
    );
  }
}
