

Function tile_load(i,j,s:String)

  If FileType("gfx/tilesets/"+i+"/"+s+".png")=1 Then
    img_tile[i,j]=LoadPixmap("gfx/tilesets/"+i+"/"+s+".png")
  End If

End Function




Function tiles_load()

  For Local i=0 To tileset_max-1

    If FileType("gfx/tilesets/"+i)=2 Then

      tile_load(i,c_earth,"earth")
      tile_load(i,c_gras,"gras")
      tile_load(i,c_water,"water")
				
    End If

    loadbar("Loading Tilesets",i,tileset_max)

  Next

End Function

