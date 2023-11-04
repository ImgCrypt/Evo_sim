class food{
  ArrayList<String> dna = new ArrayList<String>();
  int x;
  int y;
  int id;
  
}
//looks if touching food
boolean ifTouchingOrg(food a){
  
  boolean r = false;
  for(int d = 0; d<orgs.size(); d++){
    
    if((orgs.get(d).x == a.x) && (orgs.get(d).y == a.y) &&(orgs.get(d).calories > 0) ){
      r = true;
      
    }
  }
  return r;
}

//ticks food
void foodTick(){
  //clear();
  
  for(int i = 0; i<foods.size(); i++){
    if(foods.get(i).id == 1){
    int xx = foods.get(i).x;
    int yy = foods.get(i).y;
    while((xx == foods.get(i).x) || (yy == foods.get(i).y)){
      if(Math.random()>.1){
      foods.get(i).x = xx +(int)((Math.random()*4)-2);
      foods.get(i).y = yy + (int)((Math.random()*4)-2);
      }
    }
    stroke(200,0,10);
    if((foods.get(i).x >winx)&& (foods.get(i).y >winy)  && (foods.get(i).x <(winx+500))&& (foods.get(i).y <winy+500) ){
    
    circle(foods.get(i).x-winx,foods.get(i).y-winy,5);
    }
    if(ifTouchingOrg(foods.get(i)) == true){ foods.get(i).id = 0;
    
    }
  }else
  {
     stroke(200,0,200);
     if((foods.get(i).x >winx)&& (foods.get(i).y >winy)  && (foods.get(i).x <(winx+500))&& (foods.get(i).y <winy+500) ){
    
    circle(foods.get(i).x-winx,foods.get(i).y-winy,2);
     }
    if(Math.random()>.99) foods.get(i).id=1; 
  }
  }
}

//creates food class
food createFood(ArrayList<String> dna){
  food f = new food();
  f.x= Integer.parseInt(dna.get(0));
  f.y= Integer.parseInt(dna.get(1));;
  
  f.id = 1;
  //orgs.add(f);
  return f;
}
