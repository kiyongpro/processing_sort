int count = 0, compare = 0, swap = 0, type = 2, delay = 100;
int[] data;
int[] order = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
int[] reverse = {20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1};

boolean exit = false, setting = true;
int[][] br = new int[19][2];
int l=0, r=19, pivot, top = -1, dataCompare = 0;
int i=0, j=0;

void setup(){
  size(200,210);
  randomSeed(100);
   
  data = order;
  if(type > 0){
    data = reverse;
    if(type == 2){
      for(int i = 0; i < data.length; i++){      
        Swap((int)random(data.length), (int)random(data.length));  
      }
      swap = 0;
    }
  }
  Line(20,20,20,-1,20);
  delay(500);
}

void draw(){
  delay(delay);
  if(!exit){
    if(setting){
      setting = false;
      pivot = (l+r)/2;
      i = l;
      j = r;
      Line(pivot,i,j,l,r); 
      delay = 250;
    }
    else{
      if(data[i] < data[pivot]){ 
        i++;
        compare++;        
      }
      if(data[j] > data[pivot]) {
        j--;
        compare++;
      }    
      if(compare == dataCompare){
        if(i <= j){
          Swap(i, j);
          if(i == j)
            swap--;
          Line(pivot,j,i,l,r);
          i++;
          j--;
          if(i < r){
            br[++top][0] = i;
            br[top][1] = r;
          }
          
         if(l < j){
            r = j;
          }
          else if(top >= 0){
           l = br[top][0];
           r = br[top--][1];
          }
          else 
            exit = true;
          setting = true;
          delay = 250;
        }
      }
      else{
         dataCompare = compare;
         Line(pivot,i,j,l,r);
         delay = 90;
      }  
    }
  }
  else
    Line(20,20,20,-1,20);
}

void Swap(int a, int b){
  int temp = data[a];
  data[a] = data[b];
  data[b] = temp;
  swap++;
}

void Line(int a, int b, int c, int d, int e){    
  background(255);
  
  int w = 0;
  for(int i = 0; i < data.length; i++){
        int h = data[i]*10;
        fill(data[i]*10,data[i]*10,data[i]*10);
          if(i<d || i>e)
            fill(100,100,255);
          else if(i == a)
            fill(255,0,0);
          else if(i == b)
            fill(0,255,255);
          else if(i == c)
            fill(255,255,100);
        rect(w,210-h,10,h);
        w += 10;    
  }  
  fill(0,0,0);
  
  text("Compare : " + compare + " Swap : " +swap, 0, 10);
}
