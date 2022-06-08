import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final NameController = TextEditingController();
  final dateController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  final pobController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  List<String> _gender = ['Male', 'Female', 'Other', ""]; // Option 2
  int _selectedIndex = 0;
  String _selectedLocation = "";

  List<String> _relation = ['Married', 'Single', ""]; // Option 2
  int _selectedIndex2 = 0;
  String _selectedLocation2 = "";

  bool selectedAm = true;
  bool selectedBasicProfile = true;
  @override
  void initState() {
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
                        onPressed: () {},
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
