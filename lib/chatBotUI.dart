import "package:flutter/material.dart";

class FactsMessage extends StatelessWidget {
  FactsMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> userMessage(context) {
  return <Widget>[
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(text, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(color: Colors.cyan[400], border: Border.all(width: 2.0, color: Colors.blue), borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(child: new Text(this.name[0])),
    ),
  ];
}
  List<Widget> botMessage(context) {
  return <Widget>[
    Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: CircleAvatar(child: Text('Ch', style: TextStyle(color: Colors.black)) ,backgroundColor: Colors.orange[400],),
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(text, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(color: Colors.orange, border: Border.all(width: 2.0, color: Colors.red[600]), borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    ),
  ];
}

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }  

}  