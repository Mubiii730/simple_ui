import 'package:flutter/material.dart';



class VisualScriptEditor extends StatefulWidget {
  @override
  _VisualScriptEditorState createState() => _VisualScriptEditorState();
}

class _VisualScriptEditorState extends State<VisualScriptEditor> {
  List<Offset> nodes = [];

  void addNode(Offset position) {
    setState(() {
      nodes.add(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) => addNode(details.localPosition),
      child: CustomPaint(
        size: Size.infinite,
        painter: NodePainter(nodes),
      ),
    );
  }
}

class NodePainter extends CustomPainter {
  const NodePainter(this.nodes);

  final List<Offset> nodes;

  

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (var position in nodes) {
      canvas.drawCircle(position, 20, paint);
    }
  }

  @override
  bool shouldRepaint(NodePainter oldDelegate) => true;
}
