import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void _changePasswordPage(BuildContext context){
  Navigator.of(context).pushNamed('change password');
}
void _signInPage(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}

void _signUpPage(BuildContext context) {
  Navigator.of(context).pushNamed('sign up');
}
void _viewHomePage(BuildContext context) {
  Navigator.of(context).pushNamed('confirm password');
}
void toastMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      // timeInSecForIos: 1,
      fontSize: 16.0
  );
}
SharedPreferences localStorage;

class LoginSiginScreen extends StatefulWidget {


  @override
  _LoginSiginScreenState createState() => _LoginSiginScreenState();
}

class _LoginSiginScreenState extends State<LoginSiginScreen> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String username = 'samer';
  String password = '12345';
  String randomUsername ;
  String randomPassword ;
  void initState() {
    super.initState();
    randomUsername =  '';
    randomPassword =  '';
  }
  void _saveUsername() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('username', randomUsername);
    setState(() {
      username = randomUsername;
    });
  }
  void _savePassword() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('password',  randomPassword);
    setState(() {
      password =  randomPassword;
    });
  }

  Future checkLogin()async{
    if (userNameController.text == (username) && pwdController.text == password) {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('username', userNameController.text);
     _viewHomePage(context);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "Username & Password Invalid!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
  bool _working = true;
  String _username,_password  = '' ;
  final _formKey =GlobalKey<FormState>();
  final refreshKey=GlobalKey<RefreshIndicatorState>();
  Future<void> refreshList()async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _working = !_working;
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _working
          ? Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        width: double.infinity,

        height: (MediaQuery.of(context).size.height)  *0.56,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NameInput(),
              PasswordInput(),
              ButtonInput(),
              SizedBox(height: 25,),
              TextInput(),
            ],
          ),
        ),)
          :Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
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

                      onChanged: (val1){
                        username = val1;
                      },
                     /* validator: (name){
                        Pattern pattern =  r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                        RegExp regex = new  RegExp(pattern);
                        if (!regex.hasMatch(name))
                          return  'Invalid userName';
                        else
                          return null;
                      },
                      onSaved: (name)=> _username = name,*/
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
                      onChanged: (val2){
                        password =val2;
                      },
                    /*  validator: (password){
                        Pattern pattern =
                            r'[0-9]';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(password))
                          return 'Invalid password';
                        else
                          return null;
                      },
                      onSaved: (password)=> _password = password,*/
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
                      onChanged: (val2){
                        password =val2;
                      },
                     /* validator: (password){
                        Pattern pattern =
                            r'[0-9]';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(password))
                          return 'Invalid password';
                        else
                          return null;
                      },
                      onSaved: (password)=> _password = password,*/
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
                       // checkLogin();
                        _saveUsername();
                        _savePassword();
                       // _viewHomePage(context);
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
                InkWell(
                  onTap: ()=>_signInPage(context),
                  child: Padding(
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
                                fontWeight: FontWeight.w400,
                            ),
                          ),
                          // can add more TextSpans here...
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ) ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget NameInput(){
    return  Container(
      decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:TextFormField(
          controller: userNameController,
        /*  validator: (name){
            Pattern pattern =  r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
            RegExp regex = new  RegExp(pattern);
            if (!regex.hasMatch(name))
              return  'Invalid userName';
            else
              return null;
          },
          onSaved: (name)=> _username = name,*/
          obscureText: false,
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
    );
  }
  // ignore: non_constant_identifier_names
  Widget PasswordInput(){
    return  Container(
      decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: pwdController,
        /*  validator: (password){
            Pattern pattern =
                r'[0-9]';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(password))
              return 'Invalid password';
            else
              return null;
          },
          onSaved: (password)=> _password = password,*/
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
    );
  }
  // ignore: non_constant_identifier_names
  Widget ButtonInput(){
    return   Material(
      //Wrap with Material
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)),
      elevation: 6.0,
      color: Colors.purple[400],
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: 350.0,
        height: 55,
        color: Colors.purple[600],
        child: new Text('SIGN IN',
            style: new TextStyle(fontSize: 16.0, color: Colors.white)),
        onPressed: (){
          if(_formKey.currentState.validate()){
            _formKey.currentState.save();
            toastMessage("Username: $_username\nPassword:$_password");
            checkLogin();
          }
        },
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget TextInput(){
    return   Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: ()=>_changePasswordPage(context),
          child: Text(
            'Forget Your Password ?  ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 25,),
        Text.rich(
          TextSpan(
            text: 'Don\'t have account  ? ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                text: 'Sign Up ',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => refreshList(),
              ),
              // can add more TextSpans here...
            ],
          ),
        ),
      ],
    );
  }
}
