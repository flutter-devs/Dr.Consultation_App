import 'package:docs_app/Constants/constants.dart';
import 'package:docs_app/Constants/widget/custom_shape.dart';
import 'package:docs_app/models/treatment_slides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

enum VisibilityFlag {
  visible,
  invisible,
}

class DocsApp extends StatefulWidget {


// final Widget child;
// final Widget removedChild;

  @override
  _DocsAppState createState() => _DocsAppState();
}

class _DocsAppState extends State<DocsApp> {
  double _width;
  double _height;

  VisibilityFlag visibility = VisibilityFlag.invisible;

  double offset = 0.0;

  ScrollController scrollController = ScrollController();

  List<TreatmentsSlides> treatmentsSlides;

  @override
  void initState() {
    treatmentsSlides = Constants.getTreatmentsSlides();

    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset;
        if (_chnageAppbar) {
          visibility = VisibilityFlag.visible;
        } else {
          visibility = VisibilityFlag.invisible;
        }
      });
    });
    super.initState();
  }

  bool get _chnageAppbar {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics:ClampingScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                  color: Colors.white,
                  height: _height / 8,
                  width: _width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.menu,
                          color: Colors.green,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                )),
                            Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                    'Noida'
                                )),
                            Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 80.0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.green,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 4.0,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              //alignment: Alignment.topLeft,
                              height: _height / 11,
                              width: _width,
                              color: Colors.amber[50],
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: .0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      maxLines:1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign:TextAlign.start,
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Buy ',style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0,),),
                                          TextSpan(text: 'DocsApp ',style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0),),

                                          TextSpan(text: 'Gold ', style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.amber,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0)),


                                          TextSpan(
                                            text:'for 12 months!',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color:Colors.black,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0,),
                                          ),

                                        ],
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(right: 0.0),
                                      child: Text(
                                        'Get Unlimited free consults for whole family.',
                                        style: TextStyle(
                                            fontSize: 12.0, letterSpacing: 0.5),
                                        overflow:TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  left: 10.0,
                                  right: 5.0,
                                  bottom: .0),
                              height: _height / 22,
                              width: _width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.orange[200], Colors.amber],
                                ),
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.monetization_on),
                                  //SizedBox(width: 20.0,),


                                  RichText(
                                    maxLines:1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Save upto Rs 10,000',
                                          style: TextStyle(
                                              fontSize: 11.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),),
                                        TextSpan(text: 'Get Gold Now',
                                          style: TextStyle(
                                              fontSize: 11.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),),
                                      ],
                                    ),
                                  ),

                                  // SizedBox(width: 20.0,),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height:120.0,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 0.0),
                              child:Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.face,
                                    color: Colors.green,
                                    size: 95.0,
                                  ),
                                  Text(
                                    'Talk to Doctor',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child:Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.local_hospital,
                                    color: Colors.green,
                                    size: 75.0,
                                  ),
                                  Text(
                                    'Get Gold',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child:Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.green,
                                    size: 75.0,
                                  ),
                                  Text(
                                    'Medicines',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin:EdgeInsets.only(top:20.0),
                              child:Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.cancel,
                                    color: Colors.green,
                                    size: 75.0,
                                  ),
                                  Text(
                                    'Lab Tests',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: _width,
                        height: _height / 5.5,
                        // color: Colors.orange,
                        child: ListView.builder(
                            itemCount: treatmentsSlides.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildTreatmentSlides(
                                  treatmentsSlides[index]);
                            }),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: _width,
                        height: _height / 3.3,
                        child: Card(
                          elevation: 3.0,
                          shape: OutlineInputBorder(borderRadius: BorderRadius
                              .circular(10), borderSide: BorderSide.none),
                          color: Colors.orange[100],
                          child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: ClipPath(
                                      clipper: CustomShapeClipper(),
                                      child: Container(
                                        height: _height / 2,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.orange[200],
                                              Colors.orange[200]
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                  child: Column(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.5,
                                        child: ClipPath(
                                          clipper: CustomShapeClipper2(),
                                          child: Container(
                                            //height: _height / 3.5,
                                            height: _height / 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.brown[200],
                                                  Colors.orangeAccent
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  alignment: Alignment.bottomRight,
                                  // margin: EdgeInsets.only(left: 80.0),
                                  padding: EdgeInsets.only(
                                      top: 60.0, left: 95.0),
                                  height: _height /2,
                                  width: _width,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(250.0),
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(0.0),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          ClipPath(
                                            child: Container(
                                              height: _height / 2,
                                              width: _width,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                              child: Container(
                                                // padding: EdgeInsets.only(left:20.0),
                                                child: Image.asset(
                                                  'assets/images/docsapp_gold.jpeg',
                                                  fit: BoxFit.fill,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 20.0, left: 10.0, right: 90.0),
                                      child: Text(
                                        'Buy DocsApp Gold For Your Faimly',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.5,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.0),
                                        maxLines: 2,
                                      ),
                                    ),


                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: 10.0, right: 150.0),
                                      child: Text(
                                        'Unlimited Free Consults For 12 Month',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5),
                                        maxLines: 2,
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child:Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 0.0, top: 40.0, left: 20.0),
                                            // alignment: Alignment.bottomLeft,
                                            height: 30,
                                            width: _width / 6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  50.0),
                                              color: Colors.white,
                                            ),
                                            child:Center(
                                              child:Text(
                                                'Get Gold', style: TextStyle(
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Full Body Health Checkup',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13, letterSpacing: 1.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/below_40',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top:60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text('Below 40',
                                                  style: TextStyle(color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold),),
                                              ),

                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text('year', style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),),
                                              ),
                                            ],
                                          ) ,),

                                        Container(
                                          margin: EdgeInsets.only(top:20.0,left:10.0),
                                          alignment: Alignment.centerLeft,
                                          height:_height/40.0,
                                          width: _width/6.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.0),
