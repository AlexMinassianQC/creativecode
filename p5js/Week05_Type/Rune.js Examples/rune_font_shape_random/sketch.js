var fontSize = 100;
var word = "Hello World!";
var path, polys;

function setup(){
    createCanvas(600,400)  
    background(0)

    f = new Rune.Font("fonts/ShadowsIntoLight.ttf") 
    // load the font
    f.load(function(err){     
        path = f.toPath(word, 0, 0, fontSize) // this is a rune function
        polys = path.toPolygons({ spacing: 30 }) // this is another handy function to get polygons coordinates
        // now we can draw based on the polygon points
        noFill()
        fill(255);
        stroke(255, 0, 0);
        strokeWeight(1);
        translate(100, height/2);
        for (var i=0; i < polys.length ; i++){
            var poly = polys[i];
            beginShape();
            for(var j = 1; j < poly.state.vectors.length; j++) {
                var r = random(-8, 8);
                var vec = poly.state.vectors[j];
                curveVertex(vec.x += r, vec.y += r);
            }
            endShape();
        }

    })
}

