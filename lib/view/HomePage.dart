import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/colorapp.dart';
import '../components/colors.dart';
import '../components/generated/assets.dart';
import '../components/popmenubutton.dart';
import '../components/searchcustum.dart';
import '../components/service/controlleur.dart';
import '../service/callapi.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Controlleur c = Get.put(Controlleur());

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
c.search("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Container(
            color: Colors.black,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [Colors.black, Colors.black.withOpacity(0.5)])),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.imagesLogom,
                    height: 10.h,
                    width: 10.w,
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: SearchField(
                    textEditingController: search,
                    onchange: (p0) {
                      if (search.text.isEmpty) {
                        setState(() {
                          c.usersearch.clear();
                          c.search(search.text);
                        });
                      } else {
                        setState(() {
                          c.usersearch.clear();
                          c.search(search.text);
                        });
                      }
                    },
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        Popmenubutton(
                          text: 'HOME',
                          index: 'a',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Popmenubutton(
                          text: 'Ajouter',
                          index: 'b',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Popmenubutton(
                          text: 'ABOUT',
                          index: 'c',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Popmenubutton(
                          text: 'CONTACT',
                          index: 'c',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        color: Colors.white,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Colors.white, Colors.grey.withOpacity(0.5)])),
        child: Obx(
          () => ListView(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        c.usersearch.isEmpty
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ))
                            : Container(
                                alignment: Alignment.center,
                                width: Get.width,
                                padding:
                                    EdgeInsets.all(ColorApp.defaultPadding),
                                decoration: BoxDecoration(
                                  color:
                                      ColorApp.secondaryColor.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Membre",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SizedBox(
                                        width: Get.width,
                                        child: DataTable(
                                          columnSpacing:
                                              ColorApp.defaultPadding,
                                          columns: [
                                            DataColumn(
                                              label: Text(""),
                                            ),
                                            DataColumn(
                                              label: Text("Nom et prenoms"),
                                            ),
                                            DataColumn(
                                              label: Text("Email"),
                                            ),
                                            DataColumn(
                                              label: Text("Numero de telephone"),
                                            ),
                                            DataColumn(
                                              label: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5.w),
                                                child: Text("action"),
                                              ),
                                            ),
                                          ],
                                          rows: c.usersearch.first.result!
                                              .map((e) {
                                            return DataRow(cells: [
                                              DataCell(
                                                  Text(e.iduser.toString())),
                                              DataCell(Text('${e.nom.toString()} ${e.prenom.toString()}')),
                                              DataCell(
                                                  Text(e.email.toString())),
                                              DataCell(
                                                  Text(e.phone.toString())),
                                              DataCell(Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons
                                                          .remove_red_eye_outlined),
                                                      onPressed: () {},
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {},
                                                      icon: Icon(Icons.upload),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons.delete),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]);
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                      ],
                    ),
                  ))
              // Row(mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: Get.height / 1.2,
              //       width: 20.w,
              //       color: Colors.blue,
              //     ),
              //
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
