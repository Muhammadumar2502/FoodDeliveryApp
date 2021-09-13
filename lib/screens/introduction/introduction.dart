import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/screens/SingInUp/sign_up.dart';
import 'package:fooddeliveryapp/size_config.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFE470B),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.5),
          image: const DecorationImage(
              image: AssetImage(
                "assets/images/introduction.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(
                    getProportionScreenHeight(314.0),
                    getProportionScreenHeight(70.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (cotnext) => SingInUp(),
                    ),
                  );
                },
                child: Text(
                  "Get started",
                  style: TextStyle(
                    fontSize: getProportionScreenHeight(17.0),
                    color: Color(0xFFFF460A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
