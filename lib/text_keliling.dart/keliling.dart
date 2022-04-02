import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/keliling_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController keliling1 = TextEditingController();
  TextEditingController keliling2 = TextEditingController();
  TextEditingController keliling3 = TextEditingController();

  bool? checksisi1;
  bool? checksisi2;
  bool? checksisi3;
  bool? ifberhasil;
  bool? buttonvalid;

  int finalhasil=0;
  String sisi = '';

  @override
  void initState() {
    checksisi1 = false;
    checksisi2 = false;
    checksisi3 = false;
    buttonvalid=true;
    ifberhasil=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Masukkan Ketiga sisi'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Keliling(
                    BoxSegitiga: keliling1,
                    conditionItems: checksisi1,
                  ),
                  Keliling(
                    BoxSegitiga: keliling2,
                    conditionItems: checksisi2,
                  ),
                  Keliling(
                    BoxSegitiga: keliling3,
                    conditionItems: checksisi3,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 80,
                child: ElevatedButton(onPressed: () {
                  if(keliling1.text== keliling2.text && keliling3.text== keliling2.text){
                    setState(() {
                      checksisi1=false;
                      checksisi2=false;
                      checksisi3=false;
                      buttonvalid=true;
                      
                    });
                    int hasil = int.parse(keliling1.text) * int.parse(keliling2.text) * int.parse(keliling3.text);
                    sisi = keliling1.text;
                    setState(() {
                      finalhasil= hasil;
                      ifberhasil=true;
                      keliling1.clear();
                      keliling2.clear();
                      keliling3.clear();
                      print('Hasil $finalhasil');
                    });
                  }
                  else if (
                    keliling1.text == keliling2.text
                  ){
                    setState(() {
                        checksisi1=false;
                        checksisi2=false;
                        checksisi3=true;
                        buttonvalid=false;
                        ifberhasil=false;
                        print('Kolom Ke 3 Tidak Sama');
                    });
                  }
                  else if (
                    keliling1.text == keliling3.text
                  ){
                    setState(() {
                      checksisi1=false;
                      checksisi3=false;
                      checksisi2=true;
                      ifberhasil=false;
                      buttonvalid=false;
                      print('Kolom Ke 2 Tidak Sama');
                    });
                  }
                  else if (
                    keliling2.text== keliling3.text
                  ){
                    setState(() {
                      checksisi2=false;
                      checksisi3=false;
                      checksisi1=true;
                      ifberhasil=false;
                      buttonvalid=false;
                      print('Kolom Ke 1 Tidak Sama');
                    });
                  }
                }, child: buttonvalid== true? Text('Hitung'): Text('Gacha Againn')),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: ifberhasil==true?
                Text(
                  'Hasil: $finalhasil cm',
                ): null
                
              ),
           
            ],
          )),
    );
  }
}
