import 'package:flutter/material.dart';
import 'package:net/screens/color/color.dart';
import 'package:net/screens/splash/login.dart';
import 'package:net/screens/loginscreen/signin.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/image/coverimg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                actions: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "PRIVACY",
                          style: TextStyle(
                            fontSize: 15,
                            color: Kwhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "SIGNIN",
                          style: TextStyle(
                            fontSize: 15,
                            color: Kwhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
                backgroundColor: Color.fromARGB(0, 234, 234, 234),
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'lib/assets/image/NetflixLogo2016.webp',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Unlimited entertainment, one low price.",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                            textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'All of Netflix, starting at just ₹149',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));
                },
                child: Container(
                  height: 52,
                  width: 336,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0Xfff90201)),
                  child: Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
