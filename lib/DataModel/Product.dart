class Product {

  // ignore: non_constant_identifier_names
  final String PName;
  final String PImage;
  final double Price;

const  Product(
   this.PName,
   this.Price,
   this.PImage,
 );

 static const List<Product>products =[

  Product('vance',
   2500,
  'assets/images/vance.png'),

    Product('AirMax',
   2500,
  'assets/shows/img2.png'),

    Product('img3',
   2500,
  'assets/shows/img3.png')
 ];
 

 
  
 
  
}