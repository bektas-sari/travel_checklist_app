
import 'package:flutter/material.dart';

void main() {
  runApp(const TravelChecklistApp());
}

class TravelChecklistApp extends StatelessWidget {
  const TravelChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Checklist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        useMaterial3: true,
      ),
      home: const TravelChecklistPage(),
    );
  }
}

class TravelChecklistPage extends StatefulWidget {
  const TravelChecklistPage({super.key});

  @override
  State<TravelChecklistPage> createState() => _TravelChecklistPageState();
}

class _TravelChecklistPageState extends State<TravelChecklistPage> {
  final List<TaskItem> tasks = [
    TaskItem("Check passport & tickets", Icons.flight, 0.0),
    TaskItem("Pack clothes", Icons.shopping_bag, 0.0),
    TaskItem("Toiletries", Icons.bathroom, 0.0),
    TaskItem("Electronics & chargers", Icons.electrical_services, 0.0),
    TaskItem("Travel documents", Icons.description, 0.0),
    TaskItem("Snacks & water", Icons.fastfood, 0.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Checklist'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 6,
          radius: const Radius.circular(12),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 2,
                child: ExpansionTile(
                  leading: Icon(task.icon),
                  title: Text(task.title),
                  subtitle: Text('Progress: ${task.progress.toInt()}%'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Slider(
                        value: task.progress,
                        min: 0,
                        max: 100,
                        divisions: 4,
                        label: "${task.progress.toInt()}%",
                        onChanged: (value) {
                          setState(() {
                            task.progress = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),



    );
  }
}

class TaskItem {
  final String title;
  final IconData icon;
  double progress;

  TaskItem(this.title, this.icon, this.progress);
}
