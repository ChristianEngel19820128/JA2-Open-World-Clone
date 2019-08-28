
Function merc_anim_load()

  Local x
  Local y

  Local i
  Local k
  Local j
  Local l


  While i<sex_max
   j=0
  While j<anim_max

    y:+1

    If FileType("gfx/world/merc/"+i+"_"+j+".png")>0 Then

    If FileType("gfx/world/merc/"+i+"_"+j+".txt")>0 Then

      Local file:TStream=ReadFile("gfx/world/merc/"+i+"_"+j+".txt")

      img_merc_dx[i,j]=ReadInt(file)
      img_merc_dy[i,j]=ReadInt(file)
      img_merc_count[i,j]=ReadInt(file)

      For k=0 To anim_align_max-1
      For l=0 To img_merc_count[i,j]-1
        img_merc_offx[i,j,k,l]=ReadInt(file)
        img_merc_offy[i,j,k,l]=ReadInt(file)
      Next
			Next

      CloseStream file

      img_merc[i,j]=LoadPixmap("gfx/world/merc/"+i+"_"+j+".png")

      x:+1

    End If

    End If

    loadbar("Loading Merc Grafics",y,sex_max*anim_max)

   j:+1
  Wend
   i:+1
  Wend

  Print "anim files loaded "+x

End Function


