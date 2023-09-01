import 'package:flutter/material.dart';
import 'package:study_flutter_13_totally03_lec_form/success_page.dart';

import 'user.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/success': (context) => const SuccessPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<FormState>();
  late String _username, _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Sample')),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _key,
          child: Column(
            children: [
              usernameInput(),
              const SizedBox(height: 15),
              emailInput(),
              const SizedBox(height: 15),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameInput() {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => _username = newValue as String,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input your username.',
        labelText: 'Username',
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget emailInput() {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => _email = newValue as String,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input your email address.',
        labelText: 'Email Address',
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_key.currentState!.validate()) {
          _key.currentState!.save();
          Navigator.pushNamed(
            context,
            '/success',
            arguments: User(
              _username,
              _email,
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: const Text(
          '제출',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
