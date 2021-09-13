// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/screens/Delicious/delicious.dart';
import 'package:fooddeliveryapp/screens/SingInUp/singIn.dart';
import 'package:fooddeliveryapp/size_config.dart';

class SingInUp extends StatefulWidget {
  const SingInUp({Key? key}) : super(key: key);

  @override
  _SingInUpState createState() => _SingInUpState();
}

FirebaseAuth _authUser = FirebaseAuth.instance;

class _SingInUpState extends State<SingInUp> with TickerProviderStateMixin {
  var _formKey = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TabController _tabController = TabController(length: 2, vsync: this);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: getProportionScreenHeight(30.0)),
                    height: 162.38,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bella.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 70,
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
                      labelColor: Color(0xFFFF9900),
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Color(0xFFFF9900),
                      labelStyle: TextStyle(fontSize: 18.0),
                      tabs: [
                        Tab(
                          text: "Login",
                        ),
                        Tab(
                          text: "Sing-up",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: Container(
                child: TabBarView(controller: _tabController, children: [
                  SingIn(),
                  singUp(),
                ]),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 370,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singUp() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFF2F2F2),
      child: Container(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email
                  SizedBox(height: 24),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: getProportionScreenHeight(17.0)),
                      cursorColor: Colors.black,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email Address",
                          labelStyle: TextStyle(
                              fontSize: getProportionScreenHeight(15.0),
                              color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: email,
                    ),
                  ),
                  // Phone
                  SizedBox(height: 21),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: getProportionScreenHeight(17.0)),
                      cursorColor: Colors.black,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                              fontSize: getProportionScreenHeight(15.0),
                              color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: phone,
                    ),
                  ),
                  // Password
                  SizedBox(height: 21),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: getProportionScreenHeight(17.0)),
                      cursorColor: Colors.black,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: getProportionScreenHeight(15.0),
                              color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey)),
                      obscureText: true,
                      controller: password,
                    ),
                  ),
                  //Confirm Password
                ],
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
            SizedBox(
              height: 22.0,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFA4A0C),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                alignment: Alignment.center,
                height: 70.0,
                width: 314.0,
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionScreenHeight(17.0),
                  ),
                ),
              ),
              onTap: _emailSignUp,
            ),
          ],
        ),
      ),
    );
  }

  _emailSignUp() async {
    try {
      if (_formKey.currentState!.validate()) {
        await _authUser.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        if (_authUser.currentUser != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Delicious()));
        }
      }
    } catch (e) {
      print("SignUp Error: $e");
    }
  }
}
