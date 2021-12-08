
import 'package:flutter/material.dart';

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