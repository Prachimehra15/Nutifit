import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/dashboard.dart';
import 'package:fitness/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'start.dart';
import 'signup.dart';
import 'yoga.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //form key
  final _formKey = GlobalKey<FormState>();

  final _firebaseAuth = FirebaseAuth.instance;

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // //email field
    // final emailField = TextFormField(
    //   autofocus: false,
    //   controller: emailController,
    //   keyboardType: TextInputType.emailAddress,
    //   //validator: (){}
    //   onSaved: (value) {
    //     emailController.text = value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon:
    //           Icon(Icons.alternate_email_outlined, color: Color(0xff111f80)),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Email",
    //       hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(23),
    //       )),
    // );
    //
    // //password field
    // final passwordField = TextFormField(
    //   autofocus: false,
    //   controller: passwordController,
    //   obscureText: true,
    //   //validator: (){}
    //   onSaved: (value) {
    //     passwordController.text = value!;
    //   },
    //   textInputAction: TextInputAction.done,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.lock_sharp, color: Color(0xff111f80)),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Password",
    //       hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(23))),
    // );

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            // google sign in code

            try {
              Auth service = Auth();

              await service.signInWithGoogle().then((value) {
                if (value.uid == null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  ); // will execute if new user logs in
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  Dashboard()),
                  ); // if existing user logs in
                }
              });
            } catch (e) {
              print(e);
              if (e is FirebaseAuthException) {
                print('Firebase Login error => ${e.message!}');
              }
            }

            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
          child: Text(
            "Log In with Google",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffd417bc),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic
            ),
          ),
        ));
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffE91C4C),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset("assets/images/app logo.png",
                            fit: BoxFit.contain)),
                    // SizedBox(height: 45),
                    // emailField,
                    // SizedBox(height: 25),
                    // passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text("Don't have an account?",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 15)),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => Signup()));
                    //       },
                    //       child: Text(
                    //         " SignUp ",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 15,
                    //             color: Color(0xff290540)),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
