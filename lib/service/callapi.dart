import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../components/service/controlleur.dart';

import '../config/configapp.dart';
import '../model/usermodel.dart';


class API {

  static Controlleur c = Get.find();

  // static login(user,password) async {
  //   var url = "${Appconstant.urllocal}Login.php";
  //   print(url);
  //   var response = await http.post(Uri.parse(url),
  //       body: {
  //         "email":user.toString(),
  //         "password":password.toString(),
  //       });
  //   print(response.body);
  //   var data = jsonDecode(response.body);
  //   // print(data);
  //   print(data["data"][1][0]);
  //   if(data["data"][0]==false.toString()){
  //     print("echecs");
  //
  //   }else{
  //     print("ok");
  //     return data["data"][1][0];
  //   }
  //
  //
  //   // try {
  //   //   String jsonString = '{"key": "value"}'; // Remplacez ceci par votre chaîne JSON
  //
  //   //   print(jsonData);
  //   // } catch (e) {
  //   //   print('Erreur lors de la décodification du JSON : $e');
  //   // }
  //   // if(jsonData=="true"){
  //   // return jsonData;
  //   // }else{
  //   //   return jsonData;
  //   // }
  //
  //
  // }



  // static deleteuser(id) async {
  //
  //   var url = "${Appconstant.urllocal}deleteuser.php";
  //   var response = await http
  //       .post(Uri.parse(url), body: {
  //     'idUser': id,
  //   });
  //   c.usersearch.clear();
  //   c.getuser();
  //
  //
  // }
  // static deleteproduct(id) async {
  //
  //   var url = "${Appconstant.urllocal}deleteproduct.php";
  //   var response = await http
  //       .post(Uri.parse(url), body: {
  //     'idproduct': id,
  //   });
  //   if(response.statusCode==200){
  //     c.usersearch.clear();
  //     c.getuser();
  //     c.getproduct();
  //   }
  //
  //
  // }

  static getalluser() async {
    // getallarchive();
    var url = "${Appconstant.urllocal}viewalluser.php";
    print(url);
    var response = await http.get(Uri.parse(url),);
    print(response.body);
    var data = json.decode(response.body);
    if(data!=null){

      return data;
    }


  }
  static getallproduct() async {
    //  getallarchive();
    var url = "${Appconstant.urllocal}selectproduct.php";
    print(url);
    var response = await http.get(Uri.parse(url),);
    print(response.body);
    var data = json.decode(response.body);
    if(data!=null){

      return data;
    }


  }

  static getallarchive() async {
    var url = "${Appconstant.urllocal}allarchive.php";
    print(url);
    var response = await http.get(Uri.parse(url),);
    print(response.body);
    var data = json.decode(response.body);
    if(data!=null){
      print(data);
      return data;
    }


  }
  static getallalldomaine() async {
    var url = "${Appconstant.urllocal}alldomaine.php";
    print(url);
    var response = await http.get(Uri.parse(url),);
    print(response.body);
    var data = json.decode(response.body);
    if(data!=null){
      return data;
    }

  }
  static searchdata(name) async {
    var url = "${Appconstant.urllocal}seachuser.php";
    print(url);
    var response = await http.post(Uri.parse(url),
        body: {
          "nom":name.toString(),
        });
    print(response.body);
    var data = json.decode(response.body);
    if(data!=null){

      return data;
    }


  }

  static getfolderuser(id) async {
    var url = "${Appconstant.urllocal}viewfoderuser.php";
    print(url);
    var response = await http.post(Uri.parse(url),
        body: {
          "iduser":id.toString(),
        });
    print(response.body);
    var data = json.decode(response.body);
    if(data!=null){

      return data;
    }


  }

  static insertuser(name, prenom, email, sex, dat, lieu, taille, profession, phone, cni, _selectedFile,filename) async {

    var url = "${Appconstant.urllocal}insertuser.php";
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields["noma"]= filename;
    request.fields["nom"]= name;
    request.fields["prenom"]= prenom;
    request.fields["email"]= email;
    request.fields["Gender"]= sex;
    request.fields["date"]= dat;
    request.fields["lieu"]= lieu;
    request.fields["taille"]= taille;
    request.fields["profession"]= profession;
    request.fields["numerocni"]= cni;
    request.fields["phone"]= phone;
    request.files.add(await http.MultipartFile.fromBytes('image', _selectedFile,
        contentType: MediaType('application', 'json'), filename: filename));
    var responses = await request.send();
    var responseBody = await responses.stream.bytesToString();
    var data = jsonDecode(responseBody);
    print(data);

    if(data["data"][0]=="true"){
      return data["data"][0];
    }




    // request.send().then((response) {
    //
    //   if (response.statusCode == 200) {
    //     print("File uploaded successfully");
    //
    //
    //
    //
    //     // c.getallarchive();
    //     //
    //     // Get.back();
    //   } else {
    //     print('file upload failed');
    //   }
    // });

  }


  static insertproduct(nomproduct,quandtite,statut,price,categorie,_selectedFile,filename,context) async {


    var url = "${Appconstant.urllocal}insertproduct.php";
    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.fields["nomproduct"]= nomproduct;
    request.fields["quandtite"]= quandtite;
    request.fields["statut"]= "1";
    request.fields["price"]= "14";
    request.fields["categorie"]= categorie.toString();

    request.files.add(await http.MultipartFile.fromBytes('image', _selectedFile,
        contentType: MediaType('application', 'json'), filename: filename));
    var responses = await request.send();
    var responseBody = await responses.stream.bytesToString();
    print(responses.statusCode);

    if(responses.statusCode==200){
      var data = jsonDecode(responseBody);
      if(data["data"][0]=="true"){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'produit deja inserer',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );
        print("objet trouve");
        return data["data"][0];
      }else if(data["data"][0]!="true"){
        print("objet inserer");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'produit inserer',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );
        return data["data"][0];
      }
    }








    // request.send().then((response) {
    //
    //   if (response.statusCode == 200) {
    //     print("File uploaded successfully");
    //
    //
    //
    //
    //     // c.getallarchive();
    //     //
    //     // Get.back();
    //   } else {
    //     print('file upload failed');
    //   }
    // });

  }


  static insertdomaine(domainename) async {

    var url = "${Appconstant.urllocal}Insertdomaine.php";
    var response = await http.post(Uri.parse(url), body: {
      'domainename': domainename,
    });
    var data  = jsonDecode(response.body);

    if(data["data"][0]=="true"){

      return data["data"][0];
    }else if(data["data"][0]=="yes"){
      API.getallalldomaine();
      return data["data"][0];
    }
    print(data);
  }

  static uploadImage(_selectedFile, iduser, String filename,) async {
    print('start');
    print(iduser);
    print(filename);
    print('end');

    var url =Uri.parse("${Appconstant.urllocal}insertachive.php");

    var request = http.MultipartRequest("POST", url);
    request.fields["noma"]= filename;
    request.fields["iduser"]= iduser;
    request.fields["image"]= filename;
    request.files.add(await http.MultipartFile.fromBytes('image', _selectedFile,
        contentType: MediaType('application', 'json'), filename: filename));

    request.send().then((response) {
      if (response.statusCode == 200) {
        print("File uploaded successfully");
        // c.getallarchive();

        Get.back();
      } else {
        print('file upload failed');
      }
    });

  }



}