
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapi/postScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart'as http;
String searchData = "apple";
List<DropdownMenuItem<String>> sortByList = [
  DropdownMenuItem(child: Text("Relevancy"), value: "relevancy"),
  DropdownMenuItem(child: Text("Popularity"), value: "popularity"),
];
List<DropdownMenuItem<String>> sortByLanuageList = [
  DropdownMenuItem(child: Text("English"), value: "en"),
  DropdownMenuItem(child: Text("Spanish"), value: "es"),
  DropdownMenuItem(child: Text("Russian"), value: "ru"),
  // DropdownMenuItem(child: Text("Popularity"), value: "he"),
];
String selectedSort = "relevancy";
String selectedLanuage = "en";
class mainDashboard extends StatefulWidget {
  const mainDashboard({Key? key}) : super(key: key);
  @override
  State<mainDashboard> createState() => _mainDashboardState();
}

class _mainDashboardState extends State<mainDashboard> {
  void update(){
    setState(() {
      print(selectedSort+"    "+selectedLanuage+"   "+searchData);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFf5f5f5),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: 100.w,
              height: 100.h,
              child: Column(
                children: [
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        bottomLeft: Radius.circular(10.sp),
                        bottomRight: Radius.circular(10.sp)),
                    child: Container(
                      width: 75.w,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: Color.fromRGBO(210, 208, 208, 1),
                            ),
                            Container(
                              height: 3.7.h,
                              width: 55.w,
                              child: Padding(
                                padding: EdgeInsets.only(left: 7.sp),
                                child: TextField(
                                  onChanged: (searchQuery) async {
                                    // await searchProduct(searchQuery);
                                    setState(() {
                                     searchData = searchQuery;
                                    });
                                  },
                                  //autofocus: true,
                                  //  controller: searchTextController,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Color.fromRGBO(210, 208, 208, 1),
                                  ),
                                  decoration: InputDecoration(

                                    border: InputBorder.none,
                                    hintText: "Search Here",
                                    hintStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                      color: Color.fromRGBO(210, 208, 208, 1),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        bottomLeft: Radius.circular(10.sp),
                        bottomRight: Radius.circular(10.sp)),
                    child: Container(
                      width: 55.w,
                      height: 5.h,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DropdownButton(
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF434141)
                              ),
                              value: selectedSort,
                              items: sortByList,
                              onChanged: (String? value) {
                                selectedSort = value.toString();
                                update();
                              },
                            ),
                            Spacer(),
                            DropdownButton(
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF434141)
                              ),
                              value: selectedLanuage,
                              items: sortByLanuageList,
                              onChanged: (String? value) {
                                selectedLanuage = value.toString();
                                update();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  // Container(width: 100.w,
                  //   height: 88.h,)
                  Container(
                    width: 100.w,
                    height: 88.h,
                    child: FutureBuilder(
                      future: loadNewsFromSite(
                          "https://newsapi.org/v2/everything?apiKey=31b2527b73cd42e4b91c3911dba4c0a2&q=$searchData&pageSize=10&language=$selectedLanuage&sortBy=$selectedSort"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return (snapshot.hasData)
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                reverse: false,
                                cacheExtent: 10000.00,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>postScreen(postData: snapshot.data[index],)));
                                    },
                                    child: Container(
                                      height: 16.h,
                                      width: 100.w,
                                      child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Spacer(),
                                              Center(
                                                child: Container(
                                                  width: 90.w,
                                                  height: 15.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      color: Color(0xFFffffff),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 15.0,
                                                            spreadRadius: 0.5,
                                                            offset: Offset(8.0, 8.0))
                                                      ]),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(
                                                        width: 15.h,
                                                        height: 12.h,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10.sp),
                                                          //color: Colors.grey,
                                                        ),
                                                        child: Center(
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10.sp),
                                                            child: Container(
                                                              width: 15.h,
                                                              height: 12.h,
                                                              child: Image.network(
                                                                (snapshot.data[index]["urlToImage"] !=null?
                                                                snapshot.data[index]["urlToImage"]
                                                                    :
                                                                "https://img.freepik.com/premium-vector/abstract-modern-green-banner-design-web-template-set-horizontal-header-web-banner-vector-abstract-graphic-design-banner-pattern-background-template_181182-14924.jpg"
                                                                ),
                                                                    fit: BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 25.h,
                                                        height: 12.h,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10.sp),
                                                          color: Colors.white,

                                                          //color: Colors.grey,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                (snapshot.data[index]["title"] !=null?
                                                                snapshot.data[index]["title"]
                                                                    :"No Topic"),
                                                                style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500, fontSize: 9.sp),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text((snapshot.data[index]["author"] !=null?
                                                                  snapshot.data[index]["author"].toString().length>15?
                                                                  snapshot.data[index]["author"].toString().substring(0,15)
                                                                  : snapshot.data[index]["author"]
                                                                      :"No Author"),
                                                                      softWrap: true,
                                                                      textWidthBasis: TextWidthBasis.parent,
                                                                      maxLines: 4,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontStyle: FontStyle.italic,
                                                                          fontSize: 9.sp)),
                                                                  //Spacer(),
                                                                  Text((snapshot.data[index]["publishedAt"] !=null?
                                                                  snapshot.data[index]["publishedAt"].toString().substring(0,10)
                                                                      :"No Date"),
                                                                      softWrap: true,
                                                                      textWidthBasis: TextWidthBasis.parent,
                                                                      maxLines: 4,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontStyle: FontStyle.italic,
                                                                          fontSize: 9.sp)),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                    ),
                                  );
                                  //
                                  //   Text(snapshot.data[index]["author"] !=null?
                                  // snapshot.data[index]["author"]
                                  //     :"no Author"
                                  // );
                                })
                            : Container(
                          width: 10.w,
                            height: 10.w,
                            //child: CircularProgressIndicator(

                         //  )
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )

        //
      ),
    );
  }
}

Future<List> loadNewsFromSite(String url) async {
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{},
  ).whenComplete(() => {
    //debugPrint("method Executed")
  });

  // print(response.body.toString());
  Map<String, dynamic> map = json.decode(response.body);
  // debugPrint(response.body);
  List<dynamic> data = map["articles"];
  //print(data);
  return data;
}