// border: Border.all(width: 1.0, color: Colors.green),
                                            color: Colors.indigo,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Male', style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/above_40mens.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top:60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text('Above 40',
                                                  style: TextStyle(color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold),),
                                              ),

                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text('year', style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),),
                                              ),
                                            ],
                                          ) ,),
                                        Container(
                                          margin: EdgeInsets.only(top:20.0,left:10.0),
                                          alignment: Alignment.centerLeft,
                                          height:_height/40.0,
                                          width: _width/6.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.0),
// border: Border.all(width: 1.0, color: Colors.green),
                                            color: Colors.indigo,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Male', style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/below40_feamle.jpeg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top:60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text('Below 40',
                                                  style: TextStyle(color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold),),
                                              ),

                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text('year', style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),),
                                              ),
                                            ],
                                          ) ,),

                                        Container(
                                          margin: EdgeInsets.only(top:20.0,left:10.0),
                                          alignment: Alignment.centerLeft,
                                          height:_height/40.0,
                                          width: _width/6.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.0),
                                           color: Colors.redAccent,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Female', style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                          ),

                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/female_above40.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top:60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text('Above 40',
                                                  style: TextStyle(color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold),),
                                              ),

                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text('year', style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),),
                                              ),
                                            ],
                                          ) ,),

                                        Container(
                                          margin: EdgeInsets.only(top:20.0,left:10.0),
                                          alignment: Alignment.centerLeft,
                                          height:_height/40.0,
                                          width: _width/6.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.0),
