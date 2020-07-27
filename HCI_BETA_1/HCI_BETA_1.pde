import TUIO.*; //<>// //<>// //<>//
int posX;
int posY;
int idobjetotuio;
int nPics;
PImage imgtuio;
PImage img[];
PImage imginfoapple;
PImage imginfobanana;
PImage imgtextapple;
PImage imgtextbanano;
PImage imgtuiobanana;
PImage imginfoapplebanano;
TuioProcessing tuio;
int w;
int posX1, posX2, posY1, posY2;
int h;
int i=1;
boolean apple = false;
boolean banano = false;
boolean banaapple = false;
void setup() {
  
  size(500, 950);
  tuio = new TuioProcessing(this);
  nPics= 17;
  img = new PImage[nPics];
  imgtuio = loadImage("apple.png");
  imginfoapple = loadImage("Infoapple.PNG");
  imgtuiobanana = loadImage("banana.png");
  imginfobanana = loadImage("Infobanana.PNG");
  imginfoapplebanano = loadImage("infoapplebanano.PNG");
  imgtextapple = loadImage("Nombreapple.PNG");
  imgtextbanano = loadImage("Nombrebanano.PNG");

 
  for (int o = 0; o <nPics; o++) {
    if(o==0){
    }else{
        
      img[o] = loadImage("Pantalla"+o+".PNG");
      
  }
  }

  
 
}
 
void draw() {
   background(0);
   
   
  image(img[i],0,0,500,950);
  
  if(i==14 ){
    ArrayList<TuioObject> tuioObjectList2 = tuio.getTuioObjectList();
    if(tuioObjectList2.size()==1){
     if(apple == true){ //<>//
      imgtuio.resize(100,100);
      image(imgtuio,posX,posY);
      image(imginfoapple, posX+100,posY);
      
    
     }if(banano == true){
      imgtuiobanana.resize(100,100);
      image(imgtuiobanana,posX,posY);
      image(imginfobanana, posX+100,posY);
      
    
     }
    }else if(tuioObjectList2.size()==2){
      imgtuiobanana.resize(100,100);
      image(imgtuio,posX2,posY2);
      image(imgtextapple, posX2+100,posY2);
      imgtuio.resize(100,100);
      image(imgtuiobanana,posX1,posY1);
      image(imgtextbanano, posX1+100,posY1);
      image(imginfoapplebanano,150,610);
       
     }
     
  }
  
     
   
     
  }
void mousePressed(){
  if(i<16){
    print("entro");
    i=i+1;
  }else{
    i=1;
  }
  
}
void updateTuioObject(TuioObject objetoTuio){
  
  ArrayList<TuioObject> tuioObjectList = tuio.getTuioObjectList();
  posX = round(objetoTuio.getX()*width);
  posY = round(objetoTuio.getY()*height);
 //print( "  Manzana: "+apple + " Banano: " + banano + " Ambos:  " + banaapple + " ");
 if(tuioObjectList.size()==2){
   
    posX1 = round(tuioObjectList.get(0).getX()*width);
    posY1 = round(tuioObjectList.get(0).getY()*height);
    posX2 = round(tuioObjectList.get(1).getX()*width);
    posY2 = round(tuioObjectList.get(1).getY()*height);
 }
  if(tuioObjectList.get(0).getSymbolID()==1 /*&& (!(tuioObjectList.get(1).getSymbolID()==2))*/){
    apple=true; //<>//
  }else if(tuioObjectList.get(0).getSymbolID()==2 /*&& (!(tuioObjectList.get(1).getSymbolID()==1))*/){
    banano=true; //<>//
  } //<>//
    
  
  
 
  
}
void removeTuioObject(TuioObject objetoTuio){
  if(objetoTuio.getSymbolID()==1){
    apple=false; //<>//
  }else if(objetoTuio.getSymbolID()==2){
    banano=false;
  }
}
 
