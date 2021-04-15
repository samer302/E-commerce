import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:math';

class ConfirmCode extends StatefulWidget {
  @override
  _ConfirmCodeState createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  var random = new Random().nextInt(100000   - 1);
  int limit ;
  void changeData(String checkPin){
    setState(() {
         // ignore: unrelated_type_equality_checks
         if(checkPin ==random){
             return random.toString();
         }else{
          return 'Error';
         }
    });

  }
  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(milliseconds: 120));
    setState(() {
       random =  new Random().nextInt(100000   - 1);
    });
    return null;
  }
  final _scaffoldKey =GlobalKey<ScaffoldState>();
  final  refreshKey =GlobalKey<RefreshIndicatorState>();
  TextEditingController  textEditingController =TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:  _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF8A2BE2),
        title: Text(
          'Confirm Code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'We sent you a verificiation code ',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                 random.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'You didn\'t recevie the code ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Try new code ',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            refreshList();
                            }
                      ),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
              ),
              Container(
               // color: Colors.white,
               // margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
                  child: PinPut(
                      fieldsCount: 5,
                    onSubmit:(String pin)=> _showSnackBar(pin, context),
                    controller: textEditingController,
                    focusNode: focusNode,
                 submittedFieldDecoration:BoxDecoration(
                   border: Border.all(color: Colors.black,width: 2),
                   borderRadius:BorderRadius.circular(5),
                 ) ,
                    selectedFieldDecoration:BoxDecoration(border: Border.all(color: Colors.black,width: 2),
                      borderRadius:BorderRadius.circular(5),),
                    followingFieldDecoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),
                      borderRadius:BorderRadius.circular(5),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                child: Text('Clear All'),
                onPressed: () => textEditingController.text = '',
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showSnackBar(String pin ,BuildContext context) {
    if(pin == '$random'){
      final snackBar= SnackBar(
        content: Text('Pin Submitted. Value: $pin'),
        duration: Duration(seconds: 3),

      );
     deferredPop(context);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
  static void deferredPop(BuildContext context) async{
    Future.delayed(
        Duration(seconds: 5),
            () => Navigator.of(context).pushNamed('view Screen')
    );
  }

}
