import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notustohtml/notustohtml.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class WritePost extends StatefulWidget {
  Function(String html)onFinish;
  Function()onCancel;
  String title;

  WritePost({
    this.title,
    this.onCancel,
    this.onFinish
  });

  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  FocusNode _focusNode=new FocusNode();
  ZefyrController _controller;

  NotusDocument _loadDocument() {
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  void initState() {
    _controller= new ZefyrController(_loadDocument());
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            widget.onCancel();
          },
          child: Icon(Icons.close,color: Colors.white,),
        ),
        actions: [
          InkWell(
            onTap: (){
              final converter = NotusHtmlCodec();
              String html = converter.encode(_controller.document.toDelta()); // HTML Output
              widget.onFinish(html);
            },
            child: Icon(Icons.send,color: Colors.white,),
          ),
          SizedBox(width: 5,)
        ],
        title: Text(widget.title),),
      body: Center(
        child: ZefyrScaffold(
          child: ZefyrEditor(
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
      ),
    );
  }
}
