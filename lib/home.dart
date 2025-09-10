import 'package:flutter/material.dart';

import 'package:flutter_application_1/localstorage.dart';



class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _HomeState();
}

class _HomeState extends State<Home1> {
  String display = "hello";

  List<String> taskList = [];
  TextEditingController newText = TextEditingController();
  localStorageState prefs= localStorageState();


void _showCreateTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create New Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter task description'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  // Handle task creation here (e.g., save task)
                  print('New Task: ${taskController.text}');
                  taskController.clear(); // Clear the text field
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  // Show error if no task entered
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a task description')),
                  );
                }
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );


}


  @override
  void initState() {
    
    super.initState();
  _loadTodos();
  }

  
  Future<void> _loadTodos() async {
    final loadedTodos = await prefs.loadData();
    setState(() {
      taskList = loadedTodos;
    });
  }

  Future<void> _addTodo() async {
    if (newText.text.isNotEmpty) {
      setState(() {
        taskList.add(newText.text);
      });
      await prefs.saveData(taskList);
      newText.clear();
    }
  }


 Future<void> _updateTodo(int index) async {
    setState(() {
      taskList.removeAt(index);
    });
    await prefs.saveData(taskList);
  }


  Future<void> _deleteTodo(int index) async {
    setState(() {
      taskList.removeAt(index);
    });
    await prefs.saveData(taskList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To do App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 66, 156),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextField(
                      controller: newText,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        label: Text("enter a Task"),
                      ),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: _addTodo,
                color: Colors.white,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
                child: Text(
                  "click",
                  style: TextStyle(color: Colors.indigoAccent),
                ),
                
              ),
            ],
          ),

          

          Flexible(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(taskList[index]),
                      ),
                    ),
                    MaterialButton(
                      child: Icon(Icons.delete, color: Colors.red),
                       onPressed: () =>_deleteTodo(index),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showCreateTaskDialog(context);
        },
        icon: const Icon(Icons.add, color: Colors.blue, size: 30),
        label: const Text(
          'Create',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
