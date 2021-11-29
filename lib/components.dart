import 'package:flutter/material.dart';

Widget myTextFormField({
  @required TextEditingController controller,
  @required FormFieldValidator<String> validator,
  bool passwordVisible = false,
  TextInputType textInputType = TextInputType.text,
  @required String label,
  @required IconData prefixIcon,
  Widget suffixIcon,
  GestureTapCallback onTap,
}) {
  return TextFormField(
    onTap: onTap,
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

Widget tasksListView(List<Map<dynamic, dynamic>> list){
  return ListView.builder(
    itemCount: list.length,
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
                  "${list[index]['title']}",
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
                "Date : ${list[index]['date']}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Spacer(),
              Text(
                "Time ${list[index]['time']}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),

            ],
          ),

        ],
      ),
    ),
  );
}