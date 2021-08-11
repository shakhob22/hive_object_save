import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_object_save/models/user_model.dart';
import 'package:hive_object_save/pages/home_page.dart';
import 'package:hive_object_save/pages/login_page.dart';
import 'package:hive_object_save/services/db_services.dart';
import 'package:ionicons/ionicons.dart';

class SignupPage extends StatefulWidget {
  static final id = "signup_page";
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  void _doSignUp() async {
    String email = emailController.text.trim();
    String number = numberController.text.trim();
    String address = addressController.text.trim();

    Account account = Account(email: email, number: number, address: address);

    AccountDB().storeAccount(account);

    var b = AccountDB().loadAccount();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return HomePage.account(email: b.email, number: b.number, address: b.address, fromLoginPage: false,);
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

                      Text("Welcome", style: TextStyle(color: Colors.white54, fontSize: 16, letterSpacing: 1),),
                      SizedBox(height: 5,),

                      Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 32, letterSpacing: 1, fontWeight: FontWeight.bold),),
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
                            Text("Number", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            TextField(
                              controller: numberController,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                  hintText: "Number",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                            SizedBox(height: 40,),
                            Text("Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            TextField(
                              controller: addressController,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                  hintText: "Address",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: MaterialButton(
                                onPressed: (){
                                  _doSignUp();
                                },
                                color: Color.fromARGB(255, 7, 115, 112),
                                child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18),),
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
                                Text("Already have an account?", style: TextStyle(color: Colors.grey, fontSize: 16),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, LoginPage.id);
                                  },
                                  child: Text("Sign IN", style: TextStyle(fontSize: 16),),
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