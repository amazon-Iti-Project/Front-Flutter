import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore    
import 'package:path/path.dart' as Path;  

class FirebaseService {

    Future uploadFile(File img) async {    
      //1- create reference and put file on it (local reference)
   StorageReference storageReference = FirebaseStorage.instance.ref()
          .child('images/${Path.basename(img.path)}}');  

   // here we start to upload  our reference
   StorageUploadTask uploadTask = storageReference.putFile(img); 
   await uploadTask.onComplete;    
   print('File Uploaded');    
   return storageReference.getDownloadURL(); 
 }
}