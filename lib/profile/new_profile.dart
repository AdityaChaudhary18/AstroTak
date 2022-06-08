import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  List<String> _gender = ['Male', 'Female', 'Other', ""]; // Option 2
  int _selectedIndex = 0;
  String _selectedLocation = "";

  List<String> _relation = ['Married', 'Single', ""]; // Option 2
  int _selectedIndex2 = 0;
  String _selectedLocation2 = "";

  bool selectedAm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add New Profile",
          style: TextStyle(color: Colors.black),
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
                    controller: firstNameController,
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
                          decoration:
                              authTextFieldDecoration.copyWith(hintText: "DD"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: stateController,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Flexible(
                        child: TextFormField(
                          maxLength: 2,
                          decoration:
                              authTextFieldDecoration.copyWith(hintText: "MM"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: cityController,
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
                          controller: pincodeController,
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
                          decoration:
                              authTextFieldDecoration.copyWith(hintText: "HH"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: stateController,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Flexible(
                        child: TextFormField(
                          maxLength: 2,
                          decoration:
                              authTextFieldDecoration.copyWith(hintText: "MM"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: cityController,
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
                    controller: addressController,
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
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 32.w,
                          ),
                          Text(
                            "Relation",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
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
                                      _selectedLocation2 = newValue.toString();
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
    );
  }
}
