import 'package:flutter/material.dart';
import 'package:hive_object_save/services/db_services.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  static final id = "home_page";
  String? email;
  String? number;
  String? address;
  String? password;
  bool? fromLoginPage;
  HomePage({this.email, this.password, this.fromLoginPage});
  HomePage.account({this.email, this.number, this.address, this.fromLoginPage});

  var account = AccountDB();
  var user = UserDB();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                widget.fromLoginPage! ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Email: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Text("Password: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.email!, style: TextStyle(fontSize: 24),),
                        Text(widget.password!, style: TextStyle(fontSize: 24),),
                      ],
                    )
                  ],
                ) :
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Email: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Text("Number: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Text("Address: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.email!, style: TextStyle(fontSize: 24),),
                        Text(widget.number!, style: TextStyle(fontSize: 24),),
                        Text(widget.address!, style: TextStyle(fontSize: 24),),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: (){
                widget.account.removeAccount();
                widget.user.removeUser();
                Navigator.pushReplacementNamed(context, LoginPage.id);
              },
              color: Colors.red,
              child: Text("Log OUT", style: TextStyle(color: Colors.white, fontSize: 24),),
            )
          ],
        )
    );
  }}
