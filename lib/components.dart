import 'package:flutter/material.dart';

Widget myTextFormField({
  @required TextEditingController controller,
  @required FormFieldValidator<String> validator,
  bool passwordVisible = false,
  TextInputType textInputType = TextInputType.text,
  @required String label,
  @required IconData prefixIcon,
  Widget suffixIcon
}) {
  return TextFormField(
    validator: validator,
    obscureText: passwordVisible,
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon),
  );
}


Widget tasksListView(){
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Title ${++index}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.archive,
                    color: Colors.blue,
                  )),
            ],
          ),
          Row(
            children: [
              Text(
                "Date : 22/11/2021",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Spacer(),
              Text(
                "Time 7:52 PM",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),

            ],
          ),

        ],
      ),
    ),
  );
}