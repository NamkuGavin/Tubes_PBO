import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/edit_kost.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../model/dummy/kost_model.dart';
import '../../../../../../../network/configuration/api_service.dart';

class HeaderDetail extends StatefulWidget {
  final DataKost data;
  final Function() onDelete;
  const HeaderDetail({super.key, required this.data, required this.onDelete});

  @override
  State<HeaderDetail> createState() => _HeaderDetailState();
}

class _HeaderDetailState extends State<HeaderDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconAssets.kost, color: MyColor.mainBlue, height: 35),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data.namaKos, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    widget.data.tipeKos,
                    style: TextStyle(fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  // onTap: () {},
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditKost(data: widget.data))),
                  child: SvgPicture.asset(IconAssets.edit, height: 30)),
              SizedBox(width: 15),
              GestureDetector(onTap: widget.onDelete, child: SvgPicture.asset(IconAssets.delete, color: Colors.red, height: 30)),
            ],
          )
        ],
      ),
    );
  }
}
