import 'package:astrotak/edit_profile.dart';
import 'package:astrotak/home.dart';
import 'package:astrotak/models/Database_Service.dart';
import 'package:astrotak/profile/new_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class FamilyProfile extends StatefulWidget {
  const FamilyProfile({Key? key}) : super(key: key);

  @override
  State<FamilyProfile> createState() => _FamilyProfileState();
}

class _FamilyProfileState extends State<FamilyProfile> {
  bool selectedBasicProfile = true;

  Future<void> _showMyDialog(String uuid) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Do you really want to Delete?'),
          actions: <Widget>[
            Container(
              width: 30.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: const Text('Yes'),
                onPressed: () {
                  deleteItem(uuid);
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              width: 30.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteItem(String uuid) async {
    var client = http.Client();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E";

    try {
      var response = await client.post(
          Uri.https('staging-api.astrotak.com', 'api/relative/delete/$uuid'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      Provider.of<DatabaseService>(context, listen: false).userList.removeAt(0);
      print(response.body);
    } finally {
      client.close();
      var snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Text('Profile Deleted Successfully'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 10),
        width: 55.w,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    List users = Provider.of<DatabaseService>(context).userList;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBasicProfile = !selectedBasicProfile;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: selectedBasicProfile
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      width: 45.w,
                      height: 6.h,
                      child: Center(
                        child: Text(
                          "Basic Profile",
                          style: TextStyle(
                              color: selectedBasicProfile
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBasicProfile = !selectedBasicProfile;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: !selectedBasicProfile
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      height: 6.h,
                      width: 45.w,
                      child: Center(
                        child: Text(
                          "Friends and Famliy Profile",
                          style: TextStyle(
                              color: !selectedBasicProfile
                                  ? Colors.white
                                  : Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      Icons.wallet_rounded,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Wallet balance: ₹ 0",
                      style: TextStyle(color: Colors.indigo, fontSize: 16),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
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
                width: 100.w,
                height: 6.h,
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.indigo, fontSize: 14),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "DOB",
                    style: TextStyle(color: Colors.indigo, fontSize: 14),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "TOB",
                    style: TextStyle(color: Colors.indigo, fontSize: 14),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Relation",
                    style: TextStyle(color: Colors.indigo, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 55.h,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 1.w),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "${users[index]["firstName"]}",
                                style: TextStyle(color: Colors.grey),
                              ),
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "${users[index]["birthDetails"]["dobDay"]}-${users[index]["birthDetails"]["dobMonth"]}-${users[index]["birthDetails"]["dobYear"]}",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${users[index]["birthDetails"]["tobHour"]}:${users[index]["birthDetails"]["tobMin"]}",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "${users[index]["relation"]}",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfile(data: users[index])));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showMyDialog(users[index]["uuid"]);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: users.length,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewProfile()));
                  },
                  child: Text("+ Add New Profile"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
