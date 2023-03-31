import 'package:flutter/material.dart';

import 'package:sqlite/screen/add.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                  
                  },
                  child:const Text(
                    'Show',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>   Add()));
                  },
                  child:const Text('Add',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          )
        ],
      ),
    );
  }
}
