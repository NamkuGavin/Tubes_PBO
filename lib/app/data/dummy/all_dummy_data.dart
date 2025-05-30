import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
import 'package:tubes_pbo/app/model/dummy/pembayaran_model.dart';
import 'package:tubes_pbo/app/model/dummy/penghuni_model.dart';

class AllDummyData {
  static final List<PembayaranModel> dataPembayaranPenghuni = [
    PembayaranModel("Muhammad Arsyad", "Kost Subsidi", 1000000, "5 Apr - 6 Mei 2015", false),
    PembayaranModel("Siti Aisyah", "Kost Premium", 1500000, "1 Mei - 1 Jun 2015", true),
    PembayaranModel("Ahmad Fauzi", "Kost Standar", 900000, "10 Mar - 10 Apr 2015", false),
    PembayaranModel("Dewi Lestari", "Kost Ekonomis", 750000, "15 Apr - 15 Mei 2015", true),
    PembayaranModel(
        "Rizky Hidayat", "Kost Eksklusif", 2000000, "20 Apr - 20 Mei 2015", false),
    PembayaranModel("Fitriani", "Kost Standar", 950000, "1 Apr - 1 Mei 2015", true),
    PembayaranModel("Budi Santoso", "Kost Premium", 1600000, "25 Mar - 25 Apr 2015", false),
    PembayaranModel("Nurul Huda", "Kost Subsidi", 850000, "2 Apr - 2 Mei 2015", true),
    PembayaranModel("Andi Pratama", "Kost Eksklusif", 2100000, "3 Apr - 3 Mei 2015", false),
    PembayaranModel("Lina Marlina", "Kost Ekonomis", 800000, "7 Apr - 7 Mei 2015", true),
  ];

  static final List<PembayaranModel> dataPembayaran = [
    PembayaranModel("Kost Subsidi A", "Putra", 1000000, "1 Jan - 1 Feb 2025", false),
    PembayaranModel("Kost Mewah B", "Putri", 1200000, "5 Feb - 5 Mar 2025", true),
    PembayaranModel("Kost Ekonomis C", "Campuran", 800000, "10 Mar - 10 Apr 2025", false),
    PembayaranModel("Kost Modern D", "Putra", 1100000, "15 Apr - 15 Mei 2025", true),
    PembayaranModel("Kost Nyaman E", "Putri", 950000, "20 Mei - 20 Jun 2025", false),
    PembayaranModel("Kost Asri F", "Campuran", 850000, "25 Jun - 25 Jul 2025", false),
    PembayaranModel("Kost Eksklusif G", "Putra", 1300000, "1 Agu - 1 Sep 2025", true),
    PembayaranModel("Kost Strategis H", "Putri", 1000000, "5 Sep - 5 Okt 2025", false),
    PembayaranModel("Kost Hemat I", "Campuran", 750000, "10 Okt - 10 Nov 2025", true),
    PembayaranModel("Kost Premium J", "Putra", 1400000, "15 Nov - 15 Des 2025", false),
  ];

