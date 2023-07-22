import 'package:flutter/material.dart';

class power extends StatefulWidget{
  @override
  State<power> createState() => _powerState();
}

class _powerState extends State<power> {
  @override
  late double userInput;
  late String _startMeasures;
  late String _convertMeasures;
  late String resultMessage;

  void initState(){
    userInput = 0;
    _startMeasures='W';
    _convertMeasures='kW';
    resultMessage='result';

    super.initState();
  }
  final List<String> measures =
  [
    'W' , 'kW' , 'MW' , 'kcal/s', 'kcal/h' , 'HP' , 'PS' , 'BTU/H' , 'TR' , 'BHP' , 'dBm'
  ];
  final Map<String,int>measuresMap
  =
  {
    'W':0 , 'kW':1 , 'MW':2, 'kcal/s':3, 'kcal/h':4 , 'HP':5 , 'PS':6 , 'BTU/H':7, 'TR':8 , 'BHP':9 , 'dBm':10
  };
  dynamic formulas ={
    '0':[1,0.001,0.000001,0.000239,0.860421,0.001341,0.00136,3.412142,0.000285,0.000102,30],
    '1':[1000,1,0.001,0.239006,860.42065,1.341022,1.359619,3412.14163,0.284535,0.101931,60],
    '2':[1000000,1000,1,239.005736,860420.65,1341.02186,1359.61931,3412141.63,284.535493,101.931042,90],
    '3':[4184,4.184,0.004184,1,3600,5.610835,5.688647,14276.4006,1.190497,0.426479,66.215917],
    '4':[1.162222,0.001162,0.000001,0.000278,1,0.001559,0.00158,3.965667,0.000331,0.000118,30.652892],
    '5':[745.7,0.7457,0.000746,0.178227,641.615679,1,1.013868,2544.43402,0.212178,0.07601,58.725641],
    '6':[735.5,0.7355,0.000736,0.175789,632.839388,0.986322,1,2509.63017,0.209276,0.07497,58.665827],
    '7':[0.293071,0.000293,2.9307E-7,0.00007,0.252164,0.000393,0.000398,1,0.000083,0.00003,24.66973],
    '8':[3514.50003,3.5145,0.003515,0.839986,3023.9484,4.713021,4.778382,11991.9719,1,0.358237,65.458636],
    '9':[9810.55407,9.810554,0.009811,2.344779,8441.20331,13.156167,13.338619,33475,2.791451,1,69.916935],
    '10':[0.001259,0.000001,1.2589E-9,3.0089E-7,0.001083,0.000002,0.000002,0.004296,3.5821E-7,1.2832E-7,1],
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
        title: Text('Power',style:TextStyle(fontSize: 25),),
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