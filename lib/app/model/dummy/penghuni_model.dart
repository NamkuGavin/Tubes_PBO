class RiwayatTransaksi {
  final int nominal;
  final String tanggal;

  RiwayatTransaksi(this.nominal, this.tanggal);
}

class RiwayatPembayaran {
  final String date;
  final int currency;
  final bool isLunas;
  final String kostId;
  final List<RiwayatTransaksi> riwayatTransaksi;

  RiwayatPembayaran(this.date, this.currency, this.isLunas, this.kostId, this.riwayatTransaksi);
}

class PenghuniModel {
  String nama;
  String jenisKelamin;
  int noKamar;
  int umur;
  String pekerjaan;
  int noHandphone;
  String kendaraan;
  String noPlat;
  int noDarurat;
  String id;
  String fotoKTP;
  String fotoSTNK;
  List<RiwayatPembayaran> riwayatPembayaran;
  String kostId; // <- ini penting

  PenghuniModel(
    this.nama,
    this.jenisKelamin,
    this.noKamar,
    this.umur,
    this.pekerjaan,
    this.noHandphone,
    this.kendaraan,
    this.noPlat,
    this.noDarurat,
    this.id,
    this.fotoKTP,
    this.fotoSTNK,
    this.riwayatPembayaran,
    this.kostId, // <- ditambahin di constructor juga
  );
}