// border: Border.all(width: 1.0, color: Colors.green),
                                            color: Colors.redAccent,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Female', style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors
                              .indigo[100]),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Text("See all Lab Test >",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: _width,
                        height: _height / 3.6,
                        child: Card(
                          elevation: 3.0,
                          shape: OutlineInputBorder(borderRadius: BorderRadius
                              .circular(10), borderSide: BorderSide.none),
                          color: Colors.blueAccent[100],
                          child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: ClipPath(
                                      clipper: CustomShapeClipper(),
                                      child: Container(
                                        height: _height / 2,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.lightBlueAccent[200],
                                              Colors.lightBlueAccent[100]
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                  child: Column(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.5,
                                        child: ClipPath(
                                          clipper: CustomShapeClipper2(),
                                          child: Container(
                                            //height: _height / 3.5,
                                            height: _height / 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.lightBlueAccent[200],
                                                  Colors.lightBlueAccent[100]
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Stack(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          // color: Colors.deepOrange,
                                          width: _width / 1.3,
                                          padding: EdgeInsets.only(
                                              top: 20.0, left: 10.0, right: 0.0),
                                          child: Text(
                                            'Upto 50% Discount on Lab Tests @Home',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.0),
                                            maxLines: 2,
                                          ),
                                        ),


                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Container(
                                              width: _width / 2,
                                              padding: EdgeInsets.only(
                                                top: 10.0, left: 10.0,),
                                              child: Text(
                                                'Free home sample pickup and Free report by doctor.',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 0.1,
                                                    height: 1.5), overflow:TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),




                                            Container(
                                              // color: Colors.orange,
                                              //height:,
                                              margin: EdgeInsets.only(
                                                  bottom: 0.0, left:10.0),
                                              child: CircleAvatar(
                                                radius:42,
                                                child:ClipOval(
                                                  child:Image.asset(
                                                    'assets/images/discount_lab.jpeg',width: _width,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),

                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 0.0,
                                            top: 0.0,
                                            left: 20.0,
                                            bottom: 10.0),
                                        width: _width / 6,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50.0),
// border: Border.all(width: 1.0, color: Colors.green),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ]
                          ),

                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Charts & Sessions',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13, letterSpacing: 1.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                      SizedBox(height: 5.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: _width / 2.3,
                            height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                            child: Card(
                              elevation: 2.0,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 0.0, left: 10.0, right: 0.0),
                                          child: Text(
                                            'Manage Weight',
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(3),
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(
                                                  90.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              ClipPath(
// clipper: CustomShapeClipper2(),
                                                child: Container(
// margin: EdgeInsets.only(left: 80.0),
// padding: EdgeInsets.all(10.0),
                                                  height: _height / 10,
                                                  width: _width / 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.pink),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0),
                                                    child: Icon(
                                                      Icons.event,
                                                      size: 45.0,
                                                      color: Colors.white,
                                                    ),),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),


                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: 15.0, right: 10.0,bottom:10.0),
                                      child: Text(
                                        'Lose or gain weight Get Diet Chart from nutritionist',
                                        style: TextStyle(color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.10),overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    height: 0.7,
                                    color: Colors.black26,
                                  ),

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height:_height/20.0,
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 15.0),
                                    child: Text(
                                      'Get Advice',
                                      style: TextStyle(color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(
// width:18.5,
                          ),
                          Container(
                            width: _width / 2.3,
                            height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                            child: Card(
                              elevation: 2.0,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 10.0,
                                              right: 0.0),
                                          child: Text(
                                            'Hair Issues',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(3),
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(
                                                  90.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              ClipPath(
// clipper: CustomShapeClipper2(),
                                                child: Container(
// margin: EdgeInsets.only(left: 80.0),
                                                  padding: EdgeInsets.only(
                                                      left: 20.0),
                                                  height: _height / 10,
                                                  width: _width / 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black),
                                                  child: Icon(
                                                    Icons.cake,
                                                    size: 45.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),

                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: 15.0, right: 10.0,bottom:10.0),
                                      child: Text(
                                        'Find out the bset treatment plan for your Hair Issues ',
                                        style: TextStyle(color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.10),overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    height: 0.7,
                                    color: Colors.black26,
                                  ),

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height:_height/20.0,
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 15.0),
                                    child: Text(
                                      'Get Advice',
                                      style: TextStyle(color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Self Tests Free',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13, letterSpacing: 1.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: _width / 2.3,
                              height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 0.0,
                                                left: 10.0,
                                                right: 0.0),
                                            child: Text(
                                              'Depression',
                                              style: TextStyle(
                                                  color: Colors.indigoAccent,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),

                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(
                                                    90.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                ClipPath(
// clipper: CustomShapeClipper2(),
                                                  child: Container(
// margin: EdgeInsets.only(left: 80.0),
// padding: EdgeInsets.all(10.0),
                                                    height: _height / 10,
                                                    width: _width / 5,
                                                    decoration: BoxDecoration(
                                                        color: Colors.indigo),
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20.0),
                                                      child: Icon(
                                                        Icons.tag_faces,
                                                        size: 45.0,
                                                        color: Colors.white,
                                                      ),),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),

                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0,bottom:10.0),
                                        child: Text(
                                          'this word renowned test checks your mental health.',
                                          style: TextStyle(color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.10),overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),

                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height:_height/20.0,
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: 15.0),
                                      child: Text(
                                        'Take Test',
                                        style: TextStyle(color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
// width:18.5,
                            ),
                            Container(
                              width: _width / 2.3,
                              height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 0.0,
                                                left: 15.0,
                                                right: 10.0),
                                            child: Text(
                                              'Thyroid Check',
                                              style: TextStyle(
                                                  color: Colors.brown,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(
                                                    90.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                ClipPath(
// clipper: CustomShapeClipper2(),
                                                  child: Container(
// margin: EdgeInsets.only(left: 80.0),
                                                    padding: EdgeInsets.only(
                                                        left: 20.0),
                                                    height: _height / 10,
                                                    width: _width / 5,
                                                    decoration: BoxDecoration(
                                                        color: Colors.brown),
                                                    child: Icon(
                                                      Icons.bug_report,
                                                      size: 45.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    ),

                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0,bottom:10.0),
                                        child: Text(
                                          'this word renowned test checks your mental health.',
                                          style: TextStyle(color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.10),overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),

                                    Container(
                                      height:_height/20.0,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          top: 0.0, left: 15.0),
                                      child: Text(
                                        'Take Test',
                                        style: TextStyle(color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: _width,
                        height: _height / 3.6,
                        child: Card(
                          elevation: 3.0,
                          shape: OutlineInputBorder(borderRadius: BorderRadius
                              .circular(10), borderSide: BorderSide.none),
                          color: Colors.green,
                          child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: ClipPath(
                                      clipper: CustomShapeClipper(),
                                      child: Container(
                                        height: _height / 2,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.green[600],
                                              Colors.green[500]
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                  child: Column(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.5,
                                        child: ClipPath(
                                          clipper: CustomShapeClipper2(),
                                          child: Container(
                                            //height: _height / 3.5,
                                            height: _height / 4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.green,
                                                  Colors.green
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                Stack(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          // color: Colors.deepOrange,
                                          width: _width / 1.3,
                                          padding: EdgeInsets.only(
                                              top: 20.0, left: 10.0, right: 0.0),
                                          child: Text(
                                            'Medicine Delivery now available in 24-48 hrs',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.0),
                                            maxLines: 2,
                                          ),
                                        ),


                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Container(
                                              width: _width / 2,
                                              padding: EdgeInsets.only(
                                                top: 10.0, left: 10.0,),
                                              child: Text(
                                                'in Mumbai.Pune.Bengaluru Hyedrabad.NCR.Kolkata & Chennai',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 0.1,
                                                    height: 1.5), overflow:TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),




                                            Container(
                                              // color: Colors.orange,
                                              //height:,
                                              margin: EdgeInsets.only(
                                                  bottom: 0.0, left:10.0),
                                              child: CircleAvatar(
                                                radius:42,
                                                child:ClipOval(
                                                  child:Image.asset(
                                                    'assets/images/medicine_delvery_boy.jpg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),

                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 0.0,
                                            top: 0.0,
                                            left: 20.0,
                                            bottom: 10.0),
                                        width: _width / 6,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50.0),
// border: Border.all(width: 1.0, color: Colors.green),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'E-books & Guides',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13, letterSpacing: 1.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: _width / 2.3,
                              height: _height / 2.3,
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[

                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: _height / 9,
                                          width: _width,
                                          color: Colors.pink[50],
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 20.0,
                                              left: 20.0,
                                              right: 0.0),
                                          //color: Colors.pink,
                                          height: _height / 7,
                                          width: _width / 5,
                                          child: Image.asset(
                                            'assets/images/booksImage.jpeg',
                                            fit: BoxFit.fill,),
                                        ),

                                      ],
                                    ),

                                    Expanded(
                                      child:Container(
                                        padding: EdgeInsets.only(
                                            top:10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'Erectile Dysfunction',
                                          style: TextStyle(color: Colors.indigo,
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.8),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child:Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'This ebook will help you understand the symptoms,causes',
                                          style: TextStyle(color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.8,
                                              fontSize: 12.0,
                                              height: 1.3),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),


                                    Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),

                                    Expanded(
                                      child:Container(
                                        // alignment: Alignment.centerLeft,
// height: _height,
                                        padding: EdgeInsets.only(
                                            top: 5.0, left: 15.0, right: 20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '₹49',
                                                style: TextStyle(fontSize: 10.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'PREVIEW',
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.0),
                                                  textAlign: TextAlign.center,
                                                ),

                                                Container(
                                                  alignment: Alignment
                                                      .bottomCenter,
                                                  padding: EdgeInsets.only(
                                                      bottom: 5.0),
                                                  child: Icon(Icons.shopping_cart,
                                                    size: 18.0,
                                                    color: Colors.green,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
// width:18.5,
                            ),
                            Container(
                              width: _width / 2.3,
                              height: _height / 2.3,
// margin: EdgeInsets.only(right: 5.0),
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[

                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: _height / 9,
                                          width: _width,
                                          color: Colors.cyan[50],
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 20.0,
                                              left: 20.0,
                                              right: 0.0),
                                          //color: Colors.pink,
                                          height: _height / 7,
                                          width: _width / 5,
                                          child: Image.asset(
                                            'assets/images/ebooks_img.jpeg',
                                            fit: BoxFit.fill,),
                                        ),

                                      ],
                                    ),

                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'Erectile Dysfunction',
                                          style: TextStyle(color: Colors.indigo,
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.8),
                                        ),
                                      ),
                                    ),


                                    Expanded(
                                      child:Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'Over 33% Indian men suffer from PE but dont know',
                                          style: TextStyle(color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.8,
                                              fontSize: 12,
                                              height: 1.3),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),

                                    Expanded(
                                      child:Container(
                                        // alignment: Alignment.centerLeft,
// height: _height,
                                        padding: EdgeInsets.only(
                                            top: 5.0, left: 15.0, right: 20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '₹49',
                                                style: TextStyle(fontSize: 10.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'PREVIEW',
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.0),
                                                  textAlign: TextAlign.center,
                                                ),

                                                Container(
                                                  alignment: Alignment
                                                      .bottomCenter,
                                                  padding: EdgeInsets.only(
                                                      bottom: 5.0),
                                                  child: Icon(Icons.shopping_cart,
                                                    size: 18.0,
                                                    color: Colors.green,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors
                              .indigo[100]),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Text("E-Books & Guides >",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: _width,
                        height: _height / 4,
// margin: EdgeInsets.only(right:5.0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/images/docs_app_Gold.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),


                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Doctors Blogs & Tips',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13, letterSpacing: 1.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(
                            left: 0.0, right: 0.0, top: 10.0),
// color: Colors.white,
                        height: _height/2,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),),
                                    child: Image.asset(
                                      'assets/images/mensday_int.jpg',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child:Container(
                                  padding: EdgeInsets.only(
                                      top:10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),

                              Expanded(
                                child:Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes'
                                        'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip, maxLines: 3,
                                  ),
                                ),

                              ),

                              ListTile(
                                leading:CircleAvatar(
                                  child:ClipOval(
                                    child:Image.asset(
                                      'assets/images/HealthProductImage.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),

                                title:Text('Daily Digest',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,),

                                subtitle: Text('Cuarted Health Tips',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10.0),
                                  textAlign: TextAlign.left,),


                                trailing:CircleAvatar(
                                  backgroundColor:Colors.white,
                                  child:ClipOval(
                                    child:Image.asset(
                                      'assets/images/whatsap.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(
                            left: 0.0, right: 0.0, top: 10.0),
// color: Colors.white,
                        height: _height / 2.0,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),),
                                    child: Image.asset(
                                      'assets/images/hair_los.jpg',
                                      fit: BoxFit.cover,

                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child:Container(
                                  padding: EdgeInsets.only(
                                      top:10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),

                              Expanded(
                                child:Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes'
                                        'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip, maxLines: 3,
                                  ),
                                ),

                              ),

                              ListTile(
                                leading:CircleAvatar(
                                  child:ClipOval(
                                    child:Image.asset(
                                      'assets/images/HealthProductImage.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),

                                title:Text('Daily Digest',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,),

                                subtitle: Text('Cuarted Health Tips',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10.0),
                                  textAlign: TextAlign.left,),


                                trailing:CircleAvatar(
                                  backgroundColor:Colors.white,
                                  child:ClipOval(
                                    child:Image.asset(
                                      'assets/images/whatsap.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors
                              .indigo[100]),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Text("Other Health Articles >",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          Visibility(
            visible: visibility == VisibilityFlag.visible &&
                visibility != VisibilityFlag.invisible,

            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                height: _height / 5,
                width: _width,
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 45.0, left: 20.0, right: 20.0, bottom: 5.0),
                  child: Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
// size:0,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Icon(
                                Icons.face,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                            SizedBox(height:7.0,),
                            Text(
                              'Talk to Doctor',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Icon(
                                Icons.local_hospital,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                            SizedBox(height:7.0,),
                            Text(
                              'Get Gold',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                            SizedBox(height:7.0,),
                            Text(
                              'Medicines',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                            SizedBox(height:7.0,),
                            Text(
                              'Lab Tests',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.green,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.green),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Colors.black26,
            ),
            title: Text(
              "Consults",
              style: TextStyle(color: Colors.black26),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.live_tv,
              color: Colors.black26,
            ),
            title: Text(
              "DocsApp TV",
              style: TextStyle(color: Colors.black26),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face,
              color: Colors.black26,
            ),
            title: Text(
              "Faimly",
              style: TextStyle(color: Colors.black26),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTreatmentSlides(TreatmentsSlides item) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 5.0),
      child: Card(
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 5.0),
                    child: Text(
                      item.title,
                      style: TextStyle(
                          color: Colors.green, fontSize: 10.0,
                          fontWeight: FontWeight.w700, letterSpacing: 1.0),
                      maxLines: 3,
                    ),
                  ),
                ),

                Container(
                  child:ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(90.0)
                    ),
                    child: Container(
                      height:_height/10.0,
                      width:_width/3.2,
                      child:Image.asset(item.imgUrl,fit: BoxFit.fill,),
                    ),
                  ),
                ),

              ],
            ),


            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 10.0, right: 10.0),
                    child: Text(
                      item.subTitle,
                      style: TextStyle(
                          color: Colors.indigo, fontSize: 10.0,
                          fontWeight: FontWeight.w700, letterSpacing: 0.5),
                      maxLines: 3,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 5.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 20,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(width: 1.0, color: Colors.green),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          item.buttonTitle, style: TextStyle(color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

