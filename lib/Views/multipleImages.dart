// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:googlecloud/Services/imageServices.dart';
import 'package:provider/provider.dart';

class MultipleImages extends StatefulWidget {
  const MultipleImages({super.key});

  @override
  State<MultipleImages> createState() => _MultipleImagesState();
}

class _MultipleImagesState extends State<MultipleImages> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ImageServices>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Multiple Images", style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: provider.image != null ? ListView.builder(
        itemCount: provider.images!.length,
        itemBuilder: (context, index) {
          final images = provider.images![index];
            return Center(child: Image.file(images));
      }) : const Center(
        child: Text("No images are picked!", style: TextStyle(
          fontWeight: FontWeight.bold
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           ImageServices().pickMultipleImages(context);
        },
        child: const Icon(Icons.add),
      ),
    );

  }
}