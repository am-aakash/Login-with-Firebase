import 'package:flutter/material.dart';
import 'package:login_with_auth/Services/authentication/auth_services.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  final Function toggleScreen;

  const SignupPage({Key? key, required this.toggleScreen}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                height: MediaQuery.of(context).size.height - 30,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(height: 180),
                      ],
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "E-mail",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (val) => val!.isNotEmpty
                                    ? null
                                    : "Please enter E-mail address",
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.mail),
                                  hintText: 'Input E-mail',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                validator: (val) => val!.length < 6
                                    ? "Enter more than 6 character"
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: 'Input Password',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: MaterialButton(
                              minWidth: loginProvider.isLoading ? null : 150,
                              height: 60,
                              color: Colors.redAccent,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  print("Email: ${_emailController.text}");
                                  print(
                                      "Password: ${_passwordController.text}");
                                  await loginProvider.register(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                }
                              },
                              child: loginProvider.isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Signup",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already Have a account?"),
                              TextButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                onPressed: () => widget.toggleScreen(),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          // if (loginProvider.errorMessege != null)
                          //   Container(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 10, vertical: 5),
                          //     color: Colors.amberAccent,
                          //     child: ListTile(
                          //       title: Text(loginProvider.errorMessege),
                          //     ),
                          //   )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
