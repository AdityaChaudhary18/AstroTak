import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';

class EditProfile extends StatefulWidget {
  final data;
  EditProfile({required this.data});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final NameController;
  late final dateController;
  late final monthController;
  late final yearController;
  late final hourController;
  late final minuteController;
  late final pobController;
  late final formGlobalKey = GlobalKey<FormState>();

  List<String> _gender = ['Male', 'Female', 'Other', ""]; // Option 2
  int _selectedIndex = 0;
  String _selectedLocation = "";

  List<String> _relation = [
    'Daughter',
    'Brother',
    "Son",
    "Father",
    "Wife",
    "Husband",
    ""
  ]; // Option 2
  int _selectedIndex2 = 0;
  String _selectedLocation2 = "";

  bool selectedAm = true;
  bool selectedBasicProfile = true;

  void updateUserData() async {
    var client = http.Client();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E";

    try {
      var response = await client.post(
          Uri.https('staging-api.astrotak.com',
              'api/relative/update/${widget.data["uuid"]}'),
          body: jsonEncode({
            "uuid": widget.data["uuid"],
            "relation": _relation[_selectedIndex2],
            "relationId": _selectedIndex2,
            "firstName": NameController.value.text,
            "middleName": null,
            "lastName": NameController.value.text,
            "fullName": NameController.value.text,
            "gender": _gender[_selectedIndex],
            "dateAndTimeOfBirth":
                "${yearController.value.text}-${monthController.value.text}-${dateController.value.text} ${hourController.value.text}:${minuteController.value.text}",
            "birthDetails": {
              "dobYear": int.parse(yearController.value.text),
              "dobMonth": int.parse(monthController.value.text),
              "dobDay": int.parse(dateController.value.text),
              "tobHour": int.parse(hourController.value.text),
              "tobMin": int.parse(minuteController.value.text),
              "meridiem": selectedAm ? "AM" : "PM"
            },
            "birthPlace": {
              "placeName": pobController.value.text,
              "placeId": widget.data["birthPlace"]["placeId"]
            }
          }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
    } finally {
      client.close();
      var snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Text('Profile Updated Successfully'),
        backgroundColor: Colors.grey,
        duration: Duration(seconds: 10),
        width: 55.w,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    NameController =
        TextEditingController(text: widget.data["firstName"].toString());

    dateController = TextEditingController(
        text: widget.data["birthDetails"]["dobDay"].toString());

    monthController = TextEditingController(
        text: widget.data["birthDetails"]["dobMonth"].toString());

    yearController = TextEditingController(
        text: widget.data["birthDetails"]["dobYear"].toString());

    hourController = TextEditingController(
        text: widget.data["birthDetails"]["tobHour"].toString());

    minuteController = TextEditingController(
        text: widget.data["birthDetails"]["tobMin"].toString());

    pobController = TextEditingController(
        text: widget.data['birthPlace']["placeName"].toString());

    super.initState();
  }

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
              padding: EdgeInsets.symmetric(vertical: 1.8.h),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
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
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Add New Profile",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      decoration: authTextFieldDecoration.copyWith(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      controller: NameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Date of Birth",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            maxLength: 2,
                            decoration: authTextFieldDecoration.copyWith(
                                hintText: "DD"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            controller: dateController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Flexible(
                          child: TextFormField(
                            maxLength: 2,
                            decoration: authTextFieldDecoration.copyWith(
                                hintText: "MM"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            controller: monthController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Flexible(
                          child: TextFormField(
                            maxLength: 4,
                            decoration: authTextFieldDecoration.copyWith(
                                hintText: "YYYY"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            controller: yearController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Time of Birth",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextFormField(
                            maxLength: 2,
                            decoration: authTextFieldDecoration.copyWith(
                                hintText: "HH"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            controller: hourController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Flexible(
                          child: TextFormField(
                            maxLength: 2,
                            decoration: authTextFieldDecoration.copyWith(
                                hintText: "MM"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            controller: minuteController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAm = !selectedAm;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedAm
                                        ? Color(0xFF4B60BC)
                                        : Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                width: 15.w,
                                height: 6.h,
                                child: Center(
                                  child: Text(
                                    "AM",
                                    style: TextStyle(
                                        color: selectedAm
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAm = !selectedAm;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: !selectedAm
                                        ? Color(0xFF4B60BC)
                                        : Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                height: 6.h,
                                width: 15.w,
                                child: Center(
                                  child: Text(
                                    "PM",
                                    style: TextStyle(
                                        color: !selectedAm
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Place of Birth",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      decoration: authTextFieldDecoration.copyWith(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      controller: pobController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Gender",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(
                              width: 32.w,
                            ),
                            Text(
                              "Relation",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 45.w,
                              height: 6.h,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    underline: SizedBox(
                                      height: 0,
                                    ),
                                    value: _selectedLocation,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedLocation = newValue.toString();
                                      });
                                    },
                                    items: _gender.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Container(
                              width: 45.w,
                              height: 6.h,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    underline: SizedBox(
                                      height: 0,
                                    ),
                                    value: _selectedLocation2,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedLocation2 =
                                            newValue.toString();
                                      });
                                    },
                                    items: _relation.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed: () {
                          updateUserData();
                        },
                        child: Text("Save Changes"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
