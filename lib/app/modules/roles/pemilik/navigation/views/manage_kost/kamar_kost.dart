import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tubes_pbo/app/common/constant/navigate.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/cari_penghuni.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/detail_penghuni.dart';

import '../../../../../../common/constant/assets.dart';
import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/api/kost_model.dart';
import '../../../../../../model/dummy/kost_model.dart';
import '../../../../../../widgets/custom_simple_item_tile.dart';

class KamarKost extends StatefulWidget {
  final DataKost data;
  const KamarKost({super.key, required this.data});

  @override
  State<KamarKost> createState() => _KamarKostState();
}

class _KamarKostState extends State<KamarKost> {
  late List<bool> _expandedList;

  @override
  void initState() {
    super.initState();
    // Set awal: semua tidak di-expand
    _expandedList = List.filled(widget.data.dataKamar.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Kamar ${widget.data.namaKos}",
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.data.dataKamar.length,
            itemBuilder: (context, index) {
              var dataKamar = widget.data.dataKamar[index];
              final isExpanded = _expandedList[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _expandedList[index] = !_expandedList[index];
                        });
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        leading: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: dataKamar.status == "Kosong" ? MyColor.mainRed : MyColor.mainGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.meeting_room, color: Colors.white),
                        ),
                        title: Text('Kamar ${dataKamar.noKamar}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              dataKamar.status,
                              style: TextStyle(color: dataKamar.status == "Kosong" ? MyColor.mainRed : MyColor.mainGreen),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: dataKamar.status == "Kosong"
                            ? ElevatedButton(
                                onPressed: () => Navigate.navigatorPush(context, () => CariPenghuni(dataKost: widget.data, dataKamar: dataKamar)),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColor.mainBlue,
                                    minimumSize: Size(double.infinity, 0),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                                child: Text("+ Tambah Penghuni", style: TextStyle(color: Colors.white, fontSize: 15)),
                              )
                            : GestureDetector(
                                onTap: () => Navigate.navigatorPush(context, () => DetailPenghuni(dataKost: widget.data, dataKamar: dataKamar)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFBABABA))),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.person2, color: MyColor.mainBlue, height: 30),
                                      SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(dataKamar.dataPenghuni.nama.toString(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                          Text("${dataKamar.dataPenghuni.jenisKelamin}, ${dataKamar.dataPenghuni.id}", style: TextStyle(fontSize: 13, color: Color(0xFF8C8C8C))),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
