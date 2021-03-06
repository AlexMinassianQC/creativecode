float baseColor = random(360);
float hue = 0;      
float hueSteps = 1; 
PFont font;
Table data;
String[] words;
int randomWord;

void setup()  {
  size(600, 600, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  background(0, 0, 100);
  frameRate(5);
  font = loadFont("Georgia-BoldItalic-100.vlw");
  data = loadTable("cc_midterm_words.csv");
  words = new String[data.getRowCount()];
         
  // Selecting a random word from the dataset (data.getRowCount is the max number)
  randomWord = round(random(data.getRowCount()));
  for(int i = 0; i < data.getRowCount(); i++) {
    words[i] = data.getRow(i).getString(0);
  }
}

void draw() {

  // Selects one random word from the dataset
  
  String w = words[randomWord];  
  textFont(font);
  textSize(random(10, 100));
  fill(baseColor + hue, random(100), random(0, 100), random(90, 100));
 
  hue = hue + hueSteps;
  if (hue < 0 || hue > 100) {
    hueSteps *= -1;
  }
   
  float angle = round(random(7));
  pushMatrix();
  translate(random(200, 600), random(100, 300));
  if(angle == 1) rotate(radians(45));
  if(angle == 2) rotate(radians(90));
  if(angle == 3) rotate(radians(135));
  if(angle == 4) rotate(radians(180));
  if(angle == 5) rotate(radians(225));
  if(angle == 6) rotate(radians(270));
  if(angle == 7) rotate(radians(315)); 
  if(angle == 8) rotate(radians(360)); 
  
   text(w, 0, 0);
   popMatrix();
//}
}


