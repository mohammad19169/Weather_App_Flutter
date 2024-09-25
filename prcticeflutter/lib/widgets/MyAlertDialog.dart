import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Alert Dialog Box',
            style: TextStyle(color: Colors.white70, fontSize: 30),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:
            ElevatedButton( onPressed:() {_showdialog(context);}, child: Text('Show Alert Dialog!',style: TextStyle(color: Colors.amber),)
      ,style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        )
      ),),

      ),
    );
  }
}
Future<void> _showdialog(BuildContext context)async{
  return showDialog(context: context, builder: (BuildContext context){
return AlertDialog(
  
  content: SingleChildScrollView(
    child: ListBody(
      children: [
        Text('Do you want to exit?')
      ],
    ),
  ),
  title: Text('This is Alert'),
  actions: [
    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok')),
    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
  ],
);
  });
}