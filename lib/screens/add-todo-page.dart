import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
            keyboardType: TextInputType.multiline,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: "Description"),
            // keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: submitData, child: const Text("Submit"))
        ],
      ),
    );
  }

  Future<void> submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;

    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    http.Response response =
        await http.post(uri, body: jsonEncode(body), headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 201) {
      showSuccessMessage("success");
    } else {
      showErrorMessage("Failed");
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(message) {
    final snackBar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
