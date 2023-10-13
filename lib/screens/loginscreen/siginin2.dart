import 'package:flutter/material.dart';
import 'package:net/screens/splash/login.dart';
import 'package:net/screens/screens/whoswatching.dart';

class VerifysignUP extends StatefulWidget {
  const VerifysignUP({super.key});

  @override
  State<VerifysignUP> createState() => _VerifysignUPState();
}

class _VerifysignUPState extends State<VerifysignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Image.asset(
          'lib/assets/image/netflix-logo-png-large.png',
          height: 70,
          width: 70,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "HELP",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 15),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "SIGN IN",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 15),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Ready to experience unlimited TV shows & movies?",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create an account to learn more about Netflix.",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 15),
                  textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email or phone number",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "password",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0Xfff90201),
                ),
                child: Center(
                    child: Text(
                  'CONTINUE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
