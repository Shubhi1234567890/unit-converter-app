import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class time extends StatefulWidget{
  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='ms';
    _convertMeasures='sec';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
  'ms', 'sec', 'min','hr' , 'hh:mm:ss' ,  'day' , 'week' , 'month' ,'year'
  ];
  final Map<String,int>measuresMap
  =
  {
    'ms':0, 'sec':1, 'min':2,'hr':3 , 'day':4 , 'week':5, 'month':6 ,'year':7
  };
  dynamic formulas ={
  '0':[1,0.001,0.000017,2.7778E-7,1.1574E-8,1.6534E-9,3.8052E-10,3.171E-11],
  '1':[1000,1,0.016667,0.000278,0.000012,0.000002,3.8052E-7,3.171E-8],
  '2':[60000,60,1,0.016667,0.000694,0.000099,0.000023,0.000002],
  '3':[3600000,3600,60,1,0.041667,0.005952,0.00137,0.000114],
    '4':[86400000,86400,1440,24,1,0.142857,0.032877,0.00274],
  '5':[604800000,604800,10080,168,7,1,0.230137,0.019178],
  '6':[2628000000,2628000,43800,730,30.416667,4.345238,1,0.083333],
  '7':[3.154E+10,31536000,525600,8760,365,52.142857,12,1],

  };
  void convert (double value,String from,String to)
  {
    int? nFrom =measuresMap[from];
    int? nTo =measuresMap[to];
    var multi = formulas[nFrom.toString()][nTo];
    var result = value*multi;

    if(result==0)
      resultMessage ='Cannot performed this conversion';
    else{
      resultMessage='${userInput.toString()}${_startMeasures} are ${result.toString()}$_convertMeasures';
    }
    setState(() {
      resultMessage=resultMessage;
    });
  }
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Time',style:TextStyle(fontSize: 25),),
     ),
     backgroundColor: Colors.blueGrey,
     body:SingleChildScrollView(
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(vertical:40.0,horizontal:8.0),
             child: TextField(
               onChanged: (text){
                 var input = double.tryParse(text);
                 if(input !=null)
                   setState(() {
                     userInput = input;
                   });
               },
               style: TextStyle(
                 fontSize: 22,
                 color: Colors.black,
               ),
               decoration: InputDecoration(
                   filled: true,
                   fillColor: Colors.blueGrey,
                   hintText: 'Enter the value',
                   border: OutlineInputBorder(
                     borderSide: BorderSide(width: 7,color: Colors.black),
                     borderRadius: BorderRadius.circular(20),
                   )
               ),
             ),
           ),
           SizedBox(
             height: 10,
           ),
           Text('From',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
           Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
             decoration: BoxDecoration(
               color: Colors.black,
               borderRadius: BorderRadius.circular(20),

             ),
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: DropdownButton(
                 value: _startMeasures,
                 isExpanded: true,
                 dropdownColor: Colors.black,
                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.amber),
                 hint: Text('Choose a unit',style: TextStyle(color: Colors.amber,fontSize: 20),),

                 items: measures.map((String value) {
                   return DropdownMenuItem(value: value,
                     child: Text(value),);
                 }).toList(),
                 onChanged: (value){
                   setState(() {
                     _startMeasures=value!;

                   });
                 },
               ),
             ),
           ),
           SizedBox(
             height: 20,
           ),
           Text('To',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
           Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
             decoration: BoxDecoration(
               color: Colors.black,
               borderRadius: BorderRadius.circular(20),

             ),
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: DropdownButton(
                 value: _convertMeasures,
                 isExpanded: true,
                 dropdownColor: Colors.black,
                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.amber),
                 hint: Text('Choose a unit',style: TextStyle(color: Colors.amber,fontSize: 20),),

                 items: measures.map((String value) {
                   return DropdownMenuItem(value: value,
                     child: Text(value),);
                 }).toList(),
                 onChanged: (value){
                   setState(() {
                     _convertMeasures=value!;
                   });
                 },
               ),
             ),
           ),
           SizedBox(height: 20,),
           TextButton(
             onPressed: (){
               if(_startMeasures.isEmpty|| _convertMeasures.isEmpty || userInput==0)
                 return;
               else
                 convert(userInput, _startMeasures, _convertMeasures);

             },
             child: Container(
               alignment: AlignmentDirectional.center,
               width: 200,
               height: 70,
               decoration: BoxDecoration(
                 color: Colors.black,
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Text(
                 'convert',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.amber),
               ),
             ),
           ),
           SizedBox(height:20,),
           Text((resultMessage==null)?'':resultMessage,
             style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
         ],
       ),
     ),
   );
  }
}