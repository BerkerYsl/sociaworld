import 'package:flutter/material.dart';

class GonderiKarti extends StatelessWidget {
  //Birden fazla gönderi kartı oluşturacağımız için gönderi kartının kodlarını refactor ile farklı bir widget içerisine aldık
  final String profilResimLink;
  final String adSoyad;
  final String gecenSure;
  final String aciklama; //FARKLI OLACAK ALANLAR İÇİN DEĞİŞKENLERİ TANIMLADIK
  final String gonderiResmi;

  const GonderiKarti(
      {Key? key,
      this.profilResimLink = "",
      this.adSoyad = "",
      this.gecenSure = "",
      this.aciklama = "",
      this.gonderiResmi=""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      //Arka planı beyaz olan container'mızın sınırlarını daha net görebilmek için
      //Material widgeti ile ona yükseklik efekti veriyoruz.
      //hem de bu efektle birlikte daha öne çıkan ve göze çarpan bir tasarım elde ediyoruz.
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: 380.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //3 nokta ikonunu sağda ve resimle ismi solda göstermek için Row'un spaceBetween özelliğini kullandık
                //ancak spacebetween 2 tane widget varsa bunları sağa ve sola ayırmada etkilidir bu yüzden
                //resimle ismi sola, üç nokta ikonunuda sağa kaydırmak için isimle resmi bir kez daha aynı row içine alarak
                //onların row içerisinde tek bir widget gibi gözükmesini sağladık böylece en üstteki row eleman olarak
                //sadece bir tane row ve Icon gördü. Böylece bunları kolayca sağa sola ayırabildi.
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.indigo,
                            image: DecorationImage(
                                //PROFİL FOTOSU
                                image: NetworkImage(profilResimLink),
                                fit: BoxFit.cover))),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      //Kolonun yatay ekseni ortaya hizalı olduğu için isim ve süre text'leri kolon içerisinde birbirlerine ortalanmış şekilde duruyorlar
                      //crossAxisAlignment.start özelliğini kullanarak onları sola doğru hizalıyoruz.
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Text(adSoyad,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(
                          gecenSure,
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ]),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    onPressed: () => "",
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                aciklama,
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Image.network(
                gonderiResmi,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 7.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //KENDİ OLUŞTURDUĞĞUMUZ BUTONLARA, BUTON ÖZELLİKLERİNİ INKWELL WİDGETİ İLE VERİYORUZ
                  //TIKLANINCA NE OLACAK GİBİ VB. TÜM BUTON ÖZELLİKLERİNİ INKWELL WİDGETİ İLE VERİYORUZ.
                  //INKWELL MÜREKKEP KUTUSU DEMEKTİR VE BUTONA BASILDIĞINDA MÜREKKEP SIÇRAR GİBİ EFEKT VERİR
                  //ANCAK BU MÜREKKEP EFEKTİ MATERİAL OLMADAN GÖZÜKMEZ YANİ INKWELL'İ MATERİAL WİDGETİ İÇERİSİNE ALMAMIZ GEREKİR.
                  //ANCAK ONUN İÇERİSİNDEYKEN BU EFEKTLERİ GÖREBİLİRİZ.

                  //Butonlarımızı widget içerisine aldık ve onları çağırarak kod fazlalığından kurtulduk
                  //Neredeyse her buton için aynı işlemi yaptık ve bu sayede kendimizi tekrar etmeden onları çağırabildik.

                  //BEĞEN BUTONU
                  IkonluButon(
                    ikonum: Icons.favorite,
                    ikonRenk: Colors.red,
                    ikonAdi: "Beğen",
                    fonksiyonum: () {
                      print("BEĞEN");
                    },
                  ),

                  //YORUM BUTONU
                  IkonluButon(
                    ikonum: Icons.comment,
                    ikonRenk: Colors.green,
                    ikonAdi: "Yorum Yap",
                    fonksiyonum: () {
                      print("YORUM");
                    },
                  ),

                  //PAYLAŞ BUTONU
                  // IkonluButon(
                  //   ikonum: Icons.share,
                  //   ikonRenk: Colors.indigo,
                  //   ikonAdi: "Paylaş",
                  //   fonksiyonum: () {
                  //     print("PAYLAŞ");
                  //   },
                  // ),

                  /* 
                  Aslında tüm bu yaptığımız ikon butonlarına bu kadar uğraşmamıza gerek yok.
                  Çünkü hali hazırda içerisinde fonksiyonu, text'i ve özellikleri bulunan hazır butonlar mevcut.
                  Direkt olarak onları programda kullanabiliriz. 
                  */
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.indigo,
                      ),
                      label: const Text(
                        "Paylaş",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IkonluButon extends StatelessWidget {
  final IconData ikonum;
  final MaterialColor ikonRenk;
  final String ikonAdi;
  final fonksiyonum;
  IkonluButon({
    this.ikonum = Icons.favorite,
    this.ikonRenk = Colors.grey,
    this.ikonAdi = "Buton",
    this.fonksiyonum,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Row(
            children: [
              IconButton(
                icon: Icon(ikonum),
                onPressed: fonksiyonum,
                color: ikonRenk,
                iconSize: 30.0,
              ),
              Text(
                ikonAdi,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
