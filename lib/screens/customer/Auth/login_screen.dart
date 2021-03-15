import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/user-model.dart';
import 'package:project/screens/customer/home/homepage.dart';
import 'package:project/services/userService.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  signUserIn() async {
    User user = User(
      username: emailController.text,
      password: pwController.text,
    );
    var res = await UserService().getUserByNameAndPassword(user);
    if (res != null) {
      await UserService().setToken(res.token);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('This username or password may be incorrect!'))
      );
      pwController.text='';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: key,
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[400]))),
                      child: Container(
                          height: 70,
                          width: 800,
                          child: Image.asset("Images/login.png"))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Sign-In.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    ' Alerady a customer?',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Email or phone for mobile accounts';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'UserName'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: pwController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                },
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                  hintText: 'Enter the Password',
                                  suffix: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    signUserIn();
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.yellow[600])),
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow[600],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                      child: const Text('Sign in',
                                          style: TextStyle(fontSize: 20))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  "By signing in, you agree to Amazon's Conditions of Use and Privacy Notice."),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
