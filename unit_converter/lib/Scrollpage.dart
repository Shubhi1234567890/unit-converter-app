import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/angle.dart';
import 'package:unit_converter/area.dart';
import 'package:unit_converter/cooking.dart';
import 'package:unit_converter/data.dart';
import 'package:unit_converter/force.dart';
import 'package:unit_converter/length.dart';
import 'package:unit_converter/power.dart';
import 'package:unit_converter/speed.dart';
import 'package:unit_converter/temperature.dart';
import 'package:unit_converter/time.dart';
import 'package:unit_converter/volume.dart';
import 'package:unit_converter/weight.dart';
import 'package:unit_converter/work.dart';


class Scrollpage extends StatelessWidget{
  const Scrollpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('WELCOME',style:TextStyle(fontSize: 30,color: Colors.red,))),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListWheelScrollView(
                      itemExtent: 200,
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.grey,
                          child: Image.asset('assets/images/giphy.gif')
                        ),

                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Center(child: Text('Hi...',style:TextStyle(fontSize: 80,fontWeight: FontWeight.bold))),
                        ),

                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Text('Choose your field of interest :',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),

                          ),
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Length',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>length()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text('Area',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),

                                InkWell(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>area()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text('Weight',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),)),
                              Container(
                                width: 150,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>weight()));
                                },
                                  child: Icon(Icons.arrow_right,size: 50,))
                            ],
                          ),

                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text('Volume',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),)),
                              Container(
                                width: 150,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>volume()));
                                },
                                  child: Icon(Icons.arrow_right,size: 50,))
                            ],
                          ),

                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Temperature',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 100,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>temperature()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 40,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Time',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>time()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text('Data',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>data()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text('Cooking',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>cooking()));
                                  },

                                    child: Icon(Icons.arrow_right,size: 40,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Speed',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>speed()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Power',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>power()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Work',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>work()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Force',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>force()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purpleAccent,
                                Colors.blueAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Angle',style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 150,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>angle()));
                                  },
                                    child: Icon(Icons.arrow_right,size: 50,))
                              ],
                            ),
                          ),

                        ),


                      ],
                    ),
        ),


    );
  }

}