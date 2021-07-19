import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final Function switchForm;

  Signup({required this.switchForm});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: RegisterForm(switchForm: widget.switchForm),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final Function switchForm;

  RegisterForm({required this.switchForm});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String name = '';
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Name"),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Username"),
                      onChanged: (val) {
                        username = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Confirm Password"),
                      onChanged: (val) {
                        confirmPassword = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Name: " + name);
                      print("Username: " + username);
                      print("Email: " + email);
                      print("Password: " + password);
                      print("Confirm Password: " + confirmPassword);
                    },
                    child: Text("Submit"),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Text("Already have an account?"),
            TextButton(
              onPressed: () {
                widget.switchForm();
              },
              child: Text("Sign In"),
            ),
          ],
        )
      ],
    );
  }
}
