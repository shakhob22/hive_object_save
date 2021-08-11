import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_object_save/models/user_model.dart';
import 'package:hive_object_save/pages/signup_page.dart';
import 'package:hive_object_save/services/db_services.dart';
import 'package:ionicons/ionicons.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static final id = "login_page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User user = new User(email: email, password: password);
    UserDB().storeUser(user);

    var a = UserDB().loadUser();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return HomePage(email: a.email, password: a.password, fromLoginPage: true,);
        }
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 115, 112),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 24,
                      foregroundImage: AssetImage("assets/images/logo.png"),
                    ),
                    SizedBox(height: 20,),

                    Text("Welcome", style: TextStyle(color: Colors.white54, fontSize: 16, letterSpacing: 1),),
                    SizedBox(height: 5,),

                    Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 32, letterSpacing: 1, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                    ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            TextField(
                              controller: emailController,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                            SizedBox(height: 40,),
                            Text("Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            TextField(
                              controller: passwordController,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextButton(
                              onPressed: (){},
                              child: Container(alignment: Alignment.center,
                                  child: Text("Forget Password?", style: TextStyle(color: Colors.grey, letterSpacing: 1),)
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: MaterialButton(
                                onPressed: (){
                                  _doLogin();
                                },
                                color: Color.fromARGB(255, 7, 115, 112),
                                child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18),),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Divider(endIndent: 20,color: Colors.grey,)),
                                Text("OR", style: TextStyle(color: Colors.grey, fontSize: 16),),
                                Expanded(child: Divider(indent: 20,color: Colors.grey,))
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Ionicons.logo_facebook, color: Colors.blue[800],),
                                ),
                                SizedBox(width: 20,),
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Ionicons.logo_twitter, color: Colors.blue,),
                                ),
                                SizedBox(width: 20,),
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Ionicons.logo_instagram, color: Colors.pink,),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 16),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, SignupPage.id);
                                  },
                                  child: Text("SignUp", style: TextStyle(fontSize: 16),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
              )
            ],
          ),
        ),
      )
    );
  }
}