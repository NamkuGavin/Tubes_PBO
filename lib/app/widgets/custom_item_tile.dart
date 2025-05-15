import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/common/utils/shared_code.dart';

import '../common/constant/assets.dart';
import '../common/constant/color_value.dart';

class CustomItemTile extends StatelessWidget {
  final Widget icon;
  final Color colorItem;
  final String name;
  final String kost;
  final int currency;
  final String date;
  final bool lunas;
  const CustomItemTile(
      {super.key,
      required this.icon,
      required this.colorItem,
      required this.name,
      required this.kost,
      required this.currency,
      required this.date,
      required this.lunas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 12),
                decoration:
                    BoxDecoration(color: colorItem, borderRadius: BorderRadius.circular(8)),
                child: icon,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  Text(
                    kost,
                    style: TextStyle(
                        fontSize: 13, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  lunas
                      ? SharedCode().convertToIdr(currency, 0)
                      : "- ${SharedCode().convertToIdr(currency, 0)}",
                  style: TextStyle(
                      fontSize: 13, color: colorItem, fontWeight: FontWeight.w600)),
              Text(
                date,
                style: TextStyle(
                    fontSize: 13, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
