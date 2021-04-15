import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _changePasswordPage(BuildContext context){
    Navigator.of(context).pushNamed('change password');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              height: 150,
              top: 90,
              left: 85,
              child: ImageIcon(
                AssetImage('assets/shopping-cart.png'),
                color: Colors.white,
                size: 210,
              ),
            ),
            Positioned(
                height: 50,
                top: 250,
                left: 140,
                child: Text(
                  'SHOP',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              // ignore: non_constant_identifier_names
              builder: (BuildContext) {
                return  Container(
                    height: (MediaQuery.of(context).size.height) * 0.56,
                    child: Center(
                        child:  Column(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
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
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.purple[600],
                                    ),
                                    labelText: 'Username',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
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
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.purple[600],
                                    ),

                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
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
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.purple[600],
                                    ),
                                    labelText: 'Confirm Password',
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              //Wrap with Material
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              color: Colors.purple[400],
                              clipBehavior: Clip.antiAlias, // Add This
                              child: MaterialButton(
                                minWidth: 365.0,
                                height: 55,
                                color: Colors.purple[600],
                                child: new Text('SIGN UP',
                                    style: new TextStyle(
                                        fontSize: 16.0, color: Colors.white)),
                                onPressed: () {
                                  setState(() {
                                  // _changePasswordPage(context);
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: ()=> _changePasswordPage(context),
                                child: Text(
                                  'Forget Your Password ?  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text.rich(
                                TextSpan(
                                  text: 'Have an account',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sign IN ',
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                    ) );
              });
        },
        child: const Icon(Icons.question_answer_sharp),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
