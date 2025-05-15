class RiwayatPembayaran {
  String date;
  int currency;
  bool isLunas;
  String kostId;

  RiwayatPembayaran(this.date, this.currency, this.isLunas, this.kostId);
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
