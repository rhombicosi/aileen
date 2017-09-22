import KinectPV2.*;

KinectPV2 kinect;
PImage img;
//PImage imgCopy;
int halfImage;
boolean foundUsers = false;
float pos = 100;
float p=0;
float speed=1;
float alpha = 0;


// anime params
int[] a;
int[] b;
float[] c;
float[] d;

void setup() {
  //size(1280, 720);
fullScreen();
  kinect = new KinectPV2(this);

  kinect.enableBodyTrackImg(true);
  kinect.enableDepthMaskImg(true);

  kinect.init();
  
  img = loadImage("potw1643a.png");
  //imgCopy = loadImage();
  
  a = new int[8];
  b = new int[8];
  c = new float[8];
  d = new float[8];
  
  for (int ii = 0; ii < 8; ii++){
    a[ii] = 100;
    b[ii] = 100;
    c[ii] = 1;
    d[ii] = 0.5;
  }
}

void draw() {
  background(0);
  //image(kinect.getBodyTrackImage(), 0, 0, 640, 360);

  //get the body track combined with the depth information
  //image(kinect.getDepthMaskImage(), 0, 360, 640, 480);

  //obtain an ArrayList of the users currently being tracked
  ArrayList<PImage> bodyTrackList = kinect.getBodyTrackUser();
  
  //iterate through all the users
  for (int i = 0; i < bodyTrackList.size(); i++) {
    PImage bodyTrackImg = (PImage)bodyTrackList.get(i);    
    
    
    if (i == 3) {
        pushMatrix();
        //rotate(PI/3);
        //translate(width/2,0);
        noStroke();
        for(int n =-2;n<3;n++){
          for(int j =0;j<512;j++){
            for(int k=0;k<424;k++){
              if(bodyTrackImg.pixels[j+k*512]!=0 && j%4==0 && k%4==0){
                  //fill(img.pixels[(j+k*512)]);
                  float angle = map(k,0,424,0,TWO_PI);
                  float f1 = map(sin(angle),-1,1,0,255);
                  float f2 = map(cos(angle),-1,1,0,255);
                  
                  fill(f1,0,200,255);
                  //strokeWeight(1);
                  //float x = map(j,0,512,0,TWO_PI);
                  //float y = map(sin(x),-1,1,0,424);
                  //point(j,k);
                  if(j%16==0){                  
                    rect(map(j,0,512,0,width-200)+a[i]*n,map(k,0,424,0,height)+b[i]*tan(alpha)*sin(alpha)*n,3,3);
                  }else{
                    rect(map(j,0,512,0,width-200)+b[i]*n,map(k,0,424,0,height)+b[i]*n,3,3);
                  }
              }
            }
          }
        }
        popMatrix();
    
    }
    
    if (i == 2) {
        pushMatrix();
        //rotate(PI/3);
        //translate(width/2,0);
        noStroke();
        for(int n =-3;n<4;n++){
          for(int j =0;j<512;j++){
            for(int k=0;k<424;k++){
              if(bodyTrackImg.pixels[j+k*512]!=0 && j%4==0 && k%4==0){
                  //fill(img.pixels[(j+k*512)]);
                  float angle = map(k,0,424,0,TWO_PI);
                  float f1 = map(sin(angle),-1,1,0,255);
                  float f2 = map(cos(angle),-1,1,0,255);
                  if(i==1)
                  fill(f1,100,200,255);
                  else
                  fill(100,100,f2,255);
                  //strokeWeight(1);
                  //float x = map(j,0,512,0,TWO_PI);
                  //float y = map(sin(x),-1,1,0,424);
                  //point(j,k);
                  if(k%8==0){
                    rect(map(j,0,512,0,width-200)+a[i]*n,map(k,0,424,0,height)+b[i]*tan(c[i]*alpha)*sin(d[i]*alpha)+cos(d[i]*alpha),3,3);
                  }else{
                    rect(map(j,0,512,0,width-200)+b[i]*n,map(k,0,424,0,height),3,3);
                  }
              }
            }
          }
        }
        popMatrix();    
    }
    
     if (i == 5) {
        pushMatrix();
        //rotate(PI/3);
        //translate(width/2,0);
        noStroke();
        for(int n =-3;n<4;n++){
          for(int j =0;j<512;j++){
            for(int k=0;k<424;k++){
              if(bodyTrackImg.pixels[j+k*512]!=0 && j%4==0 && k%4==0){
                  //fill(img.pixels[(j+k*512)]);
                  float angle = map(k,0,424,0,TWO_PI);
                  float f1 = map(sin(angle),-1,1,0,255);
                  float f2 = map(cos(angle),-1,1,0,255);
                  if(i==1)
                  fill(f1,100,200,255);
                  else
                  fill(100,100,f2,255);
                  //strokeWeight(1);
                  //float x = map(j,0,512,0,TWO_PI);
                  //float y = map(sin(x),-1,1,0,424);
                  //point(j,k);
                  if(k%16 ==0){                  
                    rect(map(j,0,512,0,width-200)+sin(alpha)*100*n,map(k,0,424,0,height),3,3);
                  }else{                  
                    rect(map(j,0,512,0,width-200)+sin(alpha)*100*n,map(k,0,424,0,height)+sin(alpha)*100*n,3,3);
                }
              }
            }
          }
        }
        popMatrix();    
    }
    
     if (i == 4) {
        pushMatrix();
        //rotate(PI/3);
        //translate(width/2,0);
        noStroke();
        for(int n =-3;n<4;n++){
          for(int j =0;j<512;j++){
            for(int k=0;k<424;k++){
              if(bodyTrackImg.pixels[j+k*512]!=0 && j%4==0 && k%4==0){
                  //fill(img.pixels[(j+k*512)]);
                  float angle = map(k,0,424,0,TWO_PI);
                  float f1 = map(sin(angle),-1,1,0,255);
                  float f2 = map(cos(3*angle),-1,1,0,255);                  
                  fill(100,f1,200,255);
                  //strokeWeight(1);
                  //float x = map(j,0,512,0,TWO_PI);
                  //float y = map(sin(x),-1,1,0,424);
                  //point(j,k);
                  if(k%8==0){
                    rect(map(j,0,512,0,width-200)+100*n,map(k,0,424,0,height)+100*tan(alpha)*n+100*sin(alpha)*n,3,3);
                  }else{                    
                    rect(map(j,0,512,0,width-200)+100*n,map(k,0,424,0,height)+sin(alpha)*100*n,3,3);
                  }
              }
            }
          }
        }
        popMatrix();    
    }
    
     if (i == 0) {
        pushMatrix();
        //rotate(PI/3);
        //translate(width/2,0);
        noStroke();
        for(int n =-2;n<3;n++){
          for(int j =0;j<512;j++){
            for(int k=0;k<424;k++){
              if(bodyTrackImg.pixels[j+k*512]!=0 && k%4==0){
                  //fill(img.pixels[(j+k*512)]);
                  float angle = map(k,0,424,0,TWO_PI);
                  float f1 = map(sin(angle),-1,1,0,255);
                  float f2 = map(cos(angle),-1,1,0,255);
                  if(i==1)
                  fill(f1,100,200,255);
                  else
                  fill(100,100,f2,255);
                  //strokeWeight(1);
                  //float x = map(j,0,512,0,TWO_PI);
                  //float y = map(sin(x),-1,1,0,424);
                  //point(j,k);
                  if(k%8==0){
                    rect(map(j,0,512,0,width-200)+a[i]*n*sin(alpha),map(k,0,424,0,height)-100*sin(alpha)*n,2,2);
                  }else{                    
                    rect(map(j,0,512,0,width-200)+b[i]*n*sin(alpha),map(k,0,424,0,height)+100*sin(alpha),2,2);
                  }
              }
            }
          }
        }
        popMatrix();    
    }
    
     if (i == 1) {
        pushMatrix();
        //rotate(PI/2);
        //translate(-width/2,0);
        noStroke();
        for(int n =-2;n<3;n++){
          for(int j =0;j<512;j++){
            for(int k=0;k<424;k++){
              if(bodyTrackImg.pixels[j+k*512]!=0 && j%5 == 0 && k%5 == 0){
                  //fill(img.pixels[(j+k*512)]);
                  float angle = map(k,0,424,0,TWO_PI);
                  float f2 = map(tan(angle),-1,1,0,255);
                 
                  fill(10,100,f2,255);
                  if(j%15==0){
                    rect(map(j,0,512,0,width-200)+a[i]*n,map(k,0,424,0,height)+a[i]*tan(alpha)*sin(alpha)*n + a[i]*sin(alpha)*n,3,3);
                  }else{                    
                    rect(map(j,0,512,0,width-200)+b[i]*n,map(k,0,424,0,height),3,3);
                  }
                }
            }
          }
        }
        popMatrix();    
     }
    
    //if (i == 0){
    //  image(bodyTrackImg, 640 + 480*i, 0, 640, 480);
    //  image(bodyTrackImg, 0, 0, 640, 480);
    //  image(bodyTrackImg, 360, 0, 640, 480);
    //  image(img, 640 + 480*i, 0, 640, 480);}
    //else
      //image(bodyTrackImg, 640 + 480*(i - 3), 424, 640, 480 );
      //image(bodyTrackImg, 640 + 480*(i - 3), 424, 640, 480 );
  }

  fill(0);
  textSize(16);
  text(kinect.getNumOfUsers(), 50, 50);
  text(bodyTrackList.size(), 50, 70);
  
  //pos+=1;
  //if(pos>width)pos=0;
  p+=0.1;
  if(p<1 || p>10) speed=-speed;
  alpha+=PI/72;
  
  //if(frameCount%90==0)saveFrame("images006/kinect-####.png");
}

void mousePressed() {
  println(frameRate);
}


void keyPressed(){

  if(key=='m' || key=='M') {
    
  }
  

  if(keyCode == LEFT) {
    for (int ii = 0; ii< 8; ii++){
      a[ii]-=1;
    }
  }
  if(keyCode == RIGHT) {
    for (int ii = 0; ii< 8; ii++){
        a[ii]+=1;
    }
  } 
  if(keyCode == UP) {
    for (int ii = 0; ii< 8; ii++){
        b[ii]+=1;
    }
  } 
  if(keyCode == DOWN) {
    for (int ii = 0; ii< 8; ii++){
        b[ii]-=1;
    }
  } 

  if(key=='a') {
    for (int ii = 0; ii< 8; ii++){
        c[ii]-=0.1;
    }  
  }
  if(key=='d') {
    for (int ii = 0; ii< 8; ii++){
        c[ii]+=0.1;
    } 
  }
  if(key=='s') {
    for (int ii = 0; ii< 8; ii++){
        d[ii]-=0.1;
    } 
  }
  if (key =='w') {
    for (int ii = 0; ii< 8; ii++){
        d[ii]+=0.1;
    } 
  }

  if(key==' ') {
    
  }
}