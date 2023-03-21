import 'package:flutter/material.dart';

import 'VestiColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  Set<String> emailSet = {};
  int _formCount = 0;
  var _skillsList = <String>[];
  void _removeSkill(int index) {
    setState(() {
      _skillsList.removeAt(index);
    });
  }
  void _addSkill() {
    setState(() {
      _skillsList.add('');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
          child:
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(

                children: <Widget>[
                  const SizedBox(height: 19),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Staff List',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000),
                            fontSize: 22)) ,
                  ),

                  const SizedBox(height: 20),
                  ...List.generate(_formCount, (index) => form(index)),
                  buttonRow(),
                  const SizedBox(height: 10),

                ],
              ),
            ),
          )

      ),
    );
  }

  Widget form(int key) => Padding(
      padding: const EdgeInsets.only(bottom: 10.0),

      child:

      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('User',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (MyColors.blackColor),
                    fontSize: 22)) ,
          ),

          TextFormField(
            validator: (value){
              if (value!.isEmpty) {
                return "Please enter Full Name";
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1, color: (MyColors.vestimaincolor))
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: (MyColors.vestimaincolor), width: 1)
              ),
              filled: true,
              fillColor: (MyColors.fillColor),
              labelStyle: TextStyle(color: (MyColors.vestimaincolor), fontSize: 13),
              labelText: "Full Name",

            ),
            // onChanged: (val) => _onUpdate(key, val),
          ),
          const SizedBox(height: 15),
          TextFormField(

            validator: (value) {
              String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
              RegExp regExp = new RegExp(pattern);
              if (value!.isEmpty) {
                return 'Please enter your email address';
              } else if (emailSet.contains(value)) {
                return 'This email address is already in use';
              } else if(!regExp.hasMatch(value)){
                return 'Please enter a valid email address';
              }

              emailSet.add(value);
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1, color: (MyColors.vestimaincolor))
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: (MyColors.vestimaincolor), width: 1)
              ),
              filled: true,
              fillColor: (MyColors.fillColor),
              labelStyle: TextStyle(color: (MyColors.vestimaincolor), fontSize: 13),
              labelText: "Email Address",

            ),
            // onChanged: (val) => _onUpdate(key, val),

          ),
          const SizedBox(height: 15),
          TextFormField(
            validator: (value){
              if (value!.isEmpty) {
                return "Please enter Address";
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1, color: (MyColors.vestimaincolor))
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: (MyColors.vestimaincolor), width: 1)
              ),
              filled: true,
              fillColor: (MyColors.fillColor),
              labelStyle: TextStyle(color: (MyColors.vestimaincolor), fontSize: 13),
              labelText: "Address",

            ),
            // onChanged: (val) => _onUpdate(key, val),
          ),

          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _skillsList.length + 1,
              itemBuilder: (context, index) {
                if (index == _skillsList.length) {

                  return
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(width: 1, color: (MyColors.vestimaincolor))
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: (MyColors.vestimaincolor), width: 1)
                                      ),
                                      labelText: 'Skill ${index +
                                          1}',
                                      filled: true,
                                      fillColor: (MyColors.fillColor),
                                      labelStyle: TextStyle(color: (MyColors.vestimaincolor), fontSize: 13),
                                    ),
                                    onChanged: (value) =>
                                        setState(() =>
                                        _skillsList =
                                        value as List<String>),)
                              ),
                              const SizedBox(width: 5),
                              TextButton.icon(
                                onPressed: _addSkill,
                                icon: Icon(Icons.add),
                                label: Text("Add skill"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>((MyColors.fillColor)),
                                  foregroundColor: MaterialStateProperty.all<Color>(((MyColors.vestimaincolor))),
                                  textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 10)),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                      side: BorderSide(color: (MyColors.vestimaincolor)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              TextButton.icon(
                                onPressed: () => _removeSkill(index),
                                icon: Icon(Icons.remove),
                                label: Text("Remove skill"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(MyColors.skillremoveColor),
                                  foregroundColor: MaterialStateProperty.all<Color>(MyColors.blackColor),
                                  textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 10)),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                      side: BorderSide(color: (MyColors.skillremoveColor)),
                                    ),
                                  ),
                                ),
                              ),



                            ]

                        )
                      ],
                    );



                } else {
                  return

                    Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(width: 1, color: (MyColors.vestimaincolor))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: (MyColors.vestimaincolor), width: 1)
                                  ),
                                  labelText: 'Skill ${index +
                                      1}',
                                  filled: true,
                                  fillColor: (MyColors.fillColor),
                                  labelStyle: TextStyle(color: (MyColors.vestimaincolor), fontSize: 13),
                                ),
                                onChanged: (value) =>
                                    setState(() =>
                                    _skillsList =
                                    value as List<String>),)
                          ),
                          const SizedBox(height: 15),
                        ]);



                }
              }),

        ],
      )
  );
  Widget buttonRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      Row(
        children: [
          Visibility(
            visible: _formCount > 0,
            child:  ElevatedButton(onPressed: () {
              setState(() {
                _formCount--;
              });
            },

              child: Text('Remove User',
                style: TextStyle(color: (MyColors.vestimaincolor)),),
              style: ElevatedButton.styleFrom(
                  primary: (MyColors.whiteColor), //background color of button
                  side: BorderSide(width:1,color: (MyColors.vestimaincolor),), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(0)
                  ),
                  padding: EdgeInsets.only(left: 30, right: 30) //content padding inside button
              ),

            ),

          ),
          SizedBox(width: 5),
          ElevatedButton(onPressed: () {
            if (_formKey.currentState!.validate()) {
              setState(() => _formCount++);

            }

          },
              child: Text('Add Another User', style: TextStyle(color: (MyColors.whiteColor)),),
              style: ElevatedButton.styleFrom(
                  primary: (MyColors.vestimaincolor), //background color of button
                  side: BorderSide(width:1,color: (MyColors.vestimaincolor)), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(0)
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20) //content padding inside button
              )
          ),

        ],
      )
    ],
  );




}
