import 'dart:convert';

import 'package:elmaktaba/Model/BooksModel.dart';
import 'package:elmaktaba/UI/DetailsActivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<BooksModel> fetchBooks(String  book) async {
  final response =
  await http.get('https://androidtesst.000webhostapp.com/api/search.php?book=${book}');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return BooksModel.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
class SearchPage extends StatefulWidget{
  String myController;
  SearchPage({Key key , @required this.myController}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage>{
  Future<BooksModel> booksmodel;

  @override
  void initState() {
    super.initState();
    booksmodel = fetchBooks(widget.myController) ;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 100) / 2;
    final double itemWidth = size.width / 2;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black), backgroundColor: Colors.white , centerTitle: true,title: Text(widget.myController , style:  TextStyle(fontWeight: FontWeight.bold , color: Colors.black , fontSize: 18),), elevation: 2,),
      body:Container(color: Colors.white,
          child: FutureBuilder<BooksModel>(
              future: booksmodel,
              builder: (context, snapshot)
              {
                if (snapshot.hasData) {
                  debugPrint(snapshot.data.booksL[0].book_image);

                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: List.generate(snapshot.data.booksL.length, (index) {
                        return Center(
                          child:
                          ListCustomCard(snapshot.data.booksL[index].book_writer,
                              snapshot.data.booksL[index].book_name,
                              snapshot.data.booksL[index].book_desc,
                              snapshot.data.booksL[index].book_image,
                              snapshot.data.booksL[index].book_r,
                              snapshot.data.booksL[index].book_d),


                        );

                      } ));

                } else if (snapshot.hasError) {
                  return Center(child: Text(" ${snapshot.error}عفوا تأكد من أتصال الانترنت "),);
                }
                return Center(child:CircularProgressIndicator() ,);

              }),

      ),);
  }

  Widget ListCustomCard(String writer , String book_name , String book_desc ,String image , String bookR , String bookD ) {
    return

      Container(
          child:

          InkWell(child:


          Card(
            margin: EdgeInsets.all(10),
            color:Colors.white,
            elevation: 2,

            child: Column(
              children: <Widget>[


                Image.network( image , height: 155, width: double.infinity ,fit: BoxFit.fill,),
                Container(
                    alignment: Alignment(0.7, 0),
                    child:
                    Padding(padding: EdgeInsets.only(top: 5) ,
                      child:
                      Text(book_name , textAlign: TextAlign.right, style: TextStyle(color: Colors.black , fontSize: 12 , fontWeight: FontWeight.bold),),

                    )



                ),
                Container(
                  alignment: Alignment(0.7, 0),



                  child:
                  Text("الكاتب : ${writer}" , textAlign: TextAlign.right, style: TextStyle(color: Colors.black , fontSize: 10),),
                ),
              ],
            ),

          ),
            onTap: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsActivity(image : image , writer : writer , bookname:book_name , book_desc :book_desc , bookD:bookD , bookR : bookR)),
            ),
          )
      );
  }

}
