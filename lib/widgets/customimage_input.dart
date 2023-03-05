import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {

  final String label;
  final TextEditingController imgController;
  const CustomImageInput(this.label,this.imgController,{super.key});

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  // ignore: prefer_typing_uninitialized_variables
  var image;
  @override
  Widget build(BuildContext context) {
    return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                  alignment: Alignment.center,
                    width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: image!=null && image.isNotEmpty ? Image.network(image,fit: BoxFit.cover,width: 100,height: 100,)
                  : const Text('Enter picture')
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: widget.imgController,
                        onSubmitted: (value) {
                          setState(() {
                            image = value;
                          });
                        },
                        decoration:  InputDecoration(
                          label: Padding(
                            padding: const EdgeInsets.only(left:25,bottom:35.0),
                            child: Text(widget.label),
                          ),
                        ),
                      ),
                    ))
                ],
              );
  }
}