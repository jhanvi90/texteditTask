import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

class textEdit extends StatefulWidget {

  @override
  _nnState createState() => _nnState();
}

class _nnState extends State<textEdit> {
  var caughtColor;
  String _text="Sample Dataa";
  bool isEditDone=true;

  TextStyle _textStyle = TextStyle();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Image.network('https://images.pexels.com/photos/235986/pexels-photo-235986.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              isEditDone? TextEditor(
                  text: _text,
                  textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),
                  fonts:[
                    'Cabin',
                    'Bayon',
                    'GrandHotel',
                  ], onEditCompleted: (style,align,text){
                setState(() {
                  _textStyle=style;
                  align=TextAlign.center;
                  _text=text;
                });
                print(_text);
                setState(() {
                  isEditDone=false;
                });
              }):DragText(Offset(0.0, 0.0), _text,_textStyle),

            ],
          ),
        ),
      ),
    );
  }
}

class DragText extends StatefulWidget {
  final Offset initPos;
  final String label;
  final TextStyle _textStyle;
  DragText(this.initPos, this.label,this._textStyle);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragText> {
  Offset position = Offset(10.0, 10.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(

          child: Container(

            child: Center(
              child: Text(
                  widget.label,
                  style: widget._textStyle
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(

            child: Center(
              child: Text(
                  widget.label,
                  style:widget._textStyle
              ),
            ),
          ),
        ));
  }

}

