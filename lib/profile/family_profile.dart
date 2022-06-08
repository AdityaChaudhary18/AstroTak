import 'package:astrotak/home.dart';
import 'package:astrotak/models/Database_Service.dart';
import 'package:astrotak/profile/new_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FamilyProfile extends StatefulWidget {
  const FamilyProfile({Key? key}) : super(key: key);

  @override
  State<FamilyProfile> createState() => _FamilyProfileState();
}

class _FamilyProfileState extends State<FamilyProfile> {
  @override
  Widget build(BuildContext context) {
    List users = Provider.of<DatabaseService>(context).userList;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
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
                              onTap: () {},
                              child: Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            GestureDetector(
                              onTap: () {},
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
