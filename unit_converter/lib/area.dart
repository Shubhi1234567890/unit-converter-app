import 'package:flutter/material.dart';

class area extends StatefulWidget{
  @override
  State<area> createState() => _areaState();
}

class _areaState extends State<area> {
  @override

  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='m^2';
    _convertMeasures='km^2';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'm^2',
    'km^2',
    'cm^2',
    'mm^2',
    'dm^2',
    'inch^2',
    'ft^2',
    'acre',
    'yd^2',
  ];
  final Map<String,int>measuresMap
  =
  {
    'm^2':0,
    'km^2':1,
    'cm^2':2,
    'mm^2':3,
    'dm^2':4,
    'inch^2':5,
    'ft^2':6,
    'acre':7,
    'yd^2':8,
  };
  dynamic formulas ={
    '0':[1,0.000001,10000,1000000,100,1550.0031,10.76391,0.000247,1.19599],
    '1':[1000000,1,1.000E+10,1.000E+12,100000000,1550003100,10763910.4,247.105381,1195990.05],
    '2':[0.0001,1E-8,1,100,0.001,0.155,0.001076,2.4711E-8,0.00012],
    '3':[0.000001,1E-12,0.01,1,0.0001,0.00155,0.000011,2.4711E-10,0.000001],
    '4':[0.01,1E-8,100,10000,1,15.500031,0.107639,0.000002,0.01196],
    '5':[0.000645,6.4516E-10,6.4516,645.16,0.064516,1,0.006944,1.5942E-7,0.000772],
    '6':[0.092903,9.2903E-8,929.0304,92903.04,9.290304,144,1,0.000023,0.111111],
    '7':[4046.85642,0.004047,40468564.2,4046856422,404658.642,6272640,43560,1,4840],
    '8':[0.836127,8.3613E-7,8361.2736,836127.36,83.612736,1296,9,0.000207,1],
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
        title: Text('Area',style:TextStyle(fontSize: 25),),
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