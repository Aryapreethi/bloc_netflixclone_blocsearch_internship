import 'package:flutter/material.dart';

import '../screens/whoswatching.dart';
// import 'package:net/screens/viewscreen.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Image.asset(
          'lib/assets/image/netflix-logo-png-large.png',
          height: 70,
          width: 70,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15,top:120),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0Xff212121),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email or phone number",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0Xff212121),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "password",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
              obscureText: true,
            ),
              SizedBox(height: 15,),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: ((context) => Profile())));
              },
              child: Container(
                height: 52,
              
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   
                    border: Border.all(color: Colors.white, width: 1)),
                child: Center(
                    child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
              ),
            ),
              SizedBox(height: 15,),
            Text("Need help?"),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New to Netflix?"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign up now.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Sign in is protected in by Google reCAPTCHA to ensure you're not a bot.Learn more.",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
