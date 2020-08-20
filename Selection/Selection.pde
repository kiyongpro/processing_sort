int count = 0, compare = 0, swap = 0, type = 2, delay = 90;
int[] data;
int[] order = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
int[] reverse = {20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1};

int i=0, j=1, min=0;

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
  Line(20,20,20);
  delay(500);
}

void draw(){
  if(i < data.length){
    delay(delay);
    if(j == data.length){
      if(min != i){
        Swap(i, min);
        Line(min, 20, i);
        delay = 200;
      }
      min = ++i;
      j = i+1;
    }
    else{
      delay = 90;
      if(data[min] > data[j]){
        min = j;
      }
      Line(i, j++, min);
      compare++;
      count++;      
    }
    if(j == data.length){
        delay = 200;
    }
  }
  else
    Line(20, 20, 20);
}

void Swap(int a, int b){
  int temp = data[a];
  data[a] = data[b];
  data[b] = temp;
  swap++;
}

void Line(int a, int b, int c){    
  background(255);
  
  int w = 0;
  for(int i = 0; i < data.length; i++){
        int h = data[i]*10;
        fill(data[i]*10,data[i]*10,data[i]*10);
          if(i == a)
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
