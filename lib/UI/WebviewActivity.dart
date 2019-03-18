import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebviewActivity extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   WebviewScaffold(
        url:"https://drive.google.com/file/d/0B9GL0dOekBwoejM5dkJlM2dPREU/view",
       hidden: true,

       initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Waiting.....' , ),
        ),
      ),

    );
}}