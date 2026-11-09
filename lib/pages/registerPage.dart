import 'package:flutter/material.dart';

import '../custom_widgets/custom_textField.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x7C15),
        child:
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            color: Color(0xFF6C708F),
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              children : [
                Text("REGISTER", style: TextStyle(fontSize: 30, color: Colors.white),),

                customTextField('First Name', Icons.person),

                customTextField('Last Name', Icons.person_2),

                customTextField('email', Icons.email),

                customTextField('password', Icons.lock),

               customTextField('confirm password', Icons.lock),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (){},
                    child:
                      Text("Register")
                )
              ],
        ),

          ),)
    ),
    );
  }
}
