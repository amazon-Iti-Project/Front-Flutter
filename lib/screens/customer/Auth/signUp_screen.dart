import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/user-model.dart';
import 'package:project/screens/customer/home/homepage.dart';
import 'package:project/services/userService.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  createNewAccount() async {
    String token = await UserService().createToken();
    User newUser = new User(
      name: nameController.text,
      password: pwController.text,
      username: emailController.text,
      cart: [],
      token: token,
    );
    var user = await UserService().addNewUser(newUser);
    if (user != null){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
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
                                    'Create account.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    ' New to Amazon?',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  // else if(value.length < 6){
                                  //   return 'Please enter your full name(6 characters)';
                                  // }
                                  return null;
                                },
                                decoration: InputDecoration(labelText: 'Name'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  }else if(!value.endsWith('.com') || !value.contains('@')){
                                    return 'Please enter vaild mail';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: 'E-mail'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: pwController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a Password';
                                  }else if(value.length < 6 ){
                                    return 'Your password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                  hintText: 'Create a Password',
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
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.yellow[600]
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         MyHomePage()));
                                    print('form is valid');
                                    createNewAccount();
                                  }
                                  else{
                                    print('form is not vaild');
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow[600],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                      child: const Text('Verify email',
                                          style: TextStyle(fontSize: 20))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  "By creating an account, you agree to Amazon's Conditions of Use and Privacy Notice."),
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
