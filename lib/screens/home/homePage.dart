import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fooddeliveryapp/screens/personal/person.dart';
import 'package:fooddeliveryapp/screens/smallpages/history.dart';
import 'package:fooddeliveryapp/screens/smallpages/orders.dart';
import 'package:fooddeliveryapp/screens/smallpages/searchPage.dart';

class HomePage extends StatefulWidget {
  ZoomDrawerController? zoomcontroller;
  HomePage(this.zoomcontroller);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = ["Foods", "Drinks", "Snacks", "Sauces"];

  var ints = [1, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Restaurant").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                  ),
                  Container(
                    height: size.height - 80,
                    width: size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    widget.zoomcontroller!.open!();
                                  },
                                  icon: Icon(Icons.notes_outlined),
                                  color: Colors.black45,
                                  iconSize: 30,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => OrderList()));
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                  ),
                                  color: Colors.black45,
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 40,
                          child: Text(
                            "Delicious",
                            style: TextStyle(fontSize: 38),
                          ),
                        ),
                        Positioned(
                          top: 125,
                          left: 40,
                          child: Text(
                            "food for you",
                            style: TextStyle(fontSize: 38),
                          ),
                        ),
                        Positioned(
                          top: 215,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: SearchCard(),
                          ),
                        ),
                        Positioned(
                          top: 320,
                          left: 0,
                          child: Container(
                            width: size.width,
                            height: 50,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        ints = [0, 0, 0, 0];
                                        ints[index] = 1;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      width: 90,
                                      height: 45,
                                      child: Container(
                                        width: 87,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 3,
                                                    color: ints[index] == 1
                                                        ? Color(0xFFFA4A0C)
                                                        : Colors.transparent))),
                                        child: Text(
                                          items[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Positioned(
                          top: 350,
                          left: 0,
                          child: Container(
                            width: size.width,
                            height: 270,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    alignment: Alignment.centerRight,
                                    width: 170,
                                    child: Container(
                                      width: 150,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 10,
                                            child: Container(
                                              height: 200,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(1, 2),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 100),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['name1'],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['name2'],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['cost'],
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 35,
                                            left: 20,
                                            child: Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .docs[index]['photo']),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(1, 3),
                                                    spreadRadius: 2,
                                                    blurRadius: 6,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(55),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.home_rounded,
                                      color: Color(0xFFFA4A0C),
                                      size: 32,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Orders(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.favorite_outline_outlined,
                                        color: Colors.black26,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Profile(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.black26,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => History()),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.history_rounded,
                                        color: Colors.black26,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              );
            }
          },
        ));
  }
}

class SearchCard extends StatelessWidget {
  TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Search(),
          ),
        );
      },
      child: Container(
        width: 314.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: Color(0xFFEFEEEE),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
              Text(
                " Searching...",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
