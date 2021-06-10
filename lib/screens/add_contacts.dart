import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  late TextEditingController _nameController, _numberController,_companyController,_descriptionController,_priceController,_unitController;
  String _typeSelected ='';

late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _companyController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _unitController = TextEditingController();

    _ref = FirebaseDatabase.instance.reference().child('Sellers');
  }


Widget _buildContactType(String title){

  return InkWell(

    child: Container(
      height: 40,
      width: 90,

      decoration: BoxDecoration(
        color: _typeSelected == title? Colors.blue : Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Center(child: Text(title, style: TextStyle(fontSize: 18,
      color: Colors.white),
    ),),),

    onTap: (){
      setState(() {
        _typeSelected = title;
      });
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Details'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Product Name',
                prefixIcon: Icon(
                  Icons.inventory,
                  size: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _companyController,
              decoration: InputDecoration(
                hintText: 'Enter Company Name',
                prefixIcon: Icon(
                  Icons.store,
                  size: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter Product Description',
                prefixIcon: Icon(
                  Icons.description,
                  size: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                hintText: 'Enter Price',
                prefixIcon: Icon(
                  Icons.local_atm,
                  size: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _unitController,
              decoration: InputDecoration(
                hintText: 'Enter Units',
                prefixIcon: Icon(
                  Icons.backup_table,
                  size: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Enter company Number',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
           SizedBox(height: 10,),
           Container(
             height: 40,
             child: ListView(

               scrollDirection: Axis.horizontal,
               children: [
                 _buildContactType('Seed'),
                 SizedBox(width: 10),
                 
                 _buildContactType('Fertilizer'),
                 SizedBox(width: 10),
                 _buildContactType('Machine'),
                 SizedBox(width: 10),
                 _buildContactType('Others'),
               ],
             ),
           ),
           SizedBox(height: 25,),
           Container(
             width: double.infinity,
             padding: EdgeInsets.symmetric(horizontal: 10),
             child: ElevatedButton(child: Text('Save Details',style: TextStyle(
               fontSize: 20,
               color: Colors.white,
               fontWeight: FontWeight.w600,

             ),),
             onPressed: (){
               saveContact();
             },

             //color: Theme.of(context).primaryColor,
             ),
           )

          ],
        ),
      ),
    );
  }
  void saveContact(){

    String name = _nameController.text;
    String number = _numberController.text;
    String company = _companyController.text;
    String description = _descriptionController.text;
    String price = _priceController.text;
    String unit = _unitController.text;

    Map<String,String> contact = {
      'name':name,
      'number': '+91 ' + number,
      'company': company,
      'description': description,
      'price':price,
      'unit':unit,
      'type': _typeSelected,
    };

    _ref.push().set(contact).then((value) {
      Navigator.pop(context);
    });


  }
}
