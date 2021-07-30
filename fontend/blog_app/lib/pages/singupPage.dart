import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool vis = true;
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.white, Colors.green[200]!],
        begin: const FractionalOffset(0.0, 1.0),
        end: const FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.repeated,
      )),
      child: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign up With email",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                )),
            SizedBox(
              height: 20,
            ),
            usernameTextField(),
            emailTextField(),
            userPasswordTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_globalKey.currentState!.validate()) {
                  print("Validated");
                }
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text("UserName"),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty)
                return "userName can't be enpty";
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ],
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text("UserEmail"),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) return "email can't be enpty";
              if (value.contains("@")) return "Email is invalid";
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ],
      ),
    );
  }

  Widget userPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text("UserPassword"),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty)
                return "Password can't be enpty";
              if (value.length <= 8)
                return "password length must should be >=8";
            },
            obscureText: true,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      vis = !vis;
                    });
                  },
                ),
                helperText: "password length shuld be have >=8",
                helperStyle: TextStyle(
                  fontSize: 16,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ],
      ),
    );
  }
}
