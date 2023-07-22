import 'package:flutter/material.dart';

class work extends StatefulWidget{
  @override
  State<work> createState() => _workState();
}

class _workState extends State<work> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='J';
    _convertMeasures='kJ';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'J', 'kJ' ,'cal' ,'kcal', 'kW-h'

  ];
  final Map<String,int>measuresMap
  =
  {
    'J':0, 'kJ':1 ,'cal':2 ,'kcal':3, 'kW-h':4

  };
  dynamic formulas ={
    '0':[1,0.001,0.239006,0.000239,2.7778E-7],
    '1':[1000,1,239.005736,0.239006,0.000278],
    '2':[4.184,0.004184,1,0.001,0.000001],
    '3':[4184,4.184,1000,1,0.001162],
    '4':[3600000,3600,860420.65,860.42065,1],

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
        title: Text('Work',style:TextStyle(fontSize: 25),),
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