import 'package:astrotak/profile/new_profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'family_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
              size: 20,
            ),
          ),
          backgroundColor: Colors.white,
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
              padding: EdgeInsets.only(right: 3.w, top: 1.5.h, bottom: 1.5.h),
              child: Container(
                width: 20.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                ),
              ),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: 'My Profile',
              ),
              Tab(
                text: 'Order History',
              ),
            ],
          ),
        ),
        body: FamilyProfile(),
      ),
    );
  }
}
