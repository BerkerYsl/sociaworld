import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworldproject/gonderikarti.dart';
import 'package:sociaworldproject/profilsayfasi.dart';
//farklı dosyada bulunan gonderikartını burada kullanabilmek için import ettik

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sociaworld',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 32.0,
            color: Colors.black,
          ),
          onPressed: () => "",
        ),
        title: const Text(
          "Sociaworld",
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 30.0,
              color: Colors.purple,
            ),
            onPressed: () => "",
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          //Container'ın alignment parametresini parent içerisinde vermek gerekiyor ve ListView içerisinde alignment parametresi olmadığı için
          //Container'i Align Widgeti içerisine alarak container'i istediğimiz yere ve boyutta hizalayabiliriz.
          //Burada yatayda tüm ekranı kaplamasını istediğimizz için sildik ancak belli bir alan kullanacaksak hizalamak için
          //Center,Row ve Column widgetlarını kullanabiliriz.

          Container(
            height: 100.0,
            decoration:
                BoxDecoration(color: Colors.grey[100], boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0.0, 3.0), blurRadius: 5.0)
              //blurradius gölgenin bulanıklığını belirler
            ]),

            //Container içerisinde yukarıda yan yana duran çevrimiçi kullanıcıları göstermek için  yine ListView kullanacağız.
            //ListView kullanmamızın amacı kaydırma yapacak olmamız ve içeriklerin sığmıyo oluşudur.
            //Ancak bu sefer yatayda kullanacağımız için ListView'e onu yatayda kullanacağımızı söylememiz lazımç
            child: ListView(
              //LisView'in kaydrma yönünü yatay olarak değiştirmiş olduk.
              scrollDirection: Axis.horizontal,
              children: [
                //DRY- Don't Repeat Yourself prensiplerine uyarak tekrarlanması gereken kod satırlarını
                //yani Column widgetini metot haline getirdik
                profilKartiOlustur(
                    "Berker",
                    "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg",
                    "Berker Uysal",
                    "https://cdn.pixabay.com/photo/2021/11/15/05/52/red-fox-6796430_960_720.jpg"),
                profilKartiOlustur(
                    "Sinem",
                    "https://cdn.pixabay.com/photo/2016/11/29/05/55/adult-1867665_960_720.jpg",
                    "Sinem Gündüz",
                    "https://cdn.pixabay.com/photo/2021/11/19/11/13/duomo-6808817_960_720.jpg"),
                profilKartiOlustur(
                    "Burçin",
                    "https://cdn.pixabay.com/photo/2017/04/05/01/15/ocean-2203720_960_720.jpg",
                    "Burçin Uysal",
                    "https://cdn.pixabay.com/photo/2021/11/14/21/14/animals-6795732_960_720.jpg"),
                profilKartiOlustur(
                    "Vedat",
                    "https://cdn.pixabay.com/photo/2016/03/09/09/30/woman-1245817_960_720.jpg",
                    "Vedat Uysal",
                    "https://cdn.pixabay.com/photo/2021/11/08/23/29/nature-6780354_960_720.jpg"),
                profilKartiOlustur(
                    "Neriman",
                    "https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083390_960_720.jpg",
                    "Neriman Uysal",
                    "https://cdn.pixabay.com/photo/2021/11/13/23/06/tree-6792528_960_720.jpg"),
                profilKartiOlustur(
                  "Marie.A",
                  "https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1636631881000/photosp/6d93fade-1551-47e8-9df0-aa5ac6672848/stock-photo-portrait-beach-vintage-young-man-lifestyle-man-asian-millennial-asian-people-6d93fade-1551-47e8-9df0-aa5ac6672848.jpg",
                  "Marie Anna",
                  "https://cdn.pixabay.com/photo/2012/03/04/00/03/jellyfish-21741_960_720.jpg",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),

          //GÖNDERİ KARTI
          //Gönderi kartlarını merkezileştirmek için ayrı bir widget haline getirdik
          //Ayrı bir Widget haline getirdiğimiz gönderi kartını farklı bir dosyaya taşıyarak onun hem bus sayfada hem de programdaki
          //diğer sayfalarda kullanılmasını sağlayacğız.
          const GonderiKarti(
            profilResimLink:
                "https://cdn.pixabay.com/photo/2016/11/29/03/15/man-1867009_960_720.jpg",
            adSoyad: "Berker Uysal",
            gecenSure: "1 Hafta Önce",
            aciklama: "Train to India",
            gonderiResmi:
                "https://cdn.pixabay.com/photo/2020/03/26/20/57/train-4971799_960_720.jpg",
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
          const GonderiKarti(
            profilResimLink:
                "https://cdn.pixabay.com/photo/2016/07/13/16/00/box-1514845_960_720.jpg",
            adSoyad: "Rocky",
            gecenSure: "10 Saat Önce",
            aciklama: "Training",
            gonderiResmi:
                "https://cdn.pixabay.com/photo/2021/11/05/20/36/boxing-6771969_960_720.jpg",
          ),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLink,
      String adSoyad, String arkaPlanResim) {
    //Column'ı padding ile sardığımızda hata aldık çünkü widget tipi sadece Column döndürüyor ve biz ise padding döndürmeye çalışıyordukj
    //ancak sonrasında Column tipinde oluşturduğumuz metotta Column'ı silerek Widget tipine getirdik ve tüm widget tiplerinin kullanımına açtık
    return Material(
      //Anasayfada bulunan hikaye benzeri profil kartlarına tıkladığımızda kullanıcıların profillerinin açılmasını istediğimiz için
      //onları tıklanabilir yapmak ve bir fonksiyon atamak için Inkwell widgeti içerisine aldık inkwell'de olan tıklayınca gelen sıçrama efekti için ise
      //inkwell widgeti'ni material widgeti içerisine aldık. Inkwell içindeki onTap fonksiyonuna sayfayı değiştirecek komutları yazarak
      //profil kartlarına tıklandığında kişilerin profil sayfalarına gidebiliriz.
      child: InkWell(
        onTap: () async {
          //Sayfalar arası geçiş işlemini Navigator ile yapıyoruz. Navigator Widgeti bizlere sayfalar arasında dolaşmayı sağlıyor
          //açmak istediğimiz, ekrana getirmek istediğimiz sayfayı push ile ekrandan çıkarmak istediğimiz sayfayı pop ile ekrandan kaldırabiliriz.
          //Push metodu context ve route adında 2 parametre alıyor.Context'e bir BuildContext ve route'a ise sayfaya gidiş rotamızı
          //giriyoruz route ile sayfaya nasıl, hangi yoldan gideceğimizi söylüyoruz. Aslında bu kısım o sayfaya geçiş animasyonunun nasıl olacağı ile ilgilidir.
          //burada push  metodu içerisinde context değerinin hata vermesinin sebebi profilKartiOlustur widgeti içinde metoda gönderilen bir context parametresi yok
          // ve bu nedenden dolayı context kelimesini kullanarak context bilgisine ulaşamıyoruz.
          //Bu durumu çözmek için profilKartiOlustur metodunu çağırırken context bilgisinide parametre olarak gönderebiliriz veya
          //Anasayfa widgeti'ni durumsu metottan durumlu metoda çevirirsekde hata kaybolacaktır.
          //Durumlu widget'Ta hata mesajının kaybolmasının sebebi: Durumlu Widget içerisinde context kelimesi nitelikleşmiş metot yani getter olarak tanımlandığı için
          //Context bilgisine ulaşabilmek için parametrede context kelimesi kullanmamız yetiyor.

          //Navigator.of(context).push(Cupertino) şeklinde
          Future<dynamic> donenDeger = Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => ProfilSayfasi(
                        kullaniciAdi: kullaniciAdi,
                        profilFotoLink: resimLink,
                        arkaPlanResimLink: arkaPlanResim,
                        adSoyad: adSoyad,
                      )));
          print(await donenDeger);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 4.5),
                      width: 70.0,
                      height: 70.0,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                              image: NetworkImage(resimLink),
                              //DecorationImage sınıfının fit parametresini kullanarak resmi istediğimiz şekilde sığdırabiliriz.
                              fit: BoxFit.cover)),
                      // child: Image.network(
                      //     "https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_960_720.jpg"),
                    ),
                  ),
                  Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(width: 2.0, color: Colors.white))),
                ],
              ),
              Text(
                kullaniciAdi,
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
