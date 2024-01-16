import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/todos_view_model.dart';
import 'package:mvvm/utils/loading_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TodosViewModel _viewModel = Get.put(TodosViewModel());

  @override
  void initState() {
    super.initState();

    //observe
    ever(_viewModel.loading, (loading) {
      if (loading) {
        LoadingDialog.showLoading(context);
      } else {
        LoadingDialog.dismissLoading(context);
      }
    });

    _viewModel.fetchTodos();
  }

  @override
  void dispose() {
    Get.delete<TodosViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: GetBuilder<TodosViewModel>(
        init: TodosViewModel(),
        builder: (userViewModel) {
          // Use the userViewModel to access the state data.
          return ListView.builder(
            itemCount: userViewModel.todos.length,
            itemBuilder: (context, index) {
              final user = userViewModel.todos[index];
              return ListTile(
                title: Text(user.title),
                leading: CircleAvatar(
                  child: Text(user.id.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
