import 'package:blog_app/pages/singupPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.green[200]!],
          begin: const FractionalOffset(0.0, 1.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          children: [
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: Text(
                "DevStack",
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: Text("Great stories for Great people",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 38,
                      letterSpacing: 2)),
            ),
            SizedBox(height: 20),
            boxContainer("assets/google.png", "Sign up with Google", null),
            SizedBox(height: 20),
            boxContainer("assets/facebook.png", "Sign up with  Facebook", null),
            SizedBox(height: 20),
            boxContainer(
                "assets/email.png", "Sign up with Email", onEmailClick),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "SingIn",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  onEmailClick() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SingUpPage(),
    ));
  }

  Widget boxContainer(String path, String text, onclick) {
    return InkWell(
      onTap: onclick,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - 125,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  path,
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 20),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
