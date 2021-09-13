import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Orders",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40, right: 40, top: 60),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                child: Expanded(
                  child: Container(
                    height: 118.33,
                    width: 106.5,
                    child: Image.asset(
                      "assets/images/shopping_car.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "No orders yet ",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 16,right: 30.0),
                child: Center(
                  child: Container(
                    width: 230,
                    height: 50,
                    child: Column(
                      children: [
                        Text(
                          "Hit the orange button down ",
                          style: TextStyle(
                              fontSize: 17, color: Colors.grey.shade500),
                        ),
                        Text(
                          "below to Create an order",
                          style: TextStyle(
                              fontSize: 17, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 70,
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Start ordering",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
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
