import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          alignment: Alignment.center,
          child: Image.asset(
            'images/hamburger.png',
            height: 20,
          ),
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          child: Image.asset(
            'images/icon.png',
            height: 60,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                'images/profile.png',
                height: 30,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 8.h,
            width: 100.w,
            color: Color(0xFF4B60BC),
            child: Row(
              children: [
                Text(
                  "Wallet Balance: ₹ 0",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 3.h,
                  width: 25.w,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                          color: Color(0xFF4B60BC),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
