import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Color _orange = Color(0xFFFB6D3B);

  final Color _blue = Color(0xff4285F4);

  final Color _blueGrey = Color(0xff4460A0);

  final Color _black = Color(0xFF6C747F);

  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 40,
              color: _black,
            ),
          ),
          RichText(
            text: TextSpan(
              // style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: isSignIn
                      ? 'Don\'t have an account? '
                      : 'Enter your Email and new Password for sign up, or ',
                  style: TextStyle(
                    fontSize: 15,
                    color: _black,
                  ),
                ),
                TextSpan(
                  text: isSignIn ? 'Sign up now!' : 'Already have account?',
                  style: TextStyle(
                    fontSize: 15,
                    color: _orange,
                  ),
                )
              ],
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1),
              ),
              hintText: 'Email or Phone Number',
              labelText: 'Email or Phone Number',
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1),
              ),
              hintText: 'Password',
              labelText: 'Password',
            ),
          ),
          isSignIn
              ? SizedBox()
              : TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                  ),
                ),
          isSignIn ? Center(child: Text('Forgot Password?')) : SizedBox(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: _orange, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              setState(() {
                isSignIn = !isSignIn;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isSignIn ? 'SIGN IN' : 'SIGN UP'),
              ],
            ),
          ),
          isSignIn ? Center(child: Text('OR')) : SizedBox(),
          isSignIn
              ? ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    primary: _blueGrey, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.ac_unit),
                      Text('CONTINUE WITH FACEBOOK'),
                      Icon(null),
                    ],
                  ),
                )
              : SizedBox(),
          isSignIn
              ? ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    primary: _blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.ac_unit),
                      Text('CONTINUE WITH GOOGLE'),
                      Icon(null),
                    ],
                  ),
                )
              : SizedBox(),
          isSignIn
              ? SizedBox()
              : Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      // style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: 'By signing up you agree to our ',
                          style: TextStyle(
                            fontSize: 15,
                            color: _black,
                          ),
                        ),
                        TextSpan(
                          text: 'Teams Condition',
                          style: TextStyle(
                            fontSize: 15,
                            color: _orange,
                          ),
                        ),
                        TextSpan(
                          text: ' & ',
                          style: TextStyle(
                            fontSize: 15,
                            color: _black,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontSize: 15,
                            color: _orange,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
