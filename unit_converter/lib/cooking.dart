import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cooking extends StatefulWidget{
  @override
  State<cooking> createState() => _cookingState();
}

class _cookingState extends State<cooking> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='ml(cc)';
    _convertMeasures='teaspoon';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'ml(cc)', 'teaspoon', 'tablespoon','cup(US)', 'cup(UK)' , 'cup(metric)'
  ];
  final Map<String,int>measuresMap
  =
  {
    'ml(cc)':0, 'teaspoon':1, 'tablespoon':2,'cup(US)':3, 'cup(UK)':4 , 'cup(metric)':5
  };
  dynamic formulas ={
    '0':[1,0.202884,0.067628,0.004227,0.003521,0.004],
    '1':[4.928922,1,0.333333,0.020833,0.017355,0.019716],
    '2':[14.786765,3,1,0.0625,0.052066,0.059147],
    '3':[23.588236,48,16,1,0.833057,0.946353],
    '4':[284,57.619095,19.206365,1.200398,1,1.136],
    '5':[250,50.721034,16.907011,1.056688,0.880282,1],
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
       title: Text('Cooking',style:TextStyle(fontSize: 25),),
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
             style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
         ],
       ),
     ),


   );
  }
}