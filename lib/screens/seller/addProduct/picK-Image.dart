import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/services/firebaseService.dart';

class PhotoPicker extends StatefulWidget {
  Function onPickImage;
  PhotoPicker({this.onPickImage});
  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File _image;
  String _uploadedFileURL;
  final picker = ImagePicker(); 
  FirebaseService fbServ = FirebaseService();
  @override
  void initState(){
    super.initState();
    
  }

  void uploadImageAndUpdateView(File img){
fbServ.uploadFile(img).then((fileURL) {    
     setState(() {    
       _uploadedFileURL = fileURL; 
       print("imgUrl: $fileURL");
       widget.onPickImage(_uploadedFileURL);   
     });
   });  
  }
  _imgFromCamera() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera, imageQuality: 50);
        _image = File(pickedFile.path);
        uploadImageAndUpdateView(_image);
  }

  Future _imgFromGallery() async {
   final pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
        _image = File(pickedFile.path);
        uploadImageAndUpdateView(_image);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return 
       Center(
         child: GestureDetector(
           onTap: () {
             _showPicker(context);
           },
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: CircleAvatar(
               radius: 50,
               backgroundColor: Color(0xffFDCF09),
               child: _uploadedFileURL != null
                   ? ClipRRect(
                       borderRadius: BorderRadius.circular(45),
                       child: Image.network(
                         _uploadedFileURL,
                         width: 90,
                         height: 90,
                         fit: BoxFit.fitHeight,
                       ),
                     )
                   : Container(
                       decoration: BoxDecoration(
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(45)),
                       width: 90,
                       height: 90,
                       child: Icon(
                         Icons.camera_alt,
                         color: Colors.grey[800],
                       ),
                     ),
             ),
           ),
         ),
       );
  }
}


 
