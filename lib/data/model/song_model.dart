class SongModel {
  final String title;
  final String url;
  final String image;

  SongModel({required this.title, required this.url, required this.image});

  static List<SongModel> songs = [
    SongModel(
        title: 'Akylly Ahmet',
        url: 'assets/music/Akylly_Ahmet.mp3',
        image: 'bay'),
    SongModel(
        title: 'Bilgir garyp',
        url: 'assets/music/Bilgir_garyp.mp3',
        image: 'oglan'),
    SongModel(
        title: 'Akylly garry',
        url: 'assets/music/Akylly_garry.mp3',
        image: 'dana_goja1'),
    SongModel(
        title: 'Akylly gyz',
        url: 'assets/music/Akylly_gyz.mp3',
        image: 'gyzlar'),
    SongModel(
        title: 'Bagtly kel',
        url: 'assets/music/Bagtly_kel.mp3',
        image: 'dag'),
    SongModel(
        title: 'Çopanyň gudaçylygy',
        url: 'assets/music/Chopanyn_gudachylygy.mp3',
        image: 'awçy'),
    SongModel(
        title: 'Dokuz içigara tentek bilen bir dana ',
        url: 'assets/music/Dokuz_ichigara_tentek_bilen_bir_dana.mp3',
        image: '9icigara'),
    SongModel(
        title: 'Garyp oglan',
        url: 'assets/music/Garyp_oglan.mp3',
        image: '10garyp'),
    SongModel(
        title: 'Gurjakgyz',
        url: 'assets/music/Gurjakgyz.mp3',
        image: '7'),
    SongModel(
        title: 'Iki mergen',
        url: 'assets/music/Iki_mergen.mp3',
        image: 'dag'),
    SongModel(
        title: 'Kaşmirli Baýhunni',
        url: 'assets/music/Kashmirli_bayhunni.mp3',
        image: '7kasmir'),
    SongModel(
        title: 'Müň dost hakykysy bir dost',
        url: 'assets/music/Mun_dost_hakykysy_bir_dost.mp3',
        image: '8mundost'),
    SongModel(
        title: 'Tilkijik',
        url: 'assets/music/Tilkijik.mp3',
        image: 'til'),
    SongModel(
        title: 'Üç dogan',
        url: 'assets/music/Uch_dogan.mp3',
        image: '3uc_dogan'),
    SongModel(
        title: 'Üç doganyň iň kiçisi',
        url: 'assets/music/Uch_doganyn_in_kichisi.mp3',
        image: '6ucin'),
    SongModel(
        title: 'Ýakma bişersiň - gazma düşersiň',
        url: 'assets/music/Yakma_bishersin_-_gazma_duhersin.mp3',
        image: '4yakma'),
    SongModel(
        title: 'Ýetim oglan',
        url: 'assets/music/Yetim_oglan.mp3',
        image: '5yet'),
    SongModel(
        title: 'Ýetim oglan bir gün görseň bitin oglan',
        url: 'assets/music/Yetim_oglan_bir_gorsen_bitin_oglan.mp3',
        image: 'yenis'),

  ];
}
