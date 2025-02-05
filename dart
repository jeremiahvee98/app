import 'package:flutter/material.dart';

void main() {
  runApp(CodePlannerApp());
}

class CodePlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Planner & To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlannerHomePage(),
    );
  }
}

class PlannerHomePage extends StatefulWidget {
  @override
  _PlannerHomePageState createState() => _PlannerHomePageState();
}

class _PlannerHomePageState extends State<PlannerHomePage> {
  final List<String> _tasks = [];
  final TextEditingController _textController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
    _textController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Planner & To-Do List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter a new task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _addTask,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(_textController.text),
        child: Icon(Icons.add),
      ),
    );
  }
}
class _PlannerHomePageState extends State<PlannerHomePage> {
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _executeTask(String task) {
    // Here you can add the logic to execute the task, e.g., running code
    print('Executing task: $task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Planner & To-Do List'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter a new task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _addTask,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _tasks[index],
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () => _executeTask(_tasks[index]),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(_textController.text),
        child: Icon(Icons.add),
      ),
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
    );
  }
}