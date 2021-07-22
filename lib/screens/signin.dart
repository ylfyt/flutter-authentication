import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  final Function switchForm;

  Signin({required this.switchForm});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: LoginForm(switchForm: widget.switchForm),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final Function switchForm;

  LoginForm({required this.switchForm});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String username = '';
  String password = '';
  bool isRememberMe = false;

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Form(
          key: _keyForm,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => (val == null || val.isEmpty)
                          ? "Input with email or username"
                          : null,
                      decoration:
                          InputDecoration(hintText: "Email or Username"),
                      onChanged: (val) {
                        username = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (val) => (val == null || val.length < 6)
                          ? "Password must be 6 char or more"
                          : null,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isRememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            isRememberMe = value!;
                          });
                        },
                      ),
                      Text("Remember Me")
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        print("Username: " + username);
                        print("Password: " + password);
                      }
                    },
                    icon: Icon(Icons.send),
                    label: Text("Sign In"),
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
            Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                widget.switchForm();
              },
              child: Text("Sign Up"),
            ),
          ],
        )
      ],
    );
  }
}
