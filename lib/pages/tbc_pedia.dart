import 'package:flutter/material.dart';
import 'package:tbc_app/pages/description.dart';
import 'package:tbc_app/pages/home.dart';

class TBC_Pedia extends StatefulWidget {
  final String name;
  final String email;

  const TBC_Pedia({super.key, required this.name, required this.email});

  @override
  State<TBC_Pedia> createState() => _TBC_PediaState();
}

class _TBC_PediaState extends State<TBC_Pedia> {
  final _searchTextfieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCFE9F8),
      bottomNavigationBar: CustomBottomAppbar(
        email: widget.email,
        name: widget.name,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 210,
            elevation: 0,
            backgroundColor: Color(0xffCFE9F8),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: CustomAppbar(
                  name: widget.name,
                  searchTextfieldcontroller: _searchTextfieldcontroller),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        // height: 100,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                        decoration: BoxDecoration(
                          color: Color(0xff354D5B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/pedia.png")),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              "TBC Pedia",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 33,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins-Bold",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                  name: "Definition",
                                  path: "assets/definition.png",
                                  desc:
                                      "Tuberkulosis atau disingkat TBC/TBC merupakan penyakit infeksi menular yang disebabkan oleh bakteri golongan Mycobacterium yaitu Mycobacterium tuberkulosis. Penyakit Tuberkulosis atau TBC ini dapat menyerang berbagai organ terutama paru- paru yang bila tidak mendapat pengobatan atau pengobatannya tidak tuntas maka dapat menimbulkan komplikasi berbahaya hingga kematian. Penyakit ini ditularkan oleh pasien positif BTA dan menyebar melalui droplet pernapasan yang dikeluarkan saat pasien batuk atau bersin. Bakteri yang menyebar melalui udara dapat terhirup oleh orang sehat dan menyebabkan infeksi"),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/definition.png",
                          text: "Definition",
                          familyText: "Adigiana",
                          sizeFont: 20,
                        )),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                  name: "Etiology",
                                  path: "assets/etiologi.png",
                                  desc:
                                      "Penyakit tuberkulosis disebabkan oleh bakteri, menurut Sigalingging et al. (2019). M. tuberculosis, yang merupakan anggota dari famili Mycobacteriaceace, sangat berbahaya bagi manusia. Bakteri ini memiliki dinding sel lipoid yang tahan asam dan memiliki waktu mitosis 12 hingga 24 jam. Mereka juga rentan terhadap sinar matahari dan sinar ultraviolet, sehingga mereka akan mati dengan cepat di bawah sinar matahari. Mereka juga rentan terhadap panas basah, sehingga mereka akan mati dalam waktu 2 menit di air bersuhu 1000oC. Mereka juga akan mati jika terkena alkohol 70% atau lisol 50%. Bakteri ini dapat berdiam diri dalam jaringan tubuh selama beberapa tahun sebelum dapat aktif kembali. Sifat aerobik mikroorganisme ini, yang membutuhkan oksigen untuk melakukan metabolisme mereka, menunjukkan bahwa bakteri ini lebih suka jaringan yang kaya oksigen. Pada paru-paru, tekanan bagian apikal lebih tinggi daripada jaringan lainnya, sehingga bagian ini menjadi tempat yang bagus untuk bakteri M. tuberculosis berkembang biak (Darliana, 2011). Ketika penderita tuberkolosis paru BTA positif berbicara, bersin, dan batuk, M. tuberculosis dapat menular yang mengeluarkan doplet nuclei dengan mengandung bakteri M. tuberculosis secara langsung dan melemparkannya ke lantai, tanah, atau lokasi lainnya. Bakteri M. tuberculosis yang terkandung di dalam doplet nuklei dapat menguap karena paparan sinar matahari atau suhu udara yang panas. Pergerakan aliran angin membantu bakteri mengguap ke udara. Orang yang sehat dapat terinfeksi bakteri yang menyebabkan tuberkulosis jika mereka menghirup bakteri tersebut (Kenedyanti & Sulistyorini, 2017). Tuberkulosis paling sering menyerang orang produktif yang berusia antara 15 dan 49 tahun. Namun, individu yang memiliki tes tuberkolosis BTA positif dapat menularkan penyakit tersebut kepada orang-orang dari segala usia (Kristini & Hamidah, 2020)."),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/etiologi.png",
                          text: "Etiology",
                          familyText: "Adigiana",
                          sizeFont: 20,
                        )),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                  name: "Pathophysiology",
                                  path: "assets/pathophysiology.png",
                                  desc:
                                      "Jika seseorang menghirup bakteri M. tuberculosis yang terhirup, bakteri tersebut akan masuk ke alveoli. Alveoli, atau paru-paru, adalah tempat bakteri berkumpul dan berkembang biak. M. tuberculosis juga dapat masuk ke bagian tubuh lain melalui sistem limfa dan cairan tubuh, seperti ginjal, tulang, korteks serebri, dan bagian lain dari paru-paru (lobus atas). Sistem kekebalan dan sistem imun tubuh akan menanggapi dengan melakukan reaksi inflamasi. Bakteri ditekan oleh fagosit, dan limfosit tuberkulosis menghancurkan bakteri dan jaringan normal. Reaksi ini dapat menyebabkan penumpukan eksudat di alveoli, yang dapat menyebabkan bronchopneumonia. Infeksi pertama biasanya muncul dalam waktu dua hingga sepuluh minggu setelah terpapar bakteri (Kenedyanti & Sulistyorini, 2017).\n Pada tahap awal infeksi, M. tuberculosis berinteraksi dengan kekebalan tubuh dan membentuk granuloma. Granuloma terbuat dari makrofag membungkus gumpalan basil hidup dan mati. Granulomas diubah menjadi massa jaringan fibrosa. Bagian sentral dari massa ini disebut ghon tuberculosis, dan kemudian menjadi nekrotik dan membentuk massa yang mirip dengan keju. Ini akan diklasifikasikan, dibentuk menjadi jaringan kolagen, dan bakteri akan tidur. Setelah infeksi pertama, seseorang dapat mengalami penyakit aktif karena gangguan atau ketidakmampuan sistem imun untuk menanggapi. Penyakit juga dapat muncul melalui infeksi ulang dan aktivasi bakteri dorman, yang mengaktifkan bakteri yang sebelumnya tidak aktif. Pada situasi ini, ghon tubrcle pecah, menyebabkan caseosa necrotizing di bronkhus. Bakteri kemudian menyebar di udara, menyebarkan penyakit. Paru yang terinfeksi menjadi lebih membengkak setelah tuberkulosis menyerah dan membentuk jaringan parut yang menyebabkan bronkopneumonia yang lebih parah (Sigalingging et al., 2019)."),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/pathophysiology.png",
                          text: "Pathophysiology",
                          familyText: "Adigiana",
                          sizeFont: 18,
                        )),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                  name: "Sign & Symptoms",
                                  path: "assets/signsymtomp.png",
                                  desc:
                                      "Gejala umum penyakit tuberkulosis adalah:\n1.	Berat badan turun selama 3 bulan berturut-turut tanpa sebab yang jelas\n2.	Demam berlangsung lebih dari sebulan\n3.	Batuk yang berlangsung lebih dari dua minggu dan tidak kunjung sembuh (tidak kunjung hilang atau semakin lama semakin parah)\n4.	Nyeri dada\n5.	Sesak napas\n6.	Kehilangan atau penurunan nafsu makan\n7.	Sedikit lesu atau tidak sehat\n8.	Berkeringat malam meskipun tidak melakukan aktivitas fisik\n9.	Dahak bercampur darah.\nPengobatan dilakukan dalam dua tahap, yaitu tahap awal (intensif, 2 bulan) dan tahap lanjutan. Lama pengobatan 6-8 bulan, tergantung berat ringannya penyakit. Penderita harus minum obat secara lengkap dan teratur sesuai jadwal berobat sampai dinyatakan sembuh. Dilakukan tiga kali pemeriksaan ulang dahak untuk mengetahui perkembangan kemajuan pengobatan, yaitu pada akhir pengobatan tahap awal, sebulan sebelum akhir pengobatan dan pada akhir pengobatan. Prinsip utama pengobatan tuberkulosis adalah patuh untuk meminum obat selama jangka waktu yang diberikan oleh dokter, hal ini dianjurkan agar bakteri penyebab penyakit tuberkulosis tidak menjadi kebal terhadap obat-obatan yang diberikan. Paduan obat yang digunakan adalah paduan obat utama dan obat tambahan. Jenis obat utama (lini I) adalah INH, rifamfisin, pirazinamid, streptomisisin, etambutol, sedangkan obat tambahan lainnya adalah: kanamisin, amikasin, kuinolon. Kualitas hidup pasien tuberkulosis yang menjalani pengobatan dipengaruhi oleh kondisi fisik yang dialami, tekanan emosional, dukungan sosial yang diperoleh dari keluarga maupun orang sekitar, serta lingkungan yang mendukung pasien dalam menjalani hidup"),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/signsymtomp.png",
                          text: "Sign & Symptoms",
                          familyText: "Adigiana",
                          sizeFont: 17,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
