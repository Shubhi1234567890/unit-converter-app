import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class data extends StatefulWidget{
  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='Bit';
    _convertMeasures='Byte';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'Bit','Byte' ,'kB' , 'MB' , 'GB', 'KiB' , 'MiB', 'GiB', 'TiB' , 'PiB'

  ];
  final Map<String,int>measuresMap
  =
  {
  'Bit':0,'Byte':1 ,'kB':2 , 'MB':3 , 'GB':4, 'KiB':5 , 'MiB':6, 'GiB':7, 'TiB':8 , 'PiB':9

  };
  dynamic formulas ={
    '0':[1,0.125,0.000125,1.25E-7,1.25E-10,0.000122,1.1921E-7,1.1642E-10,1.1369E-13,1.1102E-16],
    '1':[8,1,0.001,0.0000001,1E-9,0.000977,9.5367E-7,9.3132E-10,9.0949E-13,8.8818E-16],
    '2':[8000,1000,1,0.001,0.000001,0.976562,0.000954,9.3132E-7,9.0949E-10,8.8818E-13],
    '3':[8000000,1000000,1000,1,0.001,976.5625,0.953674,0.000931,9.0949E-7,8.8818E-10],
    '4':[8000000000,1000000000,1000000,1000,1,976562.5,953.674316,0.931323,0.000909,8.8818E-7],
    '5':[8192,1024,1.024,0.0010124,0.000001,1,0.000977,9.5367E-7,9.3132E-10,9.0949E-13],
    '6':[8388608,1048576,1048.576,1.048576,0.001049,1024,1,0.000977,9.5367E-7,9.3132E-10],
    '7':[8589934592,1073741824,1073741.82,1073.74182,1.073742,1048576,1024,1,0.000977,9.5367E-7],
    '8':[8.796E+12,1.100E+12,1099511628,1099511.63,1099.51163,1073741824,1048576,1024,1,0.000977],
    '9':[9.007E+15,1.126E+15,1.126E+12,1125899907,1125899.91,1.100E+12,1073741824,1048576,1024,1],

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
        title: Text('Data',style:TextStyle(fontSize: 25),),
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