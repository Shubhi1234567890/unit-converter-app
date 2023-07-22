import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class volume extends StatefulWidget{
  @override
  State<volume> createState() => _volumeState();
}

class _volumeState extends State<volume> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='ml(cc)';
    _convertMeasures='mm^3';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
  'ml(cc)', 'cl' ,  'dl' , 'L' , 'mm^3' , 'cm^3' , 'dm^3' , 'm^3' , 'in^3' , 'ft^3' , 'yd^3'
  ];
  final Map<String,int>measuresMap
  =
  {
    'ml(cc)':0, 'cl':1 ,  'dl':2 , 'L':3 , 'mm^3':4 , 'cm^3':5 , 'dm^3':6 , 'm^3':7 , 'in^3':8 , 'ft^3':9 , 'yd^3':10
};
  dynamic formulas ={

    '0':[1,0.1,0.01,0.001,1000,1,0.001,0.000001,0.061024,0.000035,0.000001],
    '1':[10,1,0.1,0.01,10000,10,0.01,0.00001,0.610237,0.000353,0.000013],
    '2':[100,10,1,0.1,100000,100,0.1,0.0001,6.102374,0.003531,0.000131],
    '3':[1000,100,10,1,1000000,1000,1,0.001,61.023744,0.035315,0.001308],
    '4':[0.001,0.0001,0.00001,0.000001,1,0.001,0.000001,1E-9,0.000061,3.5315E-8,1.308E-9],
    '5':[1,0.1,0.01,0.001,1000,1,0.001,0.000001,0.061024,0.000035,0.000001],
    '6':[1000,100,10,1,1000000,1000,1,0.001,61.023744,0.035315,0.001308],
    '7':[1000000,100000,10000,1000,1000000000,1000000,1000,1,61023.7441,35.314667,1.307951],
    '8':[16.387064,1.638706,0.163871,0.016387,16387.064,16.387064,0.016387,0.000016,1,0.000579,0.000021],
    '9':[28316.8466,2831.68466,283.168466,28.316847,28316846.6,28316.8466,28.316847,0.028317,1728,1,0.037037],
    '10':[764554.858,76455.4858,7645.54858,764.554858,764554858,764554.858,764.554858,0.764555,46656,27,1],

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
        title: Text('Volume',style:TextStyle(fontSize: 25),),
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