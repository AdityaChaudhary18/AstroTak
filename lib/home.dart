import 'dart:convert';

import 'package:astrotak/models/Database_Service.dart';
import 'package:astrotak/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> hintAdvices = [
    "• Our team of Vedic astrologers will not just provide answers but also suggest a remedial solution.",
    "• You can seek answers to any part of your life and for most pressing issues.",
    "• Qualified and experienced astrologers will look into your birth chart and provide the right guidance.",
    "• Personalized responses provided by our team of Vedic astrologers within 24 hours."
  ];
  List<String> _locations = [
    'A',
    'B',
    'C',
    'D',
    "Please select an Option"
  ]; // Option 2
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _selectedLocation = "Please select an Option"; // Option 2

  List categoryList = [];
  List ideas = [];
  Future<void> getCategory() async {
    var client = http.Client();

    final response1 = await http.get(
      Uri.parse("https://staging-api.astrotak.com/api/question/category/all"),
    );

    final body1 = json.decode(response1.body);
    setState(() {
      categoryList = body1["data"];
    });
  }

  var category;
  @override
  void initState() {
    getCategory();
    super.initState();
    Provider.of<DatabaseService>(context, listen: false).fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: FloatingActionButton(
          child: Icon(Icons.menu),
          onPressed: () {},
          backgroundColor: Colors.orange,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/home.png"),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/talk.png"),
            ),
            label: 'Talk',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/ask.png"),
            ),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/reports.png"),
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/chat.png"),
            ),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/profile.png',
                  height: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ideas.length == 0
              ? SizedBox(
                  height: 0,
                )
              : Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF4B60BC),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Text(
                          "₹ 150 (1 Question on $category)",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          height: 4.h,
                          width: 25.w,
                          child: Center(
                            child: Text(
                              "Ask Now",
                              style: TextStyle(
                                  color: Color(0xFF4B60BC),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: ideas.length == 0 ? 0 : 7.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 8.h,
                  width: 100.w,
                  color: Color(0xFF4B60BC),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wallet Balance: ₹ 0",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          height: 3.h,
                          width: 25.w,
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ask a Question",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Seek accurate answers to your life problems and get guidance towards the right path.Whether the problem is related to love,self,business,money,education or work, our astrology will do an in depth study of your birth chart to provide personalized responses along with remedies.",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Choose Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: DropdownButton<String>(
                            value: category,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 28,
                            elevation: 20,
                            onChanged: (String? newval) {
                              setState(() {
                                category = newval;
                                categoryList.forEach((element) {
                                  if (element["name"] == category) {
                                    ideas = element["suggestions"];
                                  }
                                });
                              });
                            },
                            items: categoryList
                                .map((e) => DropdownMenuItem<String>(
                                      value: e["name"],
                                      child: Text(e["name"]),
                                    ))
                                .toList()),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        maxLength: 150,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Type a question here',
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Ideas what to Ask (Select Any)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: ideas.length == 0 ? 0 : 6.h * ideas.length,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      child: Image.asset(
                                        "images/ask.png",
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        ideas[index],
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                              ],
                            );
                          },
                          itemCount: ideas.length,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                          height: 30.h,
                          color: Colors.orange.shade50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 3.w),
                                  child: Text(
                                    hintAdvices[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.orange.shade800),
                                  ),
                                );
                              },
                              itemCount: hintAdvices.length,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
