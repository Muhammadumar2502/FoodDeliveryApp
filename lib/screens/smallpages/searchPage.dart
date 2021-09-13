import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> list1 = [];
  List<String> list1narx = [];

  // TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Restaurant").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError){
            return Center(
              child: Text("Error"),
            );
          }else{
            return Scaffold(
              backgroundColor: Color(0xFFF2F2F2),
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Color(0xFFEEEEEE),
                elevation: 0,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 100,
                  // color: Color(0xFFF2F2F2),
                  child: TextFormField(
                    autofocus: true,
                    // controller: _controller,
                    decoration: InputDecoration(border: InputBorder.none),
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    onChanged: (e) {
                      print("ishla");
                      List<String> lista = [];
                      List<String> listanarx = [];
                      for (var i = 0; i < snapshot.data!.docs.length; i++) {
                        lista.add(snapshot.data!.docs[i]["name1"].toString() +
                            " " +
                            snapshot.data!.docs[i]["name2"].toString());
                            listanarx.add(snapshot.data!.docs[i]["cost"].toString());
                      }
                      List<String> listsearch2 = lista;
                      List<String> listsearch2narx = listanarx;
                      setState(() {
                        if (e.toString().length == 0 && e.isEmpty) {
                          list1 = [];
                          list1narx = [];
                        } else {
                          List<String> list2 = [];
                          List<String> list2narx = [];
                          for (var i = 0; i < listsearch2.length; i++) {
                            if (listsearch2[i].toString()
                                .toLowerCase()
                                .startsWith(e.toString().toLowerCase())) {
                              list2.add(listsearch2[i]);
                              list2narx.add(listsearch2narx[i]);
                            }
                          }
                          list1 = list2;
                          list1narx = list2narx;
                        }
                      });
                      print("ads");
                    },
                  ),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                child: list1.length != 0
                    ? Column(
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Text("Found " + (list1.length).toString() + " results"),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 150,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                        ? 3
                                        : 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: (0.7),
                              ),
                              itemCount: list1.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 150,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 10,
                                          child: Container(
                                            height: 220,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 3,
                                                    blurRadius: 3,
                                                  )
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 100),
                                                Text(
                                                  list1[index % list1.length].toString(),
                                                  // snapshot.data!.docs[index]
                                                  //     ['ism1'],
                                                  style:
                                                      TextStyle(fontSize: 22),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 15),

                                                Text(
                                                  // snapshot.data!.docs[index]
                                                  //     ['narxi'],
                                                  list1narx[index % list1narx.length].toString(),
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 5,
                                          left: 20,
                                          child: Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    snapshot.data!.docs[index %
                                                        list1.length]['photo']),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(2, 2),
                                                  spreadRadius: 3,
                                                  blurRadius: 3,
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
                              },
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Container(
                          height: 400,
                          child: Column(children: [
                            Container(
                              height: 91,
                              child: Image.asset("assets/images/search.png"),
                            ),
                            SizedBox(height: 53.25),
                            Text(
                              "Item not found",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 28),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Try searching the item with\na different keyword.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            )
                          ]),
                        ),
                      ),
              ),
            );
          }
        });
  }
}
