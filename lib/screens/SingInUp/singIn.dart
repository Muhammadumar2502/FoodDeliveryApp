// ignore_for_file: avoid_print, file_names, prefer_final_fields, prefer_const_constructors, unnecessary_null_comparison
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/screens/Delicious/delicious.dart';
import 'package:fooddeliveryapp/size_config.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  var _formKey1 = GlobalKey<FormState>();
  TextEditingController password1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      color: Color(0xFFF2F2F2),
      child: Form(
        key: _formKey1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                controller: email1,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hoverColor: Colors.black,
                  labelText: "Email address",
                  labelStyle: TextStyle(
                      fontSize: getProportionScreenHeight(15.0),
                      color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 21),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                obscureText: true,
                controller: password1,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: getProportionScreenHeight(15.0),
                      color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Forgot passcode?",
                style: TextStyle(
                  color: Color(0xFFFA4A0C),
                  fontSize: getProportionScreenHeight(17.0),
                ),
              ),
            ),
            SizedBox(height: 90),
            GestureDetector(
              onTap: _emailSignIn,
              child: Container(
                height: 70.0,
                width: 314.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFFFA4A0C)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionScreenHeight(17.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _emailSignIn() async {
    try {
      if (_formKey1.currentState!.validate()) {
        _formKey1.currentState!.save();
        FocusScope.of(context).unfocus();
        User _signInQilganUser = (await _authUser.signInWithEmailAndPassword(
                email: email1.text, password: password1.text))
            .user!;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Delicious()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 3),
            content: Text("Email yoki Password Xato Bor !"),
          ),
        );
      }
    } catch (e) {
      print("SignIn Error: $e");
    }
  }
}
