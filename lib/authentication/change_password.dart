import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  void _ConfirmPassword(){
    Navigator.of(context).pushNamed('confirm password');
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8A2BE2),
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.white,
              fontSize: 22,),
        ),
      ),
      body:Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
                    child: Text('Old Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //  color: Colors.grey[300],
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon:IconButton(
                          icon: Icon(Icons.visibility_off),
                            color: Color(0xFF4D1A7F),
                          ),
                          border: InputBorder.none,

                         // labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
                    child: Text('New Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //  color: Colors.grey[300],
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon:IconButton(
                            icon: Icon(Icons.visibility_off),
                            color: Color(0xFF4D1A7F),
                          ),
                          border: InputBorder.none,

                          // labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    child: Text('Confirm Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //  color: Colors.grey[300],
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon:IconButton(
                            icon: Icon(Icons.visibility_off),
                            color: Color(0xFF4D1A7F),
                          ),
                          border: InputBorder.none,

                          // labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    //Wrap with Material
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 18.0,
                    color: Colors.purple[400],
                    clipBehavior: Clip.antiAlias, // Add This
                    child: MaterialButton(
                      minWidth: (MediaQuery.of(context).size.height)*0.458,
                      height: (MediaQuery.of(context).size.height)*0.07,
                      color: Color(0xFF8A2BE2),
                      child: new Text('Confirm Password',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () {
                        setState(() {
                           _ConfirmPassword();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
