import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite/provider/my_provider.dart';


class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text('show item'),
        ),
        body: Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
              child: ListTile(
              leading: CircleAvatar(),
              title:  Text('${Provider.of<MyProvider>(context,listen: true).items.group}'),
              subtitle:Text('${Provider.of<MyProvider>(context,listen: true).items.selling}EGP'),
              trailing: Row(
                children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_outlined)),
        
                ]),
              ),
                );
              }),
        ));
  }
}
