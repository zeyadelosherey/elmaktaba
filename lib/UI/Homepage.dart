
import 'dart:convert';

import 'package:elmaktaba/Model/CategoryModel.dart';
import 'package:elmaktaba/UI/SearchPage.dart';
import 'package:elmaktaba/UI/categoryActivity.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


Future<CategoryModel> fetchCat() async {
  final response =
  await http.get('https://androidtesst.000webhostapp.com/api/getallcat.php');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return CategoryModel.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}



class MyHomePage extends StatefulWidget {

   MyHomePage({Key key}) : super(key: key);




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
   Future<CategoryModel> category;

  @override
  void initState() {
  super.initState();
    category = fetchCat();
  }
  var drawersize = 17.0;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("المكتبة" , style: TextStyle(color: Colors.black, fontSize: 25 ,fontWeight: FontWeight.bold ,fontFamily: 'Cairo' ),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer:Drawer(
        elevation: 3,
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                  child: Center(
                    child: Text("المكتبة"  ,style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.black),),
                  ),
              ),
            ),
            ListTile(
              title: Container(
                child: Text("الرئيسية" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),

              ),
              onTap: ()=> Navigator.pop(context),
            ),

            ListTile(
              title: Container(
                child: Text("الروايات المحمله" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
              
              ),

              onTap: ()=> Navigator.pop(context),
            ),
            ListTile(
              title: Container(
                child: Text("تقييم التطبيق" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),

              ),
              onTap: (){
               Navigator.pop(context);

              }
            ),
            ListTile(
              title: Container(
                child: Text("مشاركة التطبيق" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),

              ),
              onTap: (){
                Share.share('check out my website https://example.com');
                Navigator.pop(context);

                }
              ,
            ),
            ListTile(

              title: Container(
                child: Text("أرسل لنا ملاحظاتك" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),

              ),
              onTap: ()  {
                        send("أرسل ملاحظاتك");
                        Navigator.pop(context);
              }
    ),
    ListTile(
    title: Container(
    child: Text("أطلب رواية" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),

    ),
    onTap: (){
      send("أطلب رواية");
      Navigator.pop(context);
    }
    ),
    ListTile(
    title: Container(
    child: Text("عن التطبيق" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.
    bold),textAlign: TextAlign.right,),

              ),
              onTap: (){

                    Navigator.pop(context);
                    showDialog(context: context, child:
                    new AlertDialog(
                      title: new Text(" منتصف انتهت معاملة أخذ عل, عل الأوروبي استطاعوا ذلك. في والروسية التقليدية فقد, بحث أم غريمه الإنزال. تاريخ أوراقهم باستخدام وفي ما, البرية واستمرت ان دار. أن بلا أراضي ويكيبيديا, بها لم يطول الفترة والمعدات. لكل قد ويعزى ليرتفع ولاتّساع." ,
                        textAlign: TextAlign.right,style: TextStyle(fontSize: 13 , color: Colors.black , fontWeight: FontWeight.bold),),

                    )
                    );
                }
            ),
            ListTile(
              title: Container(
                child: Text("تابعنا علي فيسبوك" , style: TextStyle(color: Colors.black45, fontSize: drawersize , fontWeight: FontWeight.bold),textAlign: TextAlign.right,),

              ),
              onTap: ()=> Navigator.pop(context)
            ),
          ],
        ),
      ),
body: Container(

  child:


//
//ListView(children: <Widget>[
//
   FutureBuilder<CategoryModel>(
  future: category,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return   ListView.builder(
          itemCount: snapshot.data.Categories.length,
          itemBuilder: (context, index){
            if(index == 0){
              return _SearchBar();
            }

            else{
              return  ListCustomCard(snapshot.data.Categories[index].cat_name , snapshot.data.Categories[index].cat_image , snapshot.data.Categories[index].id);}}
      );
    } else if (snapshot.hasError) {
      return Center(child: Text("عفوا تأكد من أتصال الانترنت "),);
    }

    // By default, show a loading spinner
    return Center(child:CircularProgressIndicator() ,) ;
  },
),
    ),

























        




);


  
  
  
 





  }

  Widget  _SearchBar() {

    return Padding(padding: EdgeInsets.all(20) ,
          child:
          Container(

            decoration: BoxDecoration( boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  0.0, // vertical, move down 10
                ),
              )
            ],),


            child:
            TextFormField(
              style: TextStyle(height: 0.5, color: Colors.black , fontSize: 15, fontFamily:'Cairo' ),
              controller: myController,


              onFieldSubmitted: (myController){
              if(myController.isEmpty || myController.length <= 1 ){
                  Fluttertoast.showToast(
                      msg: "أضف كلمه للبحث",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white
                  );
                }else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage(myController : myController)),
                  );
                }
              } ,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "أبحث عن روايتك",

                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.1)), borderSide: BorderSide(color: Colors.white )) ,
                enabledBorder:   OutlineInputBorder(
                  borderSide:   BorderSide(color: Colors.white, width: 0.0),

                ),
                focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.white, width: 0.0) ),


              ),
            ),


          )


      )
    ;
  }

  Widget ListCustomCard (String name , String image , String uid ){
    return
      Padding(padding: EdgeInsets.only(top:5 , left: 20 , right: 20 , bottom: 5 ) ,
    child:
        InkWell(
          child:

    Container(
      height: 100,
    color: Colors.black12,
    child:
      Center(

      child:
      Stack(
        children: <Widget>[
          Image.network(
            image,
            fit: BoxFit.cover,
            width: double.infinity,

          ),
          Container(width:double.infinity, height: 100, color: Color.fromRGBO(0, 0, 0, 0.5),

            child:Container(
               alignment: Alignment(0.9,0.9 ),
              child:
                Text(name , style: TextStyle(fontSize: 25 , color: Colors.white , fontWeight: FontWeight.bold),)
              ,
            ) ,
          )
        ],

      ),
    )) ,
          onTap: ()=> Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => categoryActivity(uid: uid , title:name)),
          ) ,
        ));
  }


  final GlobalKey<ScaffoldState> _scafoldKey = new GlobalKey<ScaffoldState>();
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> send(msg) async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    final MailOptions mailOptions = MailOptions(
      subject: msg,
      recipients: ['zeyadelosherey@gmail.com'],

      // bccRecipients: ['other@example.com'],


    );

    String platformResponse;

    try {
      await FlutterMailer.send(mailOptions);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

  }

}
