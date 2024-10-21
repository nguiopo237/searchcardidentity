import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:searchcardidentity/components/service/controlleur.dart';

import 'dart:typed_data';
import 'dart:html' as html;

import '../../components/colorapp.dart';
import '../../components/generated/assets.dart';
import '../../components/style/text_ibm_plex_sans.dart';
import '../../service/callapi.dart';

class Registerprofile extends StatefulWidget {
  Registerprofile({Key? key}) : super(key: key);

  @override
  State<Registerprofile> createState() => _LoginState();
}

class _LoginState extends State<Registerprofile> {
  DateTime date = DateTime.now();

  getdaialog() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(16),
      titlePadding: EdgeInsets.all(8.0),
      title: "Formulaire d'enregistrement de domaine",
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: domain,
              decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "Entrez un domaine",
                  prefixIcon: Icon(Icons.domain_add),
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrez le domaine';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.back();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  // pickupdate(BuildContext context) async {
  //   final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //       context: context,
  //       initialDate: initialDate,
  //       firstDate: DateTime(DateTime.now().year - 100),
  //       lastDate: DateTime(DateTime.now().year + 5));
  //   if (newDate != null) {
  //     String formatDate = DateFormat("dd-MM-yyyy").format(newDate);
  //     print("selected");
  //     setState(() {
  //       datecontrol.text = formatDate.toString();
  //     });
  //   } else {
  //     print("not selected");
  //   }
  // }

  // Sendmail() async {
  //   // Note that using a username and password for gmail only works if
  //   // you have two-factor authentication enabled and created an App password.
  //   // Search for "gmail app password 2fa"
  //   // The alternative is to use oauth.
  //   String username = 'camillenguiopo@gmail.com';
  //   String password = 'slkmygzhsnkrnodp';
  //
  //   final smtpServer = gmail(username, password);
  //   // Use the SmtpServer class to configure an SMTP server:
  //   // final smtpServer = SmtpServer('smtp.domain.com');
  //   // See the named arguments of SmtpServer for further configuration
  //   // options.
  //
  //   // Create our message.
  //   final message = Message()
  //     ..from = Address(username, 'OptiEvent 2.0')
  //     ..recipients.add(email.text.toString())
  //     // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //     // ..bccRecipients.add(Address('bccAddress@example.com'))
  //     ..subject = 'OBTS Subscription Confirmation  ${DateTime.now()}'
  //     ..text = 'This is the plain text.\nThis is line 2 of the text part.'
  //     ..html = "<h1>Confirmation Of Subscribe to OptiEvent 2.0</h1>\n"
  //         "</p><h3> Your registration has been successfully completed. Please click on the link to confirm your suscribe </h3>\n</p>"
  //         "<a href='www.google.fr'>click me for valide</a>";
  //
  //   try {
  //     final sendReport = await send(message, smtpServer);
  //   } on MailerException catch (e) {
  //     for (var p in e.problems) {}
  //   }
  // }

  TextEditingController name = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController taille = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController dat = TextEditingController();
  TextEditingController datedebut = TextEditingController();
  TextEditingController lieu = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cni = TextEditingController();
  TextEditingController Echelons = TextEditingController();
  TextEditingController situation = TextEditingController();
  TextEditingController Fonction = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  TextEditingController domain = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyall = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyall1 = GlobalKey<FormState>();
  List<int>? _selectedFile;
  String filename = "";
  bool loading = false;
  bool obscureText = true;

  TextEditingController password = TextEditingController();
  TextEditingController matricule = TextEditingController();
  Controlleur c = Get.find();
  List<DateTime?> _dates = [];
  var valdrop;
  var valdropD;
  var valdrops;
  var sex;
  var domaine;

  bool Valuescheck1 = false;
  int index = 0;

