/*
 / Usage: diamond_square(ds_grid ID, height, default value);
 / Description:
 /  Performs diamond square algorithm on the desired ds_grid ID
 / 
 / Make sure that the grid's size should be 2^n+1!
 /
 / Returns: String
 /  "ERROR" - if the ds_grid is not a square.
 /  Current seed - the seed used for generation.
*/
var data,size,height,defaultValue,sideLength,halfSide,avg,data,startTime,endTime,baseHeight;

data = argument0;
height = argument1;
defaultValue = argument2;
randomize();

if(ds_grid_height(data) != ds_grid_width(data)){
    show_debug_message("ERROR! Check if the ds_grid height is equal to its width.");
    return "ERROR";
}
size = ds_grid_height(data);
if(size < 2){
    show_debug_message("ERROR! Invalid ds_grid size.");
    return "ERROR";
}
if(size mod 2 == 0){
    show_debug_message("WARNING: Size inappropriate. Increased by 1...");
    size += 1;
}
ds_grid_clear(data,0);
baseHeight = height;

data[# 0,0] = defaultValue;
data[# 0,size-1] = defaultValue;
data[# size-1,0] = defaultValue;
data[# size-1,size-1] = defaultValue;

sideLength = size-1;
while(sideLength >= 2){
    sideLength /=2
    height/= 2.0;

    halfSide = sideLength/2;

    for(var sx=0;sx<size-1;sx+=sideLength){
        for(var sy=0;sy<size-1;sy+=sideLength){
            avg = data[# sx,sy] + data[# sx+sideLength,sy] + data[# sx,sy+sideLength] + data[# sx+sideLength,sy+sideLength];
            avg /= 4.0;


            data[# sx+halfSide,sy+halfSide] = 

            avg + (random(1)*2*height);
        }
    }
    for(var dx=0;dx<size-1;dx+=halfSide){
        for(var dy=(dx+halfSide) mod sideLength;dy<size-1;dy+=sideLength){
            avg = data[# (dx-halfSide+size-1) mod (size-1),dy] + data[# (dx+halfSide) mod (size-1),dy] + data[# dx,(dy+halfSide) mod (size-1)] + data[# dx,(dy-halfSide+size-1) mod (size-1)];
            avg /= 4.0;
    
            avg = avg + (random(1)*2*height)- height;
            data[# dx,dy] = avg;
            if(dx == 0)  data[# size-1,dy] = avg;
            if(dy == 0)  data[# dx,size-1] = avg;
        }
  }
}

for(var j = 0; j < size; j += 1){
    for(var i = 0; i < size; i += 1){
        if(ds_grid_get(data,i,j) < 0){
            data[# i, j] = 0;
        }
        if(ds_grid_get(data,i,j) > baseHeight){
            data[# i, j] = baseHeight;
        }
    }
}

return string(random_get_seed());


