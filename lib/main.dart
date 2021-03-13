import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:predictionmodelhdd/user_model.dart';


void main() {
  runApp(My());
}
class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Field',
        home: HomePage()
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title huaa"),
    content: Text("This is my message huaaa."),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Dont Worry"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String answer="";

Future<UserModel> createUser (String smart_5_raw,String	smart_187_raw,String	smart_188_raw,
    String smart_197_raw,String	smart_198_raw ) async{
  final String apiUrl = "https://hdd-failure-predictor.herokuapp.com/predict";

  final response = await http.post(apiUrl,body: {
    "smart_5_raw":smart_5_raw,
    "smart_187_raw":smart_187_raw,
    "smart_188_raw":smart_188_raw,
    "smart_197_raw":smart_197_raw,
    "smart_198_raw":smart_198_raw
  });
  print('hhh');
  if(response.statusCode==200){
    final String responseString = response.body;
    // print(responseString);
    answer=responseString;
    //return userModelFromJson(responseString);
  }else{
    print('kkkk');
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController oneTextEditingController = new TextEditingController();

  TextEditingController twoTextEditingController = new TextEditingController();

  TextEditingController threeTextEditingController = new TextEditingController();

  TextEditingController fourTextEditingController = new TextEditingController();

  TextEditingController fiveTextEditingController = new TextEditingController();

  UserModel _user;

  List _output;

  Future<void> _launched;

  String _launchUrl ='https://drive.google.com/file/d/10FrERjeIiJBBS1jT4PIe0Ded4rVuv16V/view?usp=sharing';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('HDD Failure Predictor'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20 ),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      SizedBox(height: 45,),
                      TextFormField(
                        controller: oneTextEditingController,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 1.0),
                          ),
                          hintText: 'Mobile Number',
                        ),

                      ),
                      SizedBox(height: 45,),
                      TextFormField(
                        controller: twoTextEditingController,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          hintText: 'smart_5_raw',
                        ),
                      ),
                      SizedBox(height: 45,),
                      TextFormField(
                        controller: threeTextEditingController,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 1.0),
                          ),
                          hintText: 'smart_187_raw',
                        ),
                      ),
                      SizedBox(height: 45,),
                      TextFormField(
                        controller: fourTextEditingController,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          hintText: 'smart_187_raw',
                        ),
                      ),
                      SizedBox(height: 45,),
                      TextFormField(
                        controller: fiveTextEditingController,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 1.0),
                          ),
                          hintText: 'smart_188_raw',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton.extended(
                heroTag: "btn1",
                onPressed: () async {
                  print('oooo');
                  final String  smart_5_raw=oneTextEditingController.text;
                  final String smart_187_raw=twoTextEditingController.text;
                  final String smart_188_raw=threeTextEditingController.text;
                  final String  smart_197_raw=fourTextEditingController.text;
                  final String  smart_198_raw=fiveTextEditingController.text;
                  print('jjj');
                  final UserModel user = await createUser(smart_5_raw, smart_187_raw, smart_188_raw, smart_197_raw, smart_198_raw);
                  print('uuu');
                  setState((){
                    _user=user;
                    print('qqq');
                  });
                  print('pppppp');

                  if(answer=='fail'){
                    print('fail hoga');
                    showAlertDialog(context);
                  }else {
                    print('fail nhi hoga');
                    showAlertDialog2(context);
                  }
                },
                label: Text('Predict'),
                icon: Icon(Icons.check),
                backgroundColor: Colors.green,
              ),
              FloatingActionButton.extended(
                heroTag: "btn2",
                onPressed: () {
                  _launchInBrowser(_launchUrl);
                },
                label: Text('Guidelines'),
                icon: Icon(Icons.help),
                backgroundColor: Colors.pink,
              )
            ],
          ),
        )
    );
  }
}
