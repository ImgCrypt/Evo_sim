int qw = 0;
int winx = 0;
int winy = 0;
boolean pause = false;
ArrayList<org> orgs = new ArrayList<org>();

ArrayList<food> foods = new ArrayList<food>();
ArrayList<waste> waste = new ArrayList<waste>();


String[] genes = {"lat: ","vision: ","metabolism: ","speed: ","death: ", "red: ","green: ", "blue: ", "mutibility: ", "can_eat_waste: "};




void setup(){
  size(500,500);
  background(0,0,0);
  for(int y = 0; y<100;y++){
    ArrayList<String> gg = new   ArrayList<String>();
    gg.add("0");
    gg.add("0");
    gg.add("1");
    gg.add("0");
    gg.add("0");
    gg.add("0");
    gg.add("0");
    gg.add("1");
    gg.add("9");
    gg.add("0");
    if(Math.random()<.6){
      org a = createOrg(gg);
      a.x = 50;
      a.y = 400;
    //orgs.add(a);
    
    
    }
    ArrayList<String> ggg = new   ArrayList<String>();
    ggg.add("60");
    ggg.add("400");
    foods.add(createFood(ggg));
   ArrayList<String> gggg = new   ArrayList<String>();
    gggg.add("400");
    gggg.add("60");
    foods.add(createFood(gggg));
    /* ArrayList<String> ggggg = new   ArrayList<String>();
    ggggg.add("300");
    ggggg.add("200");
    foods.add(createFood(ggggg));
    ArrayList<String> gggggg = new   ArrayList<String>();
    gggggg.add("300");
    gggggg.add("80");
    foods.add(createFood(gggggg));*/
  }
  /*for(int y = 0; y<100;y++){
    
    ArrayList<String> gg = new   ArrayList<String>();
    gg.add("0");
    gg.add("0");
    gg.add("1");
    gg.add("0");
    gg.add("0");
    if(Math.random()<.3){
      org ff = createOrg(gg);
      ff.x = 700;
      
    orgs.add(ff);
    }
  }*/
  orgTick();
  
}

void draw(){
  if(!pause){
 clear();
  
  
  foodTickW();
  foodTick();
  orgTick();
  //foodTick();
  }
}
//show dna when clicked on
void mouseClicked(){
  if(mouseButton == LEFT){
    switch(key){
      case 'o':
       ArrayList<String> gg = new   ArrayList<String>();
    gg.add("5");
    gg.add("2");
    gg.add("5");
    gg.add("5");
    gg.add("0");
    gg.add("0");
    gg.add("9");
    gg.add("0");
    gg.add("9");
    gg.add("0");
      org b = createOrg(gg);
      b.x = (mouseX+winx);
      b.y = (mouseY+winy);
    orgs.add(b);
      break;
      case 'f':
      
       ArrayList<String> ggg = new   ArrayList<String>();
    
      
      ggg.add(Integer.toString(mouseX+winx));
      ggg.add(Integer.toString(mouseY+winy));
      for(int c = 0; c<10; c++){
    foods.add(createFood(ggg));
      }
      break;
default:
    for(int i = 0; i<orgs.size(); i++){
    if(( orgs.get(i).x > mouseX-10  && orgs.get(i).x < mouseX+10) && ( orgs.get(i).y > mouseY-10  && orgs.get(i).y < mouseY+10) &&orgs.get(i).calories>0){
     println("------------");
      for(int g =0; g<orgs.get(i).dna.size(); g++){
       
       println(orgs.get(i).dna.get(g));
     }
     println("------------");
    }
    }
    break;
    }
  }
  if(mouseButton == RIGHT){
    double[] dnas = new double[orgs.get(0).dna.size()];
      int mm = 0;
    for(int i = 0; i<orgs.size(); i++){
      
    if(( orgs.get(i).x > (mouseX+winx)-50  && orgs.get(i).x < (mouseX+winx)+50) && ( orgs.get(i).y > (mouseY+winy)-50  && orgs.get(i).y < (mouseY+winy)+50) &&orgs.get(i).calories>0){
     
      for(int g =0; g<orgs.get(i).dna.size(); g++){
       mm++;
       dnas[g]=dnas[g]+Double.parseDouble(orgs.get(i).dna.get(g));
     }
     
    }
    }
    println("----------");
    for(int g =0; g<orgs.get(0).dna.size(); g++){
       
       println(genes[g] + dnas[g]/(mm/10));
     }
     println("----------");
  }
  
}
void keyPressed(){
  int uuu = 0;
  if(key=='p'&&uuu==0){
    int hq = 0;
    uuu++;
    int hqq = 0;
    int hqqq =0;
    for(int e = 0; e<orgs.size(); e++){
      
      if((orgs.get(e).calories>0)&&Integer.parseInt(orgs.get(e).dna.get(2))>5)hqq++;
      if((orgs.get(e).calories>0)&&Integer.parseInt(orgs.get(e).dna.get(1))<5)hqqq++;
      //if(!(((orgs.get(e).calories>0)&&Integer.parseInt(orgs.get(e).dna.get(1))>5)||((orgs.get(e).calories>0)&&Integer.parseInt(orgs.get(e).dna.get(2))>1))){
         if(orgs.get(e).calories>0)hq++;
      //}
      else{
       
      }
      }
      //println(orgs.get(e).dna.get(1));
       println(((hq)+"||"+hqq+"||"+hqqq));
    delay(20);
    uuu=0;
    }
   
  if(key=='c'){
    qw=1;
    println("c");
  }
  if(key=='x'){
    qw=0;
    println("x");
  }
  if(key=='w'){
    winy=winy-5;
  }
  if(key=='s'){
    winy=winy+5;
  }
  if(key=='a'){
    winx=winx-5;
  }
  if(key=='d'){
    winx=winx+5;
  }
  if(key==' '){
    if(pause){
      pause = false;
    }
    else
    {
    pause = true;
   
    
    }
  }
}
