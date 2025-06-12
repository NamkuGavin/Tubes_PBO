import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/constant/assets.dart';
import '../common/constant/color_value.dart';
import '../model/api/penghuni_model.dart';
import '../network/configuration/api_service.dart';

class ItemSearchPenghuni extends StatefulWidget {
  final PenghuniModel data;
  const ItemSearchPenghuni({super.key, required this.data});

  @override
  State<ItemSearchPenghuni> createState() => _ItemSearchPenghuniState();
}

class _ItemSearchPenghuniState extends State<ItemSearchPenghuni> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFBABABA))),
      child: Row(
        children: [
          SvgPicture.asset(IconAssets.person2, color: MyColor.mainBlue, height: 30),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.nama, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              Text("${widget.data.jenisKelamin}, ${widget.data.id}", style: TextStyle(fontSize: 13, color: Color(0xFF8C8C8C))),
            ],
          )
        ],
      ),
    );
  }
}
