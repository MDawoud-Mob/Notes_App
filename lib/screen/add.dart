// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite/model/items.dart';
import 'package:sqlite/provider/my_provider.dart';
import 'package:sqlite/screen/show.dart';
import 'package:sqlite/shared/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Add extends StatefulWidget {
  const Add({
    Key? key,
  }) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String group = "", type = '';
  int selling = 0, buying = 0;

  TextEditingController groupController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController sellingController = TextEditingController();
  TextEditingController buyingController = TextEditingController();

  File? imgPath;

  uploadImage(ImageSource sourcess) async {
    final pickedImg = await ImagePicker().pickImage(source: sourcess);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: const Text('Add item'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomRight: Radius.circular(50),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 25),
                  child: Container(
                    padding: const EdgeInsets.all(3.5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(124, 88, 153, 252),
                    ),
                    child: Stack(
                      children: [
                        imgPath == null
                            ? const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 225, 225, 225),
                                radius: 80,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHfd3PPulVSp4ZbuBFNkePoUR_fLJQe474Ag&usqp=CAU'),
                              )
                            : ClipOval(
                                child: Image.file(
                                  imgPath!,
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Positioned(
                            left: 125,
                            bottom: -12,
                            child: IconButton(
                                onPressed: () {
                                  showmodel();
                                },
                                icon: const Icon(
                                    size: 25.2, Icons.add_a_photo_outlined)))
                      ],
                    ),
                  ),
                ),
                MyTextField(
                    onchange: (value) {
                      setState(() {
                        group = value;
                      });
                    },
                    textEditingControllerr: groupController,
                    textInputTypeee: TextInputType.text,
                    hinttexttt: 'Plz Enter  group name :'),
                const SizedBox(
                  height: 12,
                ),
                MyTextField(
                    onchange: (value) {
                      setState(() {
                        type = value;
                      });
                    },
                    textEditingControllerr: typeController,
                    textInputTypeee: TextInputType.text,
                    hinttexttt: 'Plz Enter  item name :'),
                const SizedBox(
                  height: 12,
                ),
                MyTextField(
                    onchange: (value) {
                      setState(() {
                        selling = int.parse(value);
                      });
                    },
                    textEditingControllerr: sellingController,
                    textInputTypeee: TextInputType.number,
                    hinttexttt: 'Plz Enter Selling price :'),
                const SizedBox(
                  height: 12,
                ),
                MyTextField(
                    onchange: (value) {
                      setState(() {
                        buying = int.parse(value);
                      });
                    },
                    textEditingControllerr: buyingController,
                    textInputTypeee: TextInputType.number,
                    hinttexttt: 'Plz Enter purchase price :'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(250, 45)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 142, 178, 187))),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Show()));
                      Provider.of<MyProvider>(context, listen: false)
                          .insertCourse(Items({
                        'group': group,
                        'type': type,
                        'selling': selling,
                        'buying': buying
                      }))
                          .then((response) {
                        Provider.of<MyProvider>(context, listen: false)
                            .getCourses();
                      });
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 218, 240, 209),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  showmodel() {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
            color: Colors.amber[50],
            padding: const EdgeInsets.all(22.5),
            height: 170,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera,
                          size: 31,
                        )),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text('From Camera',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await uploadImage(ImageSource.gallery);

                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo_outlined,
                          size: 31,
                        )),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text('From Gallery',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ])));
  }
}
