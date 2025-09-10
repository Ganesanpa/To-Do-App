import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner:false ,
      darkTheme: ThemeData(primarySwatch: Colors.blue),
   home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late String title;
  String text = "No Value Entered";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("To Do App",style: TextStyle(color: Colors.white),) ,backgroundColor: Colors.green,centerTitle: false,

        ),
        
        body: ListView(
          children: [
            
Container(
decoration: BoxDecoration(

  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow:[BoxShadow(spreadRadius: 2,blurRadius: 10,offset: Offset(0,5),color:Colors.black26)]),
             height: 90,
             width: double.infinity,
             margin: EdgeInsets.all(10),
             padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ckicken noodles",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("delicious chicken noodles with spices"),
              Text("70.45",style: TextStyle(fontWeight: FontWeight.bold),)
              
              
            ],
     


          ),
          
        ),
          ],
        ),   
floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,elevation: 10.0,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),onPressed: () {
            
          },
        ),
      );
}}