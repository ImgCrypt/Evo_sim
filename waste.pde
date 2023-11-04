class waste{
  ArrayList<String> dna = new ArrayList<String>();
  int x;
  int y;
  int id;
  
}
//looks if touching food
boolean ifTouchingOrgW(waste a){
  
  boolean r = false;
  for(int d = 0; d<orgs.size(); d++){
    
    if((orgs.get(d).x == a.x) && (orgs.get(d).y == a.y) &&(orgs.get(d).calories > 0) &&(Integer.parseInt(orgs.get(d).dna.get(9)) >5) ){
      r = true;
      
    }
  }
  return r;
}

//ticks food
void foodTickW(){
  //clear();
  
  for(int i = 0; i<waste.size(); i++){
    if(waste.get(i).id == 1){
    int xx = waste.get(i).x;
    int yy = waste.get(i).y;
    while((xx == waste.get(i).x) || (yy == waste.get(i).y)){
      if(Math.random()>.1){
      waste.get(i).x = xx +(int)((Math.random()*4)-2);
      waste.get(i).y = yy + (int)((Math.random()*4)-2);
      }
    }
    stroke(160,82,48);
    if((waste.get(i).x >winx)&& (waste.get(i).y >winy)  && (waste.get(i).x <(winx+500))&& (waste.get(i).y <winy+500) ){
    
    circle(waste.get(i).x-winx,waste.get(i).y-winy,3);
    } 
    ArrayList<String> gfgg = new   ArrayList<String>();
    gfgg.add(Integer.toString(waste.get(i).x));
    gfgg.add(Integer.toString(waste.get(i).y));
    if(false == true){ waste.get(i).id = 0;
    
    }
    if(ifTouchingOrgW(waste.get(i)) == true){ waste.get(i).id = 0;
    waste.get(i).x = 1000000;
    waste.get(i).y = 1000000;
    }
  }else
  {
     /*stroke(200,0,200);
     if((foods.get(i).x >winx)&& (foods.get(i).y >winy)  && (foods.get(i).x <(winx+500))&& (foods.get(i).y <winy+500) ){
    
    circle(foods.get(i).x-winx,foods.get(i).y-winy,0);*/
     //}
    
  }
  }
}

//creates food class
waste createWaste(ArrayList<String> dna){
  waste f = new waste();
  f.x= Integer.parseInt(dna.get(0));
  f.y= Integer.parseInt(dna.get(1));;
  
  f.id = 1;
  //orgs.add(f);
  return f;
}