  static final List<PenghuniModel> dataPenghuni = [
    PenghuniModel(
      "Muhammad Arsyad",
      "Laki-laki",
      101,
      25,
      "Mahasiswa",
      81234567890,
      "Motor",
      "B 1234 CD",
      81234567891,
      "ID001",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("10 Jan - 10 Feb 2025", 500000, true, "K001",
            [RiwayatTransaksi(500000, "10 Jan 2025")]),
        RiwayatPembayaran("11 Feb - 11 Mar 2025", 500000, true, "K001", [
          RiwayatTransaksi(250000, "12 Feb 2025"),
          RiwayatTransaksi(250000, "20 Feb 2025")
        ]),
        RiwayatPembayaran("12 Mar - 12 Apr 2025", 500000, false, "K001",
            [RiwayatTransaksi(200000, "15 Mar 2025")]),
      ],
      "K001",
    ),
    PenghuniModel(
      "Ayu Lestari",
      "Perempuan",
      102,
      22,
      "Karyawan",
      81345678901,
      "Mobil",
      "D 5678 EF",
      81345678902,
      "ID002",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("1 Jan - 1 Feb 2025", 700000, true, "K002",
            [RiwayatTransaksi(700000, "1 Jan 2025")]),
        RiwayatPembayaran("2 Feb - 2 Mar 2025", 700000, false, "K002",
            [RiwayatTransaksi(300000, "10 Feb 2025")]),
        RiwayatPembayaran("3 Mar - 3 Apr 2025", 700000, false, "K002", []),
      ],
      "K002",
    ),
    PenghuniModel(
      "Rizky Hidayat",
      "Laki-laki",
      103,
      28,
      "Freelancer",
      81456789012,
      "Motor",
      "E 9012 GH",
      81456789013,
      "ID003",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("5 Jan - 5 Feb 2025", 450000, true, "K003",
            [RiwayatTransaksi(450000, "5 Jan 2025")]),
        RiwayatPembayaran("6 Feb - 6 Mar 2025", 450000, true, "K003", [
          RiwayatTransaksi(150000, "8 Feb 2025"),
          RiwayatTransaksi(300000, "15 Feb 2025")
        ]),
        RiwayatPembayaran("7 Mar - 7 Apr 2025", 450000, false, "K003", []),
      ],
      "K003",
    ),
    PenghuniModel(
      "Siti Nurhaliza",
      "Perempuan",
      104,
      24,
      "Mahasiswa",
      81567890123,
      "Motor",
      "F 3456 IJ",
      81567890124,
      "ID004",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("3 Jan - 3 Feb 2025", 600000, true, "K004",
            [RiwayatTransaksi(600000, "3 Jan 2025")]),
        RiwayatPembayaran("4 Feb - 4 Mar 2025", 600000, true, "K004",
            [RiwayatTransaksi(600000, "4 Feb 2025")]),
        RiwayatPembayaran("5 Mar - 5 Apr 2025", 600000, false, "K004",
            [RiwayatTransaksi(300000, "6 Mar 2025")]),
      ],
      "K004",
    ),
    PenghuniModel(
      "Dimas Saputra",
      "Laki-laki",
      105,
      30,
      "Wiraswasta",
      81678901234,
      "Mobil",
      "G 7890 KL",
      81678901235,
      "ID005",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("1 Feb - 1 Mar 2025", 800000, true, "K005",
            [RiwayatTransaksi(800000, "1 Feb 2025")]),
        RiwayatPembayaran("2 Mar - 2 Apr 2025", 800000, false, "K005", []),
      ],
      "K005",
    ),
    PenghuniModel(
      "Nina Anggraini",
      "Perempuan",
      106,
      27,
      "Desainer",
      81789012345,
      "Motor",
      "H 6543 MN",
      81789012346,
      "ID006",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("5 Feb - 5 Mar 2025", 550000, true, "K006",
            [RiwayatTransaksi(550000, "5 Feb 2025")]),
        RiwayatPembayaran("6 Mar - 6 Apr 2025", 550000, false, "K006",
            [RiwayatTransaksi(250000, "10 Mar 2025")]),
      ],
      "K006",
    ),
    PenghuniModel(
      "Andi Wijaya",
      "Laki-laki",
      107,
      26,
      "Programmer",
      81890123456,
      "Mobil",
      "I 1122 OP",
      81890123457,
      "ID007",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("8 Jan - 8 Feb 2025", 900000, true, "K001",
            [RiwayatTransaksi(900000, "8 Jan 2025")]),
        RiwayatPembayaran("9 Feb - 9 Mar 2025", 900000, true, "K001", [
          RiwayatTransaksi(300000, "10 Feb 2025"),
          RiwayatTransaksi(600000, "18 Feb 2025")
        ]),
      ],
      "K001",
    ),
    PenghuniModel(
      "Citra Maharani",
      "Perempuan",
      108,
      29,
      "Dokter",
      81901234567,
      "Mobil",
      "J 3344 QR",
      81901234568,
      "ID008",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("10 Jan - 10 Feb 2025", 1000000, true, "K002",
            [RiwayatTransaksi(1000000, "10 Jan 2025")]),
        RiwayatPembayaran("11 Feb - 11 Mar 2025", 1000000, false, "K002", []),
      ],
      "K002",
    ),
    PenghuniModel(
      "Fajar Pratama",
      "Laki-laki",
      109,
      23,
      "Magang",
      82012345678,
      "Motor",
      "K 5566 ST",
      82012345679,
      "ID009",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("12 Jan - 12 Feb 2025", 400000, true, "K003",
            [RiwayatTransaksi(400000, "12 Jan 2025")]),
        RiwayatPembayaran("13 Feb - 13 Mar 2025", 400000, false, "K003",
            [RiwayatTransaksi(200000, "15 Feb 2025")]),
      ],
      "K003",
    ),
    PenghuniModel(
      "Lina Marlina",
      "Perempuan",
      110,
      31,
      "Guru",
      82123456789,
      "Mobil",
      "L 7788 UV",
      82123456790,
      "ID010",
      ImageAssets.ktp,
      ImageAssets.stnk,
      [
        RiwayatPembayaran("14 Jan - 14 Feb 2025", 750000, true, "K004",
            [RiwayatTransaksi(750000, "14 Jan 2025")]),
        RiwayatPembayaran("15 Feb - 15 Mar 2025", 750000, true, "K004", [
          RiwayatTransaksi(250000, "17 Feb 2025"),
          RiwayatTransaksi(500000, "25 Feb 2025")
        ]),
      ],
      "K004",
    ),
  ];

  static final List<KostPenghuniModel> dataKostPenghuni = [
    KostPenghuniModel(
      "K001",
      "Kost Mutiara",
      "Putra",
      10,
      10000000,
      "Jl. Kinagara No.35, Bojongsoang, Bandung",
      "Kost dengan fasilitas lengkap seperti listrik, kasur, lemari, meja, kipas, dan kamar mandi dalam.",
      dataPenghuni.where((p) => p.kostId == "K001").toList(),
    ),
    KostPenghuniModel(
      "K002",
      "Kost Sakura",
      "Putri",
      8,
      8500000,
      "Jl. Sakura No.12, Antapani, Bandung",
      "Lingkungan tenang dengan fasilitas AC, WiFi, meja belajar, ranjang, dan kamar mandi dalam.",
      dataPenghuni.where((p) => p.kostId == "K002").toList(),
    ),
    KostPenghuniModel(
      "K003",
      "Kost Harmoni",
      "Campuran",
      12,
      12000000,
      "Jl. Harmoni Raya No.8, Buah Batu, Bandung",
      "Kamar luas, dilengkapi dapur kecil, TV, kulkas, queen bed, dan kamar mandi dalam.",
      dataPenghuni.where((p) => p.kostId == "K003").toList(),
    ),
  ];

  static final List<KostModel> dataKost = [
    KostModel(
      "K001",
      "Kost Mutiara",
      "Putra",
      10,
      10000000,
      "Jl. Kinagara No.35, Bojongsoang, Bandung",
      "Kost dengan fasilitas lengkap seperti listrik, kasur, lemari, meja, kipas, dan kamar mandi dalam.",
      [
        RiwayatPembayaran("10 Jan - 10 Feb 2025", 500000, true, "K001",
            [RiwayatTransaksi(500000, "10 Jan 2025")]),
        RiwayatPembayaran("11 Feb - 11 Mar 2025", 500000, true, "K001", [
          RiwayatTransaksi(250000, "12 Feb 2025"),
          RiwayatTransaksi(250000, "20 Feb 2025")
        ]),
        RiwayatPembayaran("12 Mar - 12 Apr 2025", 500000, true, "K001", [
          RiwayatTransaksi(200000, "15 Mar 2025"),
          RiwayatTransaksi(300000, "25 Mar 2025")
        ]),
      ],
    ), // ❌ 0 belum lunas

    KostModel(
      "K002",
      "Kost Melati",
      "Putri",
      8,
      8500000,
      "Jl. Anggrek No.12, Antapani, Bandung",
      "Kost eksklusif untuk putri dengan akses keamanan 24 jam dan dapur bersama.",
      [
        RiwayatPembayaran("1 Jan - 1 Feb 2025", 600000, true, "K002",
            [RiwayatTransaksi(600000, "1 Jan 2025")]),
        RiwayatPembayaran("2 Feb - 2 Mar 2025", 600000, false, "K002",
            [RiwayatTransaksi(300000, "10 Feb 2025")]),
      ],
    ), // ❌ 1 belum lunas

    KostModel(
      "K003",
      "Kost Harmoni",
      "Campuran",
      12,
      12000000,
      "Jl. Cikutra No.78, Bandung Wetan, Bandung",
      "Kost campuran dengan ruang tamu, dapur umum, dan Wi-Fi gratis.",
      [
        RiwayatPembayaran("5 Jan - 5 Feb 2025", 700000, true, "K003", [
          RiwayatTransaksi(400000, "5 Jan 2025"),
          RiwayatTransaksi(300000, "20 Jan 2025")
        ]),
        RiwayatPembayaran("6 Feb - 6 Mar 2025", 700000, true, "K003",
            [RiwayatTransaksi(700000, "6 Feb 2025")]),
      ],
    ), // ❌ 0 belum lunas

    KostModel(
      "K004",
      "Kost Sejahtera",
      "Putra",
      15,
      9500000,
      "Jl. Sukajadi No.20, Bandung",
      "Kost putra dekat kampus, cocok untuk mahasiswa dan pekerja.",
      [
        RiwayatPembayaran("3 Jan - 3 Feb 2025", 550000, true, "K004",
            [RiwayatTransaksi(550000, "3 Jan 2025")]),
        RiwayatPembayaran("4 Feb - 4 Mar 2025", 550000, true, "K004", [
          RiwayatTransaksi(300000, "5 Feb 2025"),
          RiwayatTransaksi(250000, "20 Feb 2025")
        ]),
        RiwayatPembayaran("5 Mar - 5 Apr 2025", 550000, false, "K004", []),
      ],
    ), // ❌ 1 belum lunas

    KostModel(
      "K005",
      "Kost Anggrek",
      "Putri",
      6,
      7800000,
      "Jl. Buah Batu No.101, Bandung",
      "Kost putri dengan kamar mandi dalam dan laundry gratis.",
      [
        RiwayatPembayaran("8 Jan - 8 Feb 2025", 500000, true, "K005",
            [RiwayatTransaksi(500000, "8 Jan 2025")]),
        RiwayatPembayaran("9 Feb - 9 Mar 2025", 500000, false, "K005",
            [RiwayatTransaksi(200000, "15 Feb 2025")]),
      ],
    ), // ❌ 1 belum lunas
  ];
}
