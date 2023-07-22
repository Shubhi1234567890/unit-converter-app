import 'package:flutter/material.dart';

class length extends StatefulWidget{
  @override
  State<length> createState() => _lengthState();
}

class _lengthState extends State<length> {
  @override

  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;


  void initState(){
    userInput = 0;
    _startMeasures='m';
    _convertMeasures='km';
    resultMessage='result';

    super.initState();
  }

  final List<String> measures =
  [
   'm',
   'km',
   'cm',
    'mm',
    'dm',
    'inch',
    'ft',
    'mile',
    'microm',
  ];



  final Map<String,int>measuresMap
  =
  {
    'm':0,
    'km':1,
    'cm':2,
    'mm':3,
    'dm':4,
    'inch':5,
    'ft':6,
    'mile':7,
    'microm':8,
  };

  dynamic formulas ={
    '0':[1,0.001,100,1000,10,39.370079,3.28084,0.000621,1000000],
    '1':[1000,1,100000,1000000,10000,39370.0787,3280.8399,0.621371,1000000000],
    '2':[0.01,0.00001,1,10,0.1,0.393701,0.032808,0.000006,10000],
    '3':[0.001,0.000001,0.1,1,0.01,0.3937,0.003281,6.2137E-7,1000],
    '4':[0.1,0.0001,10,100,1,3.937008,0.328084,0.000062,100000],
    '5':[0.0254,0.000025,2.54,25.4,0.254,1,0.083333,0.000016,25400],
    '6':[0.3048,0.000305,30.48,304.8,3.048,12,1,0.000189,304800],
    '7':[1609.344,1.609344,160934.4,1609344,16093.44,63360,5280,1,1609344000],
    '8':[0.000001,1E-9,0.0001,0.001,0.00001,0.000039,0.000003,6.2137E-10,1],

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
        title: Text('Length',style: TextStyle(fontSize: 25),)),
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