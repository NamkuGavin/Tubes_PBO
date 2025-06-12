// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
// import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/cari_penghuni.dart';
// import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/detail_penghuni.dart';
//
// import '../../../../../../../common/constant/assets.dart';
// import '../../../../../../../common/constant/color_value.dart';
// import '../../../../../../../widgets/custom_item_tile.dart';
//
// class RiwayatDetail extends StatelessWidget {
//   final KostPenghuniModel data;
//   const RiwayatDetail({super.key, required this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Penghuni", style: TextStyle(fontWeight: FontWeight.bold)),
//               GestureDetector(
//                 onTap: () {},
//                 child: Text("+ Tambah Penghuni", style: TextStyle(fontWeight: FontWeight.bold, color: MyColor.mainBlue)),
//               )
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: data.dataPenghuni.length,
//               itemBuilder: (context, penghuniIndex) {
//                 final penghuni = data.dataPenghuni[penghuniIndex];
//                 final sortedPembayaran = penghuni.riwayatPembayaran.where((item) => item.isLunas == false).toList();
//
//                 return ExpansionTile(
//                   tilePadding: EdgeInsets.symmetric(horizontal: 10),
//                   backgroundColor: Colors.white,
//                   title: Text(
//                     penghuni.nama,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text("Kamar ${penghuni.noKamar} • ${penghuni.jenisKelamin}"),
//                   children: [
//                     ...sortedPembayaran.map((pembayaran) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
//                         child: CustomItemTile(
//                           icon: SvgPicture.asset(
//                             IconAssets.bill,
//                             color: Colors.white,
//                             height: 20,
//                           ),
//                           colorItem: MyColor.mainRed,
//                           name: "BELUM LUNAS",
//                           kost: penghuni.pekerjaan,
//                           currency: pembayaran.currency,
//                           date: pembayaran.date,
//                           lunas: pembayaran.isLunas,
//                         ),
//                       );
//                     }).toList(),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 20),
//                       child: GestureDetector(
//                         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPenghuni(data: penghuni))),
//                         child: Text(
//                           "Lainnya +",
//                           style: TextStyle(color: MyColor.mainBlue),
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
