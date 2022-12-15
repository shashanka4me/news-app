import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class postScreen extends StatelessWidget {
  var postData;
  postScreen({Key? key, @required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Image.network(postData["urlToImage"]
                      //  "https://cdn.lifehacker.ru/wp-content/uploads/2022/12/Apple-advanced-security-Advanced-Data-Protection_inline.jpg.large_2x-2-2_1670505086-1280x640.jpg"
                      )),
            ),
            Padding(
              padding:   EdgeInsets.all(10.sp),
              child: Text(
                postData["content"],
                textAlign: TextAlign.justify,
                style: GoogleFonts.montserrat(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
