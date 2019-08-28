

Function tile_load(i,j,s1:String,s2:String)

  If FileType("gfx/world/tileset/tileset_"+s1+"/"+s2+".png")=1 Then
    img_tile[i,j]=LoadPixmap("gfx/world/tileset/tileset_"+s1+"/"+s2+".png")
  End If

End Function




Function tiles_load()


  For Local i=0 To tileset_max-1

		Local s:String
		
	  If i<10 Then s="000"+i
	  If i>9 And i<100 Then s="00"+i
	  If i>99 And i<1000 Then s="0"+i
	  If i>999 Then s=i
	
    If FileType("gfx/world/tileset/tileset_"+s)=2 Then

      tile_load(i,c_earth,s,"earth")
      tile_load(i,c_gras,s,"gras")
      tile_load(i,c_water,s,"water")
			tile_load(i,c_deep_water,s,"deepwater")
				
    End If

    loadbar("Loading Tilesets",i,tileset_max)

  Next

End Function

