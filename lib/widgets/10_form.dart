/*
 * Francesca Oliverio
 * 20/10/2026
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Sign Up"), centerTitle: true),
        body: FormSignup(),
      ),
    );
  }
}

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  final _formKey = GlobalKey<FormState>();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          spacing: 20,
          children: [
            // name
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person_outlined, color: Colors.indigo),
                label: Text("name"),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              // onSaved:,
            ),
            // email
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email_outlined, color: Colors.indigo),
                label: Text("e-mail"),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your e-mail';
                }
                final emailRegExp = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegExp.hasMatch(value)) {
                  return 'Insert a valid e-mail (e.g. name@domain.com)';
                }
                return null;
              },
              // onSaved:,
            ),
            // number
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.phone_outlined, color: Colors.indigo),
                label: Text("phone number"),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                final phoneRegExp = RegExp(r'^\+?[0-9 ]+$');
                if (!phoneRegExp.hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
              // onSaved:,
            ),
            // password
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outlined, color: Colors.indigo),
                label: Text("password"),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                errorMaxLines: 3,
              ),
              keyboardType: TextInputType.text,
              obscuringCharacter: '○',
              obscureText: true,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                final passwordRegExp = RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
                );
                if (!passwordRegExp.hasMatch(value)) {
                  return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number';
                }
                return null;
              },
              // onSaved:,
            ),
            FilledButton(onPressed: _submit, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
