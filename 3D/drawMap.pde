void drawMap() {
  for (int mapX = 0, mapY = 0, worldX = 0, worldZ = 0; mapY < map1.height; ) {
    color pixel1 = map1.get(mapX, mapY); // While loop visits every pixel and records color temporarily
    worldX = mapX*blockSize;
    worldZ = mapY*blockSize;
    if (pixel1 == black) {
      texturedBox(qblock, worldX, 0, worldZ, blockSize/2);
      texturedBox(qblock, worldX, -blockSize, worldZ, blockSize/2);
      texturedBox(qblock, worldX, -blockSize*2, worldZ, blockSize/2);
      texturedBox(qblock, worldX, -blockSize*3, worldZ, blockSize/2);
      texturedBox(qblock, worldX, -blockSize*4, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*5, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*6, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*7, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*8, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*9, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*10, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*11, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*12, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*13, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*14, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*15, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*16, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*17, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*18, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*19, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*20, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*21, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*22, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*23, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*24, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*25, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*26, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*27, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*28, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*29, worldZ, blockSize/2);
    }
    mapX++;
    if (mapX > map1.width) {
      mapX = 0;
      mapY++;
    }
  }
  for (int mapX = 0, mapY = 0, worldX = 0, worldZ = 0; mapY < map2.height; ) {
    color pixel2 = map2.get(mapX, mapY);
    worldX = mapX*blockSize;
    worldZ = mapY*blockSize;
    if (pixel2 == black) {
      //texturedBox(wblock, worldX, -blockSize*30, worldZ, blockSize/2);
      //texturedBox(wblock, worldX, -blockSize*31, worldZ, blockSize/2);
    }
    mapX++;
    if (mapX > map2.width) {
      mapX = 0;
      mapY++;
    }
  }
  for (int mapX = 0, mapY = 0, worldX = 0, worldZ = 0; mapY < map3.height; ) {
    color pixel3 = map3.get(mapX, mapY);
    worldX = mapX*blockSize;
    worldZ = mapY*blockSize;
    if (pixel3 == black) {
      //texturedBox(qblock, worldX, -blockSize*32, worldZ, blockSize/2);
      //texturedBox(qblock, worldX, -blockSize*33, worldZ, blockSize/2);
    }
    mapX++;
    if (mapX > map3.width) {
      mapX = 0;
      mapY++;
    }
  }
  //for (int mapX = 0, mapY = 0, worldX = 0, worldZ = 0; mapY < map4.height; ) {
  //  color pixel4 = map4.get(mapX, mapY);
  //  worldX = mapX*blockSize;
  //  worldZ = mapY*blockSize;
  //  if (pixel4 == black) {
  //    texturedBox(qblock, worldX, 0, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*2, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*3, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*4, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*5, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*6, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*7, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*8, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*9, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*10, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*11, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*12, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*13, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*14, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*15, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*16, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*17, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*18, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*19, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*20, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*21, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*22, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*23, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*24, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*25, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*26, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*27, worldZ, blockSize/2);
  //    texturedBox(qblock, worldX, -blockSize*28, worldZ, blockSize/2);
  //    texturedBox(ynblock, worldX, -blockSize*29, worldZ, blockSize/2);
  //  }
  //  mapX++;
  //  if (mapX > map4.width) {
  //    mapX = 0;
  //    mapY++;
  //  }
  //}
}
