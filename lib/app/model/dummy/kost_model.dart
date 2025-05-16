import 'package:tubes_pbo/app/model/dummy/penghuni_model.dart';

class KostPenghuniModel {
  String id; // <- ID unik kost
  String nama;
  String jenis;
  int jumKamar;
  int harga;
  String lokasi;
  String deskripsi;
  List<PenghuniModel> dataPenghuni;

  KostPenghuniModel(this.id, this.nama, this.jenis, this.jumKamar, this.harga, this.lokasi,
      this.deskripsi, this.dataPenghuni);
}

class KostModel {
  String id; // <- ID unik kost
  String nama;
  String jenis;
  int jumKamar;
  int harga;
  String lokasi;
  String deskripsi;
  List<RiwayatPembayaran> dataPembayaran;

  KostModel(this.id, this.nama, this.jenis, this.jumKamar, this.harga, this.lokasi,
      this.deskripsi, this.dataPembayaran);
}
