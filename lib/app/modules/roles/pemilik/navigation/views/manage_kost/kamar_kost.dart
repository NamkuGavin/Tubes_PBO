import 'package:flutter/material.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/dummy/kost_model.dart';

class KamarKost extends StatefulWidget {
  final KostPenghuniModel data;
  const KamarKost({super.key, required this.data});

  @override
  State<KamarKost> createState() => _KamarKostState();
}

class _KamarKostState extends State<KamarKost> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Kamar ${widget.data.nama}", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        leading: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: MyColor.mainRed,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.meeting_room, color: Colors.white),
                        ),
                        title: Text('Kamar 6'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'KOSONG',
                              style: TextStyle(color: Colors.red),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(_expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_expanded)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.mainBlue,
                                minimumSize: Size(double.infinity, 0),
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                            child: Text("+ Tambah Penghuni", style: TextStyle(color: Colors.white, fontSize: 15))),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