  late File value;

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];

      filename = file.name;

      final reader = html.FileReader();
      Uint8List? _bytesData;

      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesData =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          _selectedFile = _bytesData;
        });
      });

      print("object");

      reader.readAsDataUrl(file);
    });
  }

  inseruser() async {
    var data = await API.insertuser(
        name.text,
        prenom.text,
        email.text,
        sex,
        dat.text,
        lieu.text,
        taille.text,
        profession.text,
        phone.text,
        cni.text,

        _selectedFile,
        filename);
    if (data != null) {
      // Get.to(HomeView());
      if (data == "true") {
        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Utilisateur deja Enregistrer',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        );

        // modal();
      }
    }

    // modal();
  }

  // getpassword() {
  //   c.domaineList.clear();
  //   c.getdomaine();
  //   final code = OTP.generateTOTPCodeString(
  //       'JBSWY3DPEHPK3PXP', date.millisecondsSinceEpoch,
  //       algorithm: Algorithm.SHA1, isGoogle: true);
  //   password.text = code.toString();
  //   getmatricule();
  //   print(code);
  // }

  // getmatricule() {
  //   final code7 = OTP.generateTOTPCodeString(
  //       length: 7, 'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
  //   matricule.text = code7.toString();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sex = "Masculin";
  }

  String imageback = Assets.imagesLogom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/baground.jpg"))),
      child: Center(
        child: Container(
          height: Get.height,
          width: double.infinity,
          // width: Responsive.isDesktop(context)
          //     ? Get.width / 2
          //     : Get.width / 1,
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Stack(
              children: [
                // ImageFiltered(
                //   imageFilter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                // ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      child: Form(
                        child: SingleChildScrollView(
                          child: IndexedStack(
                            index: index,
                            children: [
                              Container(
                                child: Form(
                                  key: formKeyall,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        height: 20.h,
                                        width: 20.w,
                                        alignment: Alignment.bottomRight,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(imageback))),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.upload),
                                        ),
                                      ),

                                      IBMPlexSans(
                                        text: "Enregistrement d'un utilisateur",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: name,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "Nom",
                                                  prefixIcon:
                                                      Icon(Icons.person),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              readOnly: false,
                                              controller: prenom,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "Prenom",
                                                  prefixIcon:
                                                      Icon(Icons.person),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return ' Email vide';
                                                }
                                                return null;
                                              },
                                              controller: email,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "Email",
                                                  prefixIcon:
                                                      Icon(Icons.mail_outlined),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              hint: IBMPlexSans(
                                                text: 'Choix du Genre',
                                              ),
                                              underline: SizedBox(),
                                              items: [
                                                DropdownMenuItem(
                                                  child: IBMPlexSans(
                                                    text: 'Masculin',
                                                  ),
                                                  value: "Masculin",
                                                ),
                                                DropdownMenuItem(
                                                  child: IBMPlexSans(
                                                    text: 'Feminin',
                                                  ),
                                                  value: "Feminin",
                                                ),
                                              ],
                                              value: sex,
                                              onChanged: (value) {
                                                setState(() {
                                                  sex = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: dat,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "date de naissance",
                                                  prefixIcon: Icon(
                                                      Icons.calendar_month),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              readOnly: false,
                                              controller: lieu,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "lieu de naissance",
                                                  prefixIcon: Icon(Icons.place),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 2.h,
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: taille,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "taille",
                                                  prefixIcon:
                                                      Icon(Icons.height),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              readOnly: false,
                                              controller: profession,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "profession",
                                                  prefixIcon:
                                                      Icon(Icons.work_history),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: phone,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText: "phone",
                                                  prefixIcon: Icon(Icons.phone),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              readOnly: false,
                                              controller: cni,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  hintText:
                                                      "numero de la carte nationale d'identité",
                                                  prefixIcon: Icon(
                                                      Icons.numbers_rounded),
                                                  border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Champ obligatoire';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            if (formKeyall.currentState!
                                                .validate()) {
                                              if(_selectedFile==null){
                                                startWebFilePicker();
                                              }else{
                                                inseruser();
                                              }

                                              // ScaffoldMessenger
                                              //         .of(context)
                                              //     .showSnackBar(
                                              //   const SnackBar(
                                              //       content: Text(
                                              //           'Processing Data')),
                                              //);
                                            }
                                            // setState(() {
                                            //   index = 1;
                                            // });
                                            // checklogin();
                                          },
                                          child: Text("Valider")),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => index == 2 ? getfonction() : Get.back(),
                    icon: Icon(Icons.close)),
                // Positioned(
                //   right: 0,
                //   child: ElevatedButton.icon(
                //     style: TextButton.styleFrom(
                //       padding: EdgeInsets.symmetric(
                //         horizontal: ColorApp.defaultPadding * 1.5,
                //         vertical: ColorApp.defaultPadding /
                //             (Responsive.isMobile(context) ? 2 : 1),
                //       ),
                //     ),
                //     onPressed: () {
                //
                //       getdaialog();
                //     },
                //     icon: Icon(Icons.add),
                //     label: Text("ajouter un domaine"),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void modal() => showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 45.h,
          child: Column(
            children: [
              IBMPlexSans(
                text: ' Dear ${name.text}',
                size: 30,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/succes.gif"))),
              ),
              IBMPlexSans(
                text: "Successfully",
                color: Colors.green,
                size: 25,
              ),
              IBMPlexSans(
                text: 'Your registration was done successfully',
                size: 15,
                color: Colors.black,
              ),
              IBMPlexSans(
                text: 'check this address for full validation',
                size: 15,
                color: Colors.black,
              ),
              Text(
                email.text,
                style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 10,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(5),
                          backgroundColor: Color(0xff3c6dba)),
                      onPressed: () {
                        Get.back();
                      },
                      child: IBMPlexSans(
                        text: "OK",
                        color: Colors.white,
                        size: 15,
                      ))),
              SizedBox(
                height: 2.w,
              )
            ],
          ),
        );
      });

  getfonction() {
    setState(() {
      index = 1;
    });
  }
}
