import 'package:AppUI/InformationHub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class HospitalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = Hospital_Data;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(child: Text(
                      post["name"],
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      post["Contact Info"],
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                    RaisedButton(child: Text("More Information"),onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ClinicInformation(post["name"],post["address"], post["Contact Info"], post["Opening Hours"], post["image"])));},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: Colors.cyan),
                  ],
                ),
                Image.asset("images/${post["image"]}", height: 120, width: 130,)
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    final double hotlineHeaderHeight = size.height * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          //elevation: 0,
          //backgroundColor: Colors.white,
          title: Text("InformationHub"),
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[

              const SizedBox(
                height: 10,
              ),

              Container(child: Text("Immediate Hotlines", style: TextStyle(fontSize: 20)), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(20.0))), padding: EdgeInsets.only(top: 7, bottom: 10, left: 20, right: 20),height: closeTopContainer?0:hotlineHeaderHeight,),

              const SizedBox(
                height: 5,
              ),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: categoriesScroller),
              )
              ,

              Container(child: Text("Hospitals and Clinics", style: TextStyle(fontSize: 20)), decoration: BoxDecoration(color: Colors.blue[400], borderRadius: BorderRadius.all(Radius.circular(20.0))), padding: EdgeInsets.only(top: 7, bottom: 10, left: 20, right: 20),),

              Expanded(
                  child: ListView.builder(
                    controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.topCenter,
                            child: Align(
                                //heightFactor: 0.7,
                                //alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Samaritans\nof\nSingapore",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1800-221-4444",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Institute\nOf\nMental Health",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "6389-2222",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Silver\nRibbon\nSingapore",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "6385-3714",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClinicInformation extends StatelessWidget{
  final String clinicName;
  final String clinicAddress;
  final String clinicContactInfo;
  final String clinicOpeninghours;
  final String clinicImage;

  ClinicInformation(this.clinicName, this.clinicAddress, this.clinicContactInfo, this.clinicOpeninghours, this.clinicImage);

  @override 
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(clinicName), centerTitle: true),
      body: Column(
       // mainAxisSize: MainAxisSize.max,
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(child: Image.asset("images/${clinicImage}", height: size.height*0.4 - 50, width: size.width, fit: BoxFit.cover), decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight:  Radius.circular(50))),), 
        SizedBox(height: 30),
        Container(child: Text("Address: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), padding: EdgeInsets.all(10), margin : EdgeInsets.only(top:10, left: 10, right: 10), decoration: BoxDecoration(color: Colors.amber ,borderRadius: BorderRadius.all(Radius.circular(20))),),  
        SizedBox(height: 1),
        Container(child: Text("${clinicAddress}", style: TextStyle(fontSize: 18)), padding: EdgeInsets.all(10)),
        SizedBox(height: 5),
        Container(child: Text("Opening Hours: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), padding: EdgeInsets.all(10), margin : EdgeInsets.only(top:10, left: 10, right: 10), decoration: BoxDecoration(color: Colors.red ,borderRadius: BorderRadius.all(Radius.circular(20))),), 
        SizedBox(height: 5),
        Container(child: Text("${clinicOpeninghours}", style: TextStyle(fontSize: 18)), padding: EdgeInsets.all(20)),
        SizedBox(height: 5),
        Container(child: Text("To Schedule An Appointment Call: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), padding: EdgeInsets.all(10), margin : EdgeInsets.only(top:10, left: 10, right: 10), decoration: BoxDecoration(color: Colors.greenAccent ,borderRadius: BorderRadius.all(Radius.circular(20))),),
        SizedBox(height: 5),
        Container(child: Text("${clinicContactInfo}", style: TextStyle(fontSize: 18)), padding: EdgeInsets.all(20)),
        ])
    );
  }
}