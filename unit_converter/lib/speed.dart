import 'package:flutter/material.dart';

class speed extends StatefulWidget{
  @override
  State<speed> createState() => _speedState();
}

class _speedState extends State<speed> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='m/s';
    _convertMeasures='km/s';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'm/s' , 'ft/s' , 'km/s', 'm/min', 'ft/min' , 'km/min' , 'km/h' , 'mph'
  ];
  final Map<String,int>measuresMap
  =
  {
    'm/s':0 , 'ft/s':1 , 'km/s':2, 'm/min':3, 'ft/min':4 , 'km/min':5 , 'km/h':6 , 'mph':7
  };
  dynamic formulas ={
    '0':[1,3.28084,60,196.850394,0.06,3.6,2.236936,1.943844,0.002941,1,16.666667,26.8224],
    '1':[0.3048,1,0.000305,18.288,60,0.018288,1.09728,0.681818,0.592484,0.000896,0,54.680665,88],
    '2':[1000,3280.8399,1,60000,196850.394,60,3600,2236.93629,2.941176,12,0.016667,0.026822],
    '3':[0.016667,0.054681,0.000017,1,3.28084,0.001,0.06,0.037282,0.032397,0.000049,0,1000,1609.344],
    '4':[0.00508,0.016667,0.000005,0.3048,1,0.000305,0.018288,0.011364],
    '5':[16.666667,54.680665,0.016667,1000,3280.8399,1,60,37.282272,32.397408,0.04902,7,1,1.609344],
    '6':[0.277778,0.911344,0.000278,16.666667,54.680665,0.016667,1,0.621371,0.539957,0.000817,0,60,96.56064],
    '7':[0.44704,1.466667,0.000447,26.8224,88,0.026822,1.609344,1,0.868976,0.001315,0,37.282272,60],
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
        title: Text('Speed',style:TextStyle(fontSize: 25),),
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