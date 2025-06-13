import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/add_kost_view.dart';

import '../../../../../common/constant/assets.dart';
import '../../../../../common/constant/color_value.dart';
import '../../../../../model/api/kost_model.dart';
import '../../../../../network/configuration/api_service.dart';
import '../../../../../widgets/card_info/build_card_info.dart';
import '../../../../../widgets/custom_item_kost.dart';

class ManageKostView extends StatefulWidget {
  const ManageKostView({super.key});

  @override
  State<ManageKostView> createState() => _ManageKostViewState();
}

class _ManageKostViewState extends State<ManageKostView> {
  List<DataKost> dataKost = [];
  bool _isLoad = false;

  Future getKostAll() async {
    setState(() {
      _isLoad = true;
    });
    var response = await ApiService().getKostAll();
    setState(() {
      dataKost = response.dataKos;
      _isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKostAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: _isLoad
          ? Center(child: CircularProgressIndicator())
          : dataKost.isEmpty
              ? Center(child: Text("DATA KOST KOSONG"))
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hai, Kennata", style: TextStyle(fontSize: 20)),
                        Text("Informasi kos kamu", style: TextStyle(fontSize: 15, color: MyColor.neutral900)),
                        SizedBox(height: 12),
                        BuildCardInfo(data: dataKost),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Center(
                              child: SvgPicture.asset(IconAssets.history, color: MyColor.mainBlue, height: 20),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kost kamu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  Text("Beberapa kost kamu yang terdaftar", style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataKost.length,
                          itemBuilder: (context, index) {
                            final data = dataKost[index];
                            return CustomItemKost(data: data);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
      floatingActionButton: _isLoad
          ? null
          : FloatingActionButton(
              backgroundColor: MyColor.mainBlue,
              shape: CircleBorder(),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddKostView())),
              child: const Icon(Icons.add, color: Colors.white, size: 35),
            ),
    );
  }
}
