import 'package:apls/model/UserModel.dart';
import 'package:apls/servics/api.dart';
import 'package:flutter/material.dart';

import '../wedget/MyButton.dart';
import '../wedget/SignInTextField.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // text editing controllers
  final usernameController = TextEditingController(); //*
  final nameController = TextEditingController(); //*
  final addressController = TextEditingController(); //*
  final emailController = TextEditingController(); //*
  final phoneNumberController = TextEditingController(); //*
  final postCodeController = TextEditingController(); //*
  final cityController = TextEditingController(); //*

  final passwordController = TextEditingController(); //*

  RadioValue typeSelectedValue = RadioValue.option1;
  GenderValue genderSelectedValue = GenderValue.Male;

  void signUserIn() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        postCodeController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty) {
      Api api = Api();
      List<String> parts = usernameController.text.split(" ");
      UserModel userModel = UserModel(
          address: addressController.text,
          city: cityController.text,
          email: emailController.text,
          firstName: parts[0],
          gender: genderSelectedValue.name,
          lastName: parts[2],
          middleName: parts[1],
          phoneNumber: phoneNumberController.text,
          postCode: postCodeController.text);
      if (api.postUser(userModel)) {
        // go to Web View
        Navigator.pushReplacementNamed(context, '/WebPage');
      } else {
        //error message
      }
    } else {
      //field TextMessage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Positioned(
        top: 10,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/SingUp.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                  controller: usernameController,
                  hintText: "Full Name",
                  obscureText: true),
              const SizedBox(height: 5),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: true,
              ),
              const SizedBox(height: 5),
              MyTextField(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                obscureText: true,
              ),
              const SizedBox(height: 5),
              MyTextField(
                controller: addressController,
                hintText: 'Address',
                obscureText: true,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: cityController,
                hintText: 'City',
                obscureText: true,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: postCodeController,
                hintText: 'Post Code',
                obscureText: true,
              ),
              const SizedBox(height: 5),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: RadioValue.option1,
                        groupValue: typeSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            typeSelectedValue = value as RadioValue;
                          });
                        },
                      ),
                      const Text(
                        "Instructor",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Radio(
                        value: RadioValue.option2,
                        groupValue: typeSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            typeSelectedValue = value as RadioValue;
                          });
                        },
                      ),
                      const Text("Trainer",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Radio(
                        value: RadioValue.option3,
                        groupValue: typeSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            typeSelectedValue = value as RadioValue;
                          });
                        },
                      ),
                      const Text("Admin",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: GenderValue.Male,
                        groupValue: genderSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            genderSelectedValue = value as GenderValue;
                          });
                        },
                      ),
                      const Text("Male",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Radio(
                        value: GenderValue.Fmale,
                        groupValue: genderSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            genderSelectedValue = value as GenderValue;
                          });
                        },
                      ),
                      const Text("Female",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              MyButton(onTap: signUserIn),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/WebPage');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MyCustomFont',
                        fontSize: 18
                        // Set the desired text color
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

enum RadioValue { option1, option2, option3 }

enum GenderValue {
  Fmale,
  Male,
}
