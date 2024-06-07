
import 'package:apipactis/model.dart';
import 'package:apipactis/service.dart';
import 'package:apipactis/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    apiservice Apiservice = apiservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future:Apiservice.getallnews(), builder:(context, snapshot) {
        if(snapshot.hasData){
          List<newsmodel> allartical = snapshot.data!;

          return ListView.builder(itemCount:allartical.length,itemBuilder: (context, index) {
            return Column(
              children: [
            
                 Text(allartical[index].author.toString())
              ],
            );
          },);
        }
          return CircularProgressIndicator();
        
      },)
    );
  }
}