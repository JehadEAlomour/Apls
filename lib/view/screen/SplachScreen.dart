import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();

}

class _SplachScreenState extends State<SplachScreen> {
  bool _showIndicator = true;
  @override
  void initState() {
    super.initState();
    // Trigger the delayed indicator after 5 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showIndicator = false;
      });
      Navigator.pushReplacementNamed(context, '/SignUp');
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/Splach2.png"),
               fit: BoxFit.cover,
             ),

           ),
         child:Center(
           child:_showIndicator?CircularProgressIndicator(
             color: Colors.redAccent,
           ):Text(
             "Hi",
             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
           ) // Show the indicator after delay


         ),

       ),

    );
  }
}
