/*public class Org extends life{
  int l;
  int dna[] = new int[l];
  
}*/

class org{
  ArrayList<String> dna = new ArrayList<String>();
  int x;
  int y;
  int calories;
  int speed;
  
}
//ticks organism
void orgTick(){
  //clear();
 
  for(int i = 0; i<orgs.size(); i++){
    if(orgs.get(i).calories >0){
    int xx = orgs.get(i).x;
    int yy = orgs.get(i).y;
    //move and use gene 3
    while((xx == orgs.get(i).x) || (yy == orgs.get(i).y)){
     int pp = (int)(Integer.parseInt(orgs.get(i).dna.get(3)))/2;
      orgs.get(i).x = xx +((int)((Math.random()*4)-2));
      orgs.get(i).y = yy + ((int)((Math.random()*4)-2));
     orgs.get(i).calories = orgs.get(i).calories-(1+Integer.parseInt(orgs.get(i).dna.get(3))*5);
    }
    int temp = orgs.get(i).y;
    //use gene 1
    boolean d = false;
    if(Integer.parseInt(orgs.get(i).dna.get(1))>1){
     orgs.get(i).calories = orgs.get(i).calories- (10*Integer.parseInt(orgs.get(i).dna.get(1)))*8;
    for(int xxx = 0; xxx<(10*Integer.parseInt(orgs.get(i).dna.get(1))-1)&&d==false; xxx++){
      int pp = (int)(Integer.parseInt(orgs.get(i).dna.get(3)));
     xx = xx +((int)((Math.random()*4*pp)-2*pp));
     yy =  yy + ((int)((Math.random()*4*pp)-2*pp));
     ArrayList<String> dna = new ArrayList<String>();
    org hh = createOrg(dna);
    hh.x = xx;
    hh.y = yy;
   // ((ifTouchingWaste(hh)==true && Integer.parseInt(orgs.get(i).dna.get(9)) > 5 )) || (( ifTouchingFood(hh)==true) && (Integer.parseInt(orgs.get(i).dna.get(9)) <= 5))
      if(((ifTouchingWaste(hh)==true && Integer.parseInt(orgs.get(i).dna.get(9)) > 5 )) || (( ifTouchingFood(hh)==true) && (Integer.parseInt(orgs.get(i).dna.get(9)) <= 5))) {
        orgs.get(i).x = xx;
        orgs.get(i).y = yy;
        d=true;
      }
    }
    orgs.get(i).calories = orgs.get(i).calories - 2;
    }
    //use gene 5,6,7
    stroke((Integer.parseInt(orgs.get(i).dna.get(5)))*25,(Integer.parseInt(orgs.get(i).dna.get(6)))*25,(Integer.parseInt(orgs.get(i).dna.get(7)))*25);
    if((orgs.get(i).x >winx)&& (orgs.get(i).y >winy)  && (orgs.get(i).x <(winx+500))&& (orgs.get(i).y <winy+500) ){
    circle(orgs.get(i).x-winx, orgs.get(i).y-winy,5);
    }
   if( ifTouchingFood(orgs.get(i))==true && (Integer.parseInt(orgs.get(i).dna.get(9)) < 5)) {orgs.get(i).calories = orgs.get(i).calories + 5000;
       if(Math.random()<.01){
  ArrayList<String> gggg = new   ArrayList<String>();
    gggg.add(Integer.toString(orgs.get(i).x-100));
    gggg.add(Integer.toString(orgs.get(i).y));
    waste.add(createWaste(gggg));
  }
    }
    //use gene 9
    if( ifTouchingWaste(orgs.get(i))==true && Integer.parseInt(orgs.get(i).dna.get(9)) > 5 ) {orgs.get(i).calories = orgs.get(i).calories +4000;
    }
    //reproduce
    if(orgs.get(i).calories>6000 && (Math.random()*10)>5){
      reproduce(orgs.get(i));
    }
    //use calories
    orgs.get(i).calories = orgs.get(i).calories - 10;
    //use gene 0
    int tolerence = 50*(Integer.parseInt(orgs.get(i).dna.get(0))-5);
    int tempp = Math.abs((height/2)-(orgs.get(i).y+tolerence));
    orgs.get(i).calories = orgs.get(i).calories - tempp/3;
    //use gene 2
     if((orgs.get(i).y>250&&(Integer.parseInt(orgs.get(i).dna.get(2))<5))){
       switch(qw){
       case(0):
       orgs.get(i).calories = orgs.get(i).calories -70;
         break;
         case(1):
       orgs.get(i).calories = orgs.get(i).calories +70;
         break;
       }
       
     }
}else
  {
    
    
    
    
  }
  //use gene 4 aka instant death
  if(Integer.parseInt(orgs.get(i).dna.get(4))>0){
    orgs.get(i).calories=0;
    
  }
  }
}
//looks at if touchign food
boolean ifTouchingFood(org a){
  boolean r = false;
  for(int d = 0; d<foods.size(); d++){
    if((foods.get(d).x == a.x) && (foods.get(d).y == a.y) &&(foods.get(d).id == 1)){
      r = true;
    }
  }
 
  return r;
}
//if touching waste
boolean ifTouchingWaste(org a){
  boolean r = false;
  for(int d = 0; d<waste.size(); d++){
    if((waste.get(d).x == a.x) && (waste.get(d).y == a.y) &&(waste.get(d).id == 1)){
      r = true;
    }
  }
  
  return r;
}

org createOrg(ArrayList<String> dna){
  org f = new org();
  f.x= 250;
  f.y= 250;
  f.calories = 5000;
  f.dna=dna;
  
  //orgs.add(f);
  return f;
}

//reproduce and mutate and use gene 8
void reproduce(org a){
  org f = new org();
  f.x = a.x;
  f.y = a.y;
  a.calories = a.calories- 5000;
  f.calories = 5000;
  
  for(int ff = 0;ff<a.dna.size(); ff++){
    f.dna.add(a.dna.get(ff));
  }
  double prob = .95 + (1 - (Double.parseDouble(a.dna.get(8))/12))-.5; 
  if(Math.random()>.95){
    int ddd = (int)Math.floor(Math.random()*(f.dna.size()));
  f.dna.set(ddd,Integer.toString((int)(10*Math.random())));
  
  }
  
  orgs.add(f);
}
