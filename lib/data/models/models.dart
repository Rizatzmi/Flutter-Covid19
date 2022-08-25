class Stat {
  final int jumlahPositif;
  final int jumlahDirawat;
  final int jumlahSembuh;
  final int jumlahMeninggal;
  final int updatePositif;
  final int updateDirawat;
  final int updateSembuh;
  final int updateMeninggal;

  const Stat({
    required this.jumlahPositif,
    required this.jumlahDirawat,
    required this.jumlahSembuh,
    required this.jumlahMeninggal,
    required this.updatePositif,
    required this.updateDirawat,
    required this.updateSembuh,
    required this.updateMeninggal,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      jumlahPositif: json['update']['total']['jumlah_positif'] as int,
      jumlahDirawat: json['update']['total']['jumlah_dirawat'] as int,
      jumlahSembuh: json['update']['total']['jumlah_sembuh'] as int,
      jumlahMeninggal: json['update']['total']['jumlah_meninggal'] as int,
      updatePositif: json['update']['penambahan']['jumlah_positif'] as int,
      updateDirawat: json['update']['penambahan']['jumlah_dirawat'] as int,
      updateSembuh: json['update']['penambahan']['jumlah_sembuh'] as int,
      updateMeninggal: json['update']['penambahan']['jumlah_meninggal'] as int,
    );
  }
}

class Vaksin {
  final int vaksin_1;
  final int vaksin_2;
  final int updateVaksin_1;
  final int updateVaksin_2;

  const Vaksin({
    required this.vaksin_1,
    required this.vaksin_2,
    required this.updateVaksin_1,
    required this.updateVaksin_2,
  });

  factory Vaksin.fromJson(Map<String, dynamic> json) {
    return Vaksin(
      vaksin_1: json['vaksinasi']['total']['jumlah_vaksinasi_1'] as int,
      vaksin_2: json['vaksinasi']['total']['jumlah_vaksinasi_2'] as int,
      updateVaksin_1:
          json['vaksinasi']['penambahan']['jumlah_vaksinasi_1'] as int,
      updateVaksin_2:
          json['vaksinasi']['penambahan']['jumlah_vaksinasi_2'] as int,
    );
  }
}