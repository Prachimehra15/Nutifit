import 'package:flutter/material.dart';
import 'location.dart';
import 'start.dart';
import 'login.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

//import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/src/widgets/image_icon.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  //form key
   final _formKey =GlobalKey<FormState>();
   //editing controller
   final nameEditingController= new TextEditingController();
   final emailEditingController= new TextEditingController();
   final passwordEditingController= new TextEditingController();
   final confirmPasswordEditingController = new TextEditingController();


     @override
     Widget build(BuildContext context) {
       //name field
       final nameField = TextFormField(
         autofocus: false,
         controller: nameEditingController,
         keyboardType: TextInputType.name,
         validator: (value){
           RegExp regex = new RegExp(r'^.{3,}$');
           if (value!.isEmpty) {
             return ("First Name cannot be Empty");
           }
           if (!regex.hasMatch(value)) {
             return ("Enter Valid name(Min. 3 Character)");
           }
           return null;
         },
         onSaved: (value) {
           nameEditingController.text = value!;
         },
         textInputAction: TextInputAction.next,
         decoration: InputDecoration(
             prefixIcon: Icon(
                 Icons.account_circle_sharp, color: Color(0xff111f80)),
             contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
             hintText: "Name",
             hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(23),

             )
         ),
       );

       //email field
       final emailField = TextFormField(
         autofocus: false,
         controller: emailEditingController,
         keyboardType: TextInputType.name,
         validator: (value){
           if (value!.isEmpty) {
             return ("Please Enter Your Email");
           }
           // reg expression for email validation
           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
               .hasMatch(value)) {
             return ("Please Enter a valid email");
           }
           return null;
         },
         onSaved: (value) {
           emailEditingController.text = value!;
         },
         textInputAction: TextInputAction.next,
         decoration: InputDecoration(
             prefixIcon: Icon(
                 Icons.alternate_email_outlined, color: Color(0xff111f80)),
             contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
             hintText: "Email",
             hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(23),

             )
         ),
       );

       //password field
       final passwordField = TextFormField(
         autofocus: false,
         controller: passwordEditingController,
         obscureText: true,
         validator: (value){
           RegExp regex = new RegExp(r'^.{6,}$');
           if (value!.isEmpty) {
             return ("Password is required for login");
           }
           if (!regex.hasMatch(value)) {
             return ("Enter Valid Password(Min. 6 Character)");
           }
         },
         onSaved: (value) {
           passwordEditingController.text = value!;
         },
         textInputAction: TextInputAction.done,
         decoration: InputDecoration(
             prefixIcon: Icon(Icons.lock_sharp, color: Color(0xff111f80)),
             contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
             hintText: "Password",
             hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(23)
             )
         ),
       );


       //confirm password field
       final confirmPasswordField = TextFormField(
           autofocus: false,
           controller: confirmPasswordEditingController,
           obscureText: true,
           validator: (value) {
             if (confirmPasswordEditingController.text !=
                 passwordEditingController.text) {
               return "Password don't match";
             }
             return null;
           },
           onSaved: (value) {
             confirmPasswordEditingController.text = value!;
           },
           textInputAction: TextInputAction.done,
           decoration: InputDecoration(
             prefixIcon: Icon(Icons.lock_sharp, color: Color(0xff111f80)),
             contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
             hintText: "Confirm Password",
             hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(23),
             ),
           ));

       //signup button
       final signupButton = Material(
           elevation: 5,
           borderRadius: BorderRadius.circular(30),
           color: Colors.white,
           child: MaterialButton(
             padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
             minWidth: MediaQuery.of(context).size.width,
             onPressed: () {
               Navigator.push(
                   context,MaterialPageRoute(builder: (context)=> Location()) );
             },
             child: Text("Continue", textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 20,
                 color: Color(0xffd417bc),
                 fontWeight: FontWeight.bold,
                 fontStyle: FontStyle.italic,
               ),
             ),

           )
       );


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
                           height: 220,
                           child: Image.asset("assets/images/app logo.png",
                               fit: BoxFit.contain)
                       ),
                       SizedBox(height: 35),
                       nameField,
                       SizedBox(height: 25),
                       emailField,
                       SizedBox(height: 25),
                       passwordField,
                       SizedBox(height: 15),
                       confirmPasswordField,
                       SizedBox(height: 20),
                       signupButton,
                       SizedBox(height: 7)
                     ],
                   ),
                 ),
               ),
             ),
           ),
         ),
       );
     }
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fName = fNameEditingController.text;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Location()),
            (route) => false);
  }
}
