// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project/applocalization.dart';
// import 'package:project/homepage.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final key = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Page"),
//       ),
//       body: SafeArea(
//         child: Form(
//           key: key,
//           child: ListView(children: [
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                     child: Container(
//                         padding: const EdgeInsets.all(20),
//                         height: 200,
//                         child: Image.asset("Images/login.png"))),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(5, 30, 10, 0),
//                   child: Text(
//                     "Hello there !",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.start,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
//                   child: Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       child: TextFormField(
//                         textAlign: TextAlign.left,
//                         controller: _emailController,
//                         keyboardType: TextInputType.text,
//                         validator: (value) =>
//                             value.isEmpty ? 'Please Enter Your name' : null,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText:
//                               AppLocalizations.of(context).translate('email'),
//                           hintStyle: TextStyle(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
//                   child: Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       child: TextFormField(
//                         autofocus: false,
//                         obscureText: true,
//                         textAlign: TextAlign.left,
//                         controller: _passwordController,
//                         keyboardType: TextInputType.text,
//                         validator: (value) =>
//                             value.isEmpty ? 'Please Enter Your Password' : null,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: AppLocalizations.of(context)
//                               .translate('password'),
//                           hintStyle: TextStyle(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MyHomePage()),
//                   );
//                 },
//                 child: Text(AppLocalizations.of(context).translate('login'),
//                     style: TextStyle(fontSize: 20, color: Colors.black)),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
