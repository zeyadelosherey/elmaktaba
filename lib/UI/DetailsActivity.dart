import 'dart:io';

import 'package:elmaktaba/UI/WebviewActivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';





class DetailsActivity extends StatefulWidget{
    String bookname , writer , image, book_desc , bookD, bookR ;
    DetailsActivity({Key key , @required this.bookname , @required this.writer , @required this.image , @required this.book_desc , @required this.bookR , @required this.bookD}) : super(key: key);

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".



    @override
    DetailsState createState() => DetailsState();



}

class DetailsState extends State<DetailsActivity>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final platform = Theme.of(context).platform;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(""), elevation: 0,backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      body:
          Container(
               child: new SingleChildScrollView(
          child: new ConstrainedBox(
          constraints: new BoxConstraints(),
          child:
      Column(children: <Widget>[
       
      
       Container(
        alignment: Alignment(0, 0),

         child:
       Material(

         elevation: 5,
         child:
         Image.network(
           widget.image,
           height: 250,
           width: 200,
           fit: BoxFit.fill,

         )
         ,
       ),

      ),
        SizedBox(width: 12, height: 12,),
        Center(child: Text(widget.bookname , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold ,fontSize: 20),),),
        SizedBox(width: 12, height: 12,),
        Center(child: Text("للكاتب : ${widget.writer}" ,style: TextStyle(fontSize:15 , color: Color.fromRGBO(0, 0, 0, 0.5)),),),
        SizedBox(width: 10, height: 20,),
        Padding(padding: EdgeInsets.only(left: 20 , right: 20) ,
          child:
           Center( child: Text( widget.book_desc ,textAlign:TextAlign.right, style: TextStyle(fontSize:15 , color: Color.fromRGBO(0, 0, 0, 0.8)),),),

            ),
       SizedBox(width: 10, height: 20,),

       Row(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: <Widget>[

           FlatButton(onPressed: () {


//             Navigator.push(
//                 context,
//             MaterialPageRoute(builder: (context) =>
//                          WebviewActivity()
//
//             ));

           }
               , color: Colors.blue,padding: EdgeInsets.only(top: 8 ,bottom: 8,left: 25,right: 25) ,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5.2) ,borderSide: BorderSide(color: Colors.white)), child: Text("تحميل" , style: TextStyle(color: Colors.white , fontSize: 17 ), ))


          ,
            SizedBox(width: 50, height: 20,),


                  FlatButton(onPressed: ()=>
                      _launchURL("https://drive.google.com/file/d/0B9GL0dOekBwoejM5dkJlM2dPREU/view")

              , color: Colors.blue,padding: EdgeInsets.only(top: 8 ,bottom: 8,left: 25,right: 25) ,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5.2) ,borderSide: BorderSide(color: Colors.white)), child: Text("قراءة" , style: TextStyle(color: Colors.white , fontSize: 17 ), ))



          ],

        ) ,
       SizedBox(width: 10, height: 20,),

      ],)


      ,))));
  }

//  static var httpClient = new HttpClient();
//  Future<File> _downloadFile(String url, String filename) async {
//    var request = await httpClient.getUrl(Uri.parse(url));
//    var response = await request.close();
//    var bytes = await consolidateHttpClientResponseBytes(response);
//    String dir = (await getApplicationDocumentsDirectory()).path;
//    File file = new File('$dir/$filename');
//    await file.writeAsBytes(bytes);
//    return file;
//  }
//
//  Future<void> downlaode () async{
//    Dio dio = Dio();
//    try{
//      var dir = await getApplicationDocumentsDirectory();
//
//      await dio.download( "http://www.8gharb.com/wp-content/uploads/2017/08/22-9-208x300.jpg" , "${dir.path}/files/Download/img.jpg" , onProgress: (req , pr){
//        debugPrint(pr.toString() + dir.path
//
//
//
//        );
//      }  );
//    }
//    catch (e){
//      debugPrint(e);
//
//
//
//    }
//
//  }
  _launchURL(String urls) async {
    var url = urls;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


//  static var httpClient = new HttpClient();
//  Future<File> _downloadFile(String url, String filename) async {
//    var request = await httpClient.getUrl(Uri.parse(url));
//    var response = await request.close();
//    var bytes = await consolidateHttpClientResponseBytes(response);
//    String dir = (await getApplicationDocumentsDirectory()).path;
//    File file = new File('$dir/$filename');
//    await file.writeAsBytes(bytes);
//    return file;
//  }
}