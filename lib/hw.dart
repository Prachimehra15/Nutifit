import 'gendern.dart';
import 'package:flutter/material.dart';
import 'describe.dart';
import 'dashboard.dart';
class Hw extends StatefulWidget {
  const Hw({Key? key}) : super(key: key);

  @override
  _HwState createState() => _HwState();
}

class _HwState extends State<Hw> {
  //form key
  final _formKey =GlobalKey<FormState>();

  //editing controller
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField =TextFormField(
      autofocus: false,
      controller: heightController,
     // keyboardType:TextInputType.emailAddress ,
      //validator: (){}
      onSaved: (value)
      {
        heightController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.height,color:Color(0xff111f80)),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Height in Cm",
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),

          )
      ),
    );

    //password field
    final passwordField =TextFormField(
      autofocus: false,
      controller: weightController,

      //validator: (){}
      onSaved: (value)
      {
        weightController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.fitness_center_sharp,color:Color(0xff111f80)),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Weight in Kg",
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23)
          )
      ),
    );
    final loginButton= Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          padding:EdgeInsets.fromLTRB(20, 15, 20, 15) ,
          minWidth: MediaQuery.of(context).size.width,
          onPressed: (){
            Navigator.push(
                context,MaterialPageRoute(builder: (context)=> Dashboard()) );
          },

          child: Text("Sign Up",textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffd417bc),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic
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
                  children:<Widget>[
                    SizedBox(
                        height: 50,
                        child:Text("Height and Weight",style: TextStyle(color: Color(0xffffffff),fontFamily:'Lora',fontSize: 30))
                    ),
                    SizedBox(height: 35),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),

                  ],
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
