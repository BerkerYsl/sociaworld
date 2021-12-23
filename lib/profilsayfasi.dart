import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworldproject/gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String adSoyad;
  final String kullaniciAdi;
  final String arkaPlanResimLink;
  final String profilFotoLink;
  const ProfilSayfasi(
      {Key? key,
      this.adSoyad = "",
      this.kullaniciAdi = "",
      this.arkaPlanResimLink = "",
      this.profilFotoLink = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: <Widget>[
            Stack(
              //Stack içerisinde alignment parametresini kullanarak elemanları nereye doğru hizalayabileceğimizi belirliyorduk ancak
              //alignment parametresi ile bütün elemanları hizalıyoruz burada biz bunu istemiyoruz sadece profil fotosu gelecek daireyi hizalamak istiyoruz.
              //Stack içerisinde Tek bir elemanı hizalamak istersek Positioned Widgeti'ni kullanmamız gereklidir.
              //Positioned'de konumlandırma
              children: <Widget>[
                Container(
                  //color: Colors.yellow,
                  height: 230.0,
                ),
                Container(
                    height: 180.0,
                    //color:Colors.green arka plan resminin geleceği yeri ve kaplayacağı alanı yeşil renkle belirttik
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(arkaPlanResimLink),
                            fit: BoxFit.cover))),
                //Positioned parametrelerine istediğimiz değerleri girerek container'i istediğimiz şekilde konumlandırabiliriz.
                //herhangi bir parametreye sıfır verirsek kenarlara uzaklık sıfırlanır. Taban ve yüksekliği Stack'e ilk eklenen Container belirler.

                Positioned(
                  //DAİRE ŞEKLİNDEKİ PROFİL FOTOĞRAFI KISMI
                  left: 20.0,
                  bottom: 0.0,
                  child: Hero(
                    tag: kullaniciAdi,
                    child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70.0),
                            color: Colors.blue,
                            border: Border.all(width: 2.0, color: Colors.white),
                            image: DecorationImage(
                              image: NetworkImage(profilFotoLink), 
                              fit: BoxFit.cover,
                            ))),
                  ),
                ),

                //ALT ALTA DURAN İSİM VE KULLANICI ADI KISMI
                //ALT ALTA DURMALARI İÇİN COLUMN WİDGETİ KULLANDIK
                Positioned(
                  left: 145.0,
                  top: 190.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        adSoyad,
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        kullaniciAdi,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                //TAKİP BUTONU
                Positioned(
                  right: 10.0,
                  top: 130.0,
                  child: Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.add_circle,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ),
                Positioned(
                  left: 7.0,
                  top: 13.0,
                  child: Container(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context, "döndüm");
                      },
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: 100.0,
              height: 75.0,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Kodları tekrar etmemek için takipçi,takip ve gönderi bilgilerini metot haline getirdik
                  //değişken kısımları parametre olarak consturctor'dan gönderdik.
                  TakipTakipciGonderiBilgi("Takipçi", "200"),
                  TakipTakipciGonderiBilgi("Takip", "300"),
                  TakipTakipciGonderiBilgi("Gönderi", "5"),
                ],
              ),
            ),
            const GonderiKarti(
              profilResimLink:
                  "https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_960_720.jpg",
              adSoyad: "Anna Marie",
              gecenSure: "1 Dakika Önce",
              aciklama: "Mountain and Clouds",
              gonderiResmi:
                  "https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204_960_720.jpg",
            ),
          ],
        ));
  }

  Widget TakipTakipciGonderiBilgi(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          sayi,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 1.0,
        ),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
