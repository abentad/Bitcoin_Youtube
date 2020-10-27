import 'package:Bitcoin_Youtube/net/flutter_fire.dart';
import 'package:Bitcoin_Youtube/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool signedUp = false;
  bool logedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height - 25,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.0),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.0),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                    ),
                    hintText: "FULL NAME",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    hintText: "EMAIL",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: "PASSWORD",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: "CONFIRM PASSWORD",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          signedUp = true;
                        });
                        bool shouldNavigate = await register(
                            emailController.text, passwordController.text);
                        if (shouldNavigate) {
                          //navigate
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                          setState(() {
                            signedUp = false;
                          });
                        }
                      },
                      child: Container(
                        height: 60.0,
                        width: 150.0,
                        //padding: EdgeInsets.symmetric(
                        //horizontal: 35.0, vertical: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            signedUp
                                ? SpinKitRing(
                                    lineWidth: 1.3,
                                    color: Colors.white,
                                    size: 20.0,
                                  )
                                : Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                    ),
                                  ),
                            SizedBox(width: 5.0),
                            signedUp
                                ? Container()
                                : Icon(
                                    Icons.arrow_right_alt,
                                    color: Colors.white,
                                  ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF7C457).withOpacity(.3),
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                10.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFF7C457),
                              Color(0xFFFEA13A),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    FlatButton(
                      onPressed: () async {
                        bool shouldSignIn = await signIn(
                            emailController.text, passwordController.text);
                        if (shouldSignIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color(0xFFF7C457),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// f7c457
// fea13a
