import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class weight extends StatefulWidget{
  @override
  State<weight> createState() => _weightState();
}

class _weightState extends State<weight> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='g';
    _convertMeasures='kg';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'microg' ,'mg' , 'g' , 'kg'  ,'lb'  ,'tonne'  ,'carat'
  ];
  final Map<String,int>measuresMap
  =
  {
    'microg':0 ,'mg':1 , 'g':2 , 'kg':3  ,'lb':4  ,'tonne':5  ,'carat':6

  };
  dynamic formulas ={
    '0':[1,0.001,0.000001,1E-9,2.2046E-9,1E-12,0.000005],
    '1':[1000,1,0.001,0.000001,0.000002,1E-9,0.005],
    '2':[1000000,1000,1,0.001,0.002205,0.000001,5],
    '3':[1000000000,1000000,1000,1,2.204623,0.001,5000],
    '4':[453592370,453592.37,453.59237,0.453592,1,0.000454,2267.96185],
    '5':[1.000E+12,1000000000,1000000,1000,2204.62262,1,5000000],
    '6':[200000,200,0.2,0.0002,0.000441,2E-7,1],

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
       title: Text('Weight',style:TextStyle(fontSize: 25),),
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