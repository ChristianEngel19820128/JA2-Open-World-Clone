
Strict

SeedRnd MilliSecs()

Global wx=1920
Global wy=1080
Global wd=0
Global wh=0

Graphics wx,wy,wd,wh,graphics_backbuffer

SetBlend alphablend


Global a_count



Function loadbar(t:String,i=0,m=1)

        SetClsColor(0,0,0)
		    Cls
		    SetColor(255,255,255)
		    Local s:String="Hier könnte ein Tipp stehen!"
		    DrawText(s,wx/2-TextWidth(s)/2,wy/2-TextHeight(s)/2)
		    DrawText(t,10,wy-60)
		    DrawRect(0,wy-35,i*wx/m,15)
		    Flip
		
		    If KeyHit(key_escape) Then End

End Function


Include "jagged_anim_header.bmx"


  Global sti_c[3,256]

  Global sti_offx[512]
  Global sti_offy[512]

  Global sti_w[512]
  Global sti_h[512]

  Global sti_images
  Global sti_direction[512]
  Global sti_size[512]
  Global sti_size1[512]


  Global sti_pix:Int[512,512,512]






Function faces()


		Local s:String
		
  For Local i=0 To 255

	  If i<10 Then s="0"+i
	  If i>9 Then s=i
	
	
	If FileType("gfx/faces/faces/"+s+".sti") = 1 Then

    sti_load("faces/faces/"+s)



  Local k
  Local l

  Local x
  Local y

  Local argb

  Local width
  Local height

  Local file:TStream

	Local pparts:TPixmap


  For k=0 To sti_images-1
		If sti_w[k]>width Then width=sti_w[k]
		If sti_h[k]>height Then height=sti_h[k]
	Next
	
	
	'pparts = CreatePixmap(width*sti_images,height,PF_RGBA8888)
  pparts = CreatePixmap(width,height,PF_RGBA8888)

	ClearPixels(pparts)
		
		

  For l=0 To 0'sti_images-1



    'body maskieren
    For x=0 To sti_w[l]
    For y=0 To sti_h[l]

      If sti_pix[l,x,y] <> 0 Then

        argb = sti_c[0,sti_pix[l,x,y]] Shl 16 + sti_c[1,sti_pix[l,x,y]] Shl 8 + sti_c[2,sti_pix[l,x,y]]

        WritePixel(pparts,width*l+x+sti_offx[l],y+sti_offy[l],argb)

      End If

    Next
    Next

  Next

			pparts=MaskPixmap(pparts,0,0,0)
			
	
	  If i<10 Then s="000"+i
	  If i>9 And i<100 Then s="00"+i
	  If i>99 And i<1000 Then s="0"+i
	  If i>999 Then s=i

			
			
      SavePixmapPNG(pparts,"gfx/faces/"+s+".png")


      If KeyHit(key_escape) Then End

End If

  Next



End Function

'faces()







Function sti_load(name:String)

  Local  file:TStream

  Local x
  Local y

  Local i
  Local k
  Local j
  Local l


  Local cc
  Local lc

  Local flag



  file=ReadFile("gfx/"+name+".sti")


    For i=0 To 15
      ReadByte(file)
    Next

    flag = ReadByte(file) + ReadByte(file) Shl 8 + ReadByte(file) Shl 16 + ReadByte(file) Shl 32

    Print "Flag "+flag

    For i=20 To 27
      ReadByte(file)
    Next


    sti_images=ReadByte(file)
    sti_images=sti_images+256*ReadByte(file) 
    Print "Images " + sti_images

    For i=30 To 63
      ReadByte(file)
    Next


   For k=0 To 255
     For i=0 To 2
       sti_c[i,k] = ReadByte(file)
     Next
   Next

    For k=0 To sti_images-1

	    sti_size1[k] = ReadByte(file) + ReadByte(file) Shl 8 + ReadByte(file) Shl 16 + ReadByte(file) Shl 32
	
	    sti_size[k] = ReadByte(file) + ReadByte(file) Shl 8 + ReadByte(file) Shl 16 + ReadByte(file) Shl 32
	
	    sti_offx[k] = ReadByte(file) - ReadByte(file)
	    sti_offy[k] = ReadByte(file) - ReadByte(file)
	    sti_h[k] = ReadByte(file)
	    sti_h[k]=sti_h[k]+256*ReadByte(file) 
	    sti_w[k] = ReadByte(file)
		  sti_w[k]=sti_w[k]+256*ReadByte(file) 
	

    Next


  For k=0 To sti_images-1

  x=0
  y=0

  For i=0 To sti_size[k]-1


    cc=ReadByte(file)

    If cc=0 Or x>=sti_w[k] Then
      y:+1
      x=0
    End If

    If cc>128 Then
      For j=0 To cc-129

        sti_pix[k,x,y]=0
        x:+1

      Next
    Else
      If cc<>0 Then

        lc=cc
        
        For j=0 To lc-1

        cc=ReadByte(file)

        i:+1
        sti_pix[k,x,y]=cc
        x:+1

        Next

      End If
    End If

  Next	
	
  Next

  If flag=41 Then

    For k=0 To sti_images-1

		    For i=0 To 7
		      ReadByte(file)
		    Next
		    sti_direction[k] = ReadByte(file)
		    For i=0 To 6
		      ReadByte(file)
		    Next

    Next

  End If

  CloseStream file


  'alle bilder geladen




End Function



Function sti_extract_merc(anim,sex)

  Local i
  Local k
  Local l
  Local j

  Local x
  Local y

  Local o


  Local argb
	Local images
  Local frames[8]

  Local width
  Local height

  Local file:TStream

	Local pparts:TPixmap

  For k=0 To sti_images-1
     If sti_direction[k]>0 Then
       o:+1
       frames[o-1]:+1
     Else
       frames[o-1]:+1
     End If
  Next

  For k=0 To 7
    If images<frames[k] Then images=frames[k]
  Next


  For k=0 To sti_images-1
		If sti_w[k]>width Then width=sti_w[k]
		If sti_h[k]>height Then height=sti_h[k]
	Next
	
	
	pparts = CreatePixmap(width*images,height*anim_align_max,PF_RGBA8888)
	ClearPixels(pparts,140 Shl 16)
		
		
    'indexfile erstellen

    file=WriteFile("gfx/merc/"+sex+"_"+anim+".txt")
		WriteInt(file,width)
		WriteInt(file,height)
		WriteInt(file,images)
		
			Select o
				Case 1
				
				  i=0
				  For k=0 To anim_align_max-1
				  For l=0 To images-1
						If k=3 And i<sti_images Then
				      WriteInt(file,sti_offx[i])
		          WriteInt(file,sti_offy[i])
							i:+1
						Else
				      WriteInt(file,0)
		          WriteInt(file,0)					
						End If
					Next
					Next
															
				Case 4
					
					i=0
				  For k=0 To anim_align_max-1
				  For l=0 To images-1					
						If k Mod 2 = 0 And i<sti_images Then
				      WriteInt(file,0)
		          WriteInt(file,0)
							i:+1
						Else
							WriteInt(file,sti_offx[i])
		          WriteInt(file,sti_offy[i])					
						End If	
					Next
					Next										
					
				Case 8
				
				  i=0
				  For k=0 To anim_align_max-1
				  For l=0 To images-1
						If i<sti_images Then		
						  WriteInt(file,sti_offx[i])'k*(images-1)+l])
		      	  WriteInt(file,sti_offy[i])'k*(images-1)+l])
							i:+1
		        Else
				      WriteInt(file,0)
		          WriteInt(file,0)	
		        End If	
					Next
					Next
					
				End Select
		
    CloseStream file

  l=0
  j=0

  For k=0 To sti_images-1

     If sti_direction[k]>0 Then
       l:+1
       j=0
     End If

    'body maskieren
    For x=0 To sti_w[k]-1
    For y=0 To sti_h[k]-1

			Select o
				Case 1
					i=3
				Case 4
					i=(l-1)*2+1
				Case 8
					i=l-1
			End Select

      If sti_pix[k,x,y] <> 0 Then


      argb = sti_c[0,sti_pix[k,x,y]] Shl 16 + sti_c[1,sti_pix[k,x,y]] Shl 8 + sti_c[2,sti_pix[k,x,y]]

      'hair
      If sti_c[0,sti_pix[k,x,y]] > 100 And sti_c[1,sti_pix[k,x,y]] = 0 And sti_c[2,sti_pix[k,x,y]] < 50 Then
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      'shirt
      If sti_c[0,sti_pix[k,x,y]] = 0 And sti_c[1,sti_pix[k,x,y]] = 0 And sti_c[2,sti_pix[k,x,y]] > 0 Then
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      'skin
      If (sti_c[0,sti_pix[k,x,y]] > 0 And sti_c[1,sti_pix[k,x,y]] = 0 And sti_c[2,sti_pix[k,x,y]] > 0) And Not (sti_c[0,sti_pix[k,x,y]] > 100 And sti_c[1,sti_pix[k,x,y]] = 0 And sti_c[2,sti_pix[k,x,y]] < 50) Then
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      'pants
      If sti_c[0,sti_pix[k,x,y]] = 0 And sti_c[1,sti_pix[k,x,y]] > 0 And sti_c[2,sti_pix[k,x,y]] = 0 Then
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      'equip
      If sti_c[0,sti_pix[k,x,y]] > 0 And sti_c[1,sti_pix[k,x,y]] > 0 And sti_c[2,sti_pix[k,x,y]] > 0 Then
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      'misc
      'vorletzte farbe
      If sti_pix[k,x,y] = 254 Then
        argb = 0
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      'blood
      If (sti_c[0,sti_pix[k,x,y]] = 63 And sti_c[1,sti_pix[k,x,y]] = 0 And sti_c[2,sti_pix[k,x,y]] = 0) Then
        WritePixel(pparts,width*j+x,height*i+y,argb)
      End If

      End If

    Next
    Next

   j:+1

  Next




			pparts=MaskPixmap(pparts,140,0,0)
      SavePixmapPNG(pparts,"gfx/merc/"+sex+"_"+anim+".png")


      If KeyHit(key_escape) Then End


  a_count:+1


  loadbar("load merc",a_count,anim_max)


End Function





Function sti_extract_tile(s:String)

  Local i
  Local k
  Local l

  Local x
  Local y

  Local argb

  Local width
  Local height

  Local file:TStream

	Local pparts:TPixmap


  For k=0 To sti_images-1
		If sti_w[k]>width Then width=sti_w[k]
		If sti_h[k]>height Then height=sti_h[k]
	Next
	
	
	pparts = CreatePixmap(width*sti_images,height,PF_RGBA8888)
	ClearPixels(pparts)
		
		

  For l=0 To sti_images-1



    'body maskieren
    For x=0 To sti_w[l]
    For y=0 To sti_h[l]

      If sti_pix[l,x,y] <> 0 Then

        argb = sti_c[0,sti_pix[l,x,y]] Shl 16 + sti_c[1,sti_pix[l,x,y]] Shl 8 + sti_c[2,sti_pix[l,x,y]]

        WritePixel(pparts,width*l+x+sti_offx[l],y+sti_offy[l],argb)

      End If

    Next
    Next

  Next



			pparts=MaskPixmap(pparts,0,0,0)
      SavePixmapPNG(pparts,"gfx/tilesets/0/"+s+".png")


      If KeyHit(key_escape) Then End



End Function




Function do()


End Function


Function load_tileset()

sti_load("tilesets/tilesets/EARTH")
sti_extract_tile("earth")

sti_load("tilesets/tilesets/GRASS")
sti_extract_tile("gras")

sti_load("tilesets/tilesets/DEEPLAKE")
sti_extract_tile("water")

End Function


Function load_sti_merc(name:String,anim,sex)

sti_load(name)
sti_extract_merc(anim,sex)

End Function


m_merc()
'f_merc()


Function m_merc()

a_count=0

load_sti_merc("merc\m_merc\M_N_STD",anim_stand,0)
load_sti_merc("merc\m_merc\M_N_WALK",anim_walk,0)
load_sti_merc("merc\m_merc\M_N_RUN",anim_run,0)

load_sti_merc("merc\m_merc\M_N_PRNE",anim_prone,0)
load_sti_merc("merc\m_merc\M_N_CRCH",anim_crouch,0)
load_sti_merc("merc\m_merc\M_N_SWAT",anim_swat,0)

load_sti_merc("merc\m_merc\M_CLIMB",anim_climb,0)
load_sti_merc("merc\m_merc\M_HOP",anim_jump,0)


load_sti_merc("merc\m_merc\M_FALL",anim_fall_back,0)
load_sti_merc("merc\m_merc\M_FALLF",anim_fall_forward,0)


load_sti_merc("merc\m_merc\M_THROW",anim_throw,0)
load_sti_merc("merc\m_merc\M_LOB",anim_throw_low,0)

load_sti_merc("merc\m_merc\M_OPEN",anim_open,0)
load_sti_merc("merc\m_merc\M_PICKUP",anim_pickup_item,0)


load_sti_merc("merc\m_merc\M_P_BRTH",anim_stand_p,0)
load_sti_merc("merc\m_merc\M_P_SHLO",anim_stand_p_shoot_low,0)
load_sti_merc("merc\m_merc\M_N_SHOT",anim_stand_p_shoot,0)
load_sti_merc("merc\m_merc\M_DBL_BR",anim_stand_dbl,0)
load_sti_merc("merc\m_merc\M_DBLSHT",anim_stand_dbl_shoot,0)
load_sti_merc("merc\m_merc\M_N_C_AI",anim_crouch_shoot,0)
load_sti_merc("merc\m_merc\MC_DBLSH",anim_crouch_dbl_shoot,0)
load_sti_merc("merc\m_merc\M_DB_PRN",anim_prone_dbl_shoot,0)



load_sti_merc("merc\m_merc\M_BREATH",anim_stand_r,0)
load_sti_merc("merc\m_merc\M_BRETH2",anim_stand_r_up,0)

load_sti_merc("merc\m_merc\M_R_C",anim_crouch_r_up,0)
load_sti_merc("merc\m_merc\M_R_PRN",anim_prone_r,0)



load_sti_merc("merc\m_merc\M_R_WALK",anim_walk_r,0)

load_sti_merc("merc\m_merc\M_R_RUN",anim_run_r,0)
load_sti_merc("merc\m_merc\M_R_SWAT",anim_swat_r,0)
load_sti_merc("merc\m_merc\M_R_PRN",anim_crawl_r,0)


load_sti_merc("merc\m_merc\M_RAISE",anim_raise_r_up,0)
load_sti_merc("merc\m_merc\M_SR_AIM",anim_shoot_r,0)

load_sti_merc("merc\m_merc\M_CR_AIM",anim_crouch_shoot_r,0)


load_sti_merc("merc\m_merc\MW_N_STD",anim_w_stand,0)
load_sti_merc("merc\m_merc\MW_N_WAL",anim_w_walk,0)
load_sti_merc("merc\m_merc\MW_N_SHT",anim_w_shoot,0)

load_sti_merc("merc\m_merc\MW_DBL",anim_w_dbl_shoot,0)

load_sti_merc("merc\m_merc\MW_THROW",anim_w_throw,0)
load_sti_merc("merc\m_merc\MW_DIE",anim_w_die_1,0)
load_sti_merc("merc\m_merc\MW_DIE2",anim_w_die_2,0)
load_sti_merc("merc\m_merc\MW_FALL",anim_w_fall,0)

load_sti_merc("merc\m_merc\MW_R_STD",anim_w_stand_r,0)
load_sti_merc("merc\m_merc\MW_R_WAL",anim_w_walk_r,0)
load_sti_merc("merc\m_merc\MW_SR_AI",anim_w_shoot_r,0)

load_sti_merc("merc\m_merc\MW_SWIM",anim_w_swim,0)
load_sti_merc("merc\m_merc\MW_TRED",anim_w_tred,0)


load_sti_merc("merc\m_merc\M_DIEBAC",anim_die_back,0)
load_sti_merc("merc\m_merc\M_DIEFWD",anim_die_forward,0)
load_sti_merc("merc\m_merc\M_DIEHD",anim_die_hard,0)
load_sti_merc("merc\m_merc\M_DIEHDB",anim_die_hard_burst,0)
load_sti_merc("merc\m_merc\M_DIEJFK",anim_die_jfk,0)


End Function






Function f_merc()

a_count=0

load_sti_merc("merc\f_merc\F_N_STD",anim_stand,1)
load_sti_merc("merc\f_merc\F_N_WALK",anim_walk,1)
load_sti_merc("merc\f_merc\F_N_RUN",anim_run,1)

load_sti_merc("merc\f_merc\F_N_PRNE",anim_prone,1)
load_sti_merc("merc\f_merc\F_N_CRCH",anim_crouch,1)
load_sti_merc("merc\f_merc\F_N_SWAT",anim_swat,1)

load_sti_merc("merc\f_merc\F_CLIMB",anim_climb,1)
load_sti_merc("merc\f_merc\F_HOP",anim_jump,1)
load_sti_merc("merc\f_merc\F_FALL",anim_fall_back,1)
load_sti_merc("merc\f_merc\F_FALLF",anim_fall_forward,1)


load_sti_merc("merc\f_merc\F_THROW",anim_throw,1)
load_sti_merc("merc\f_merc\F_LOB",anim_throw_low,1)

load_sti_merc("merc\f_merc\F_OPEN",anim_open,1)
load_sti_merc("merc\f_merc\F_PICKUP",anim_pickup_item,1)


load_sti_merc("merc\f_merc\F_P_BRTH",anim_stand_p,1)
load_sti_merc("merc\f_merc\F_P_SHLO",anim_stand_p_shoot_low,1)

load_sti_merc("merc\f_merc\F_N_SHOT",anim_stand_p_shoot,1)
load_sti_merc("merc\f_merc\F_DBL_BR",anim_stand_dbl,1)

load_sti_merc("merc\f_merc\F_DBLSHT",anim_stand_dbl_shoot,1)


load_sti_merc("merc\f_merc\F_N_C_AI",anim_crouch_shoot,1)

load_sti_merc("merc\f_merc\FC_DBLSH",anim_crouch_dbl_shoot,1)


load_sti_merc("merc\f_merc\F_DB_PRN",anim_prone_dbl_shoot,1)



load_sti_merc("merc\f_merc\F_BREATH",anim_stand_r,1)
load_sti_merc("merc\f_merc\F_BRETH2",anim_stand_r_up,1)

load_sti_merc("merc\f_merc\F_R_C",anim_crouch_r_up,1)
load_sti_merc("merc\f_merc\F_R_PRN",anim_prone_r,1)


load_sti_merc("merc\f_merc\F_R_WALK",anim_walk_r,1)

load_sti_merc("merc\f_merc\F_R_RUN",anim_run_r,1)
load_sti_merc("merc\f_merc\F_R_SWAT",anim_swat_r,1)
load_sti_merc("merc\f_merc\F_R_PRN",anim_crawl_r,1)


load_sti_merc("merc\f_merc\F_RAISE",anim_raise_r_up,1)



load_sti_merc("merc\f_merc\F_SR_AIM",anim_shoot_r,1)


load_sti_merc("merc\f_merc\F_CR_AIM",anim_crouch_shoot_r,1)


load_sti_merc("merc\f_merc\FW_N_STD",anim_w_stand,1)
load_sti_merc("merc\f_merc\FW_N_WLK",anim_w_walk,1)
load_sti_merc("merc\f_merc\FW_N_SHT",anim_w_shoot,1)

load_sti_merc("merc\f_merc\FW_DBL",anim_w_dbl_shoot,1)

load_sti_merc("merc\f_merc\FW_THRW",anim_w_throw,1)
load_sti_merc("merc\f_merc\FW_DIE",anim_w_die_1,1)
load_sti_merc("merc\f_merc\FW_DIE2",anim_w_die_2,1)
load_sti_merc("merc\f_merc\FW_FALL",anim_w_fall,1)

load_sti_merc("merc\f_merc\FW_R_STD",anim_w_stand_r,1)
load_sti_merc("merc\f_merc\FW_R_WLK",anim_w_walk_r,1)
load_sti_merc("merc\f_merc\FW_SR_AI",anim_w_shoot_r,1)


load_sti_merc("merc\f_merc\FW_SWIM",anim_w_swim,1)
load_sti_merc("merc\f_merc\FW_TRED",anim_w_tred,1)


load_sti_merc("merc\f_merc\F_DIEBAC",anim_die_back,1)
load_sti_merc("merc\f_merc\F_DIEFWD",anim_die_forward,1)
load_sti_merc("merc\f_merc\F_DIEHD",anim_die_hard,1)
load_sti_merc("merc\f_merc\F_DIEHDB",anim_die_hard_burst,1)
load_sti_merc("merc\f_merc\F_DIEJFK",anim_die_jfk,1)


End Function












Global font:timagefont=LoadImageFont("font/arial.ttf",12)
SetImageFont font

SetBlend alphablend

Global now:Int=MilliSecs()
Global ende:Byte=False
Global draw_t:Int=now

Global fps
Global fps_a
Global fps_t
Global fps_c
Global cycle

While ende=False

Cls

now=MilliSecs()

'''''''''''''''''''''''''''''''''''''''''''''''''''''''



do()




'''''''''''''''''''''''''''''''''''''''''''''''''''''''

If MilliSecs()-draw_t>0 Then

SetColor 0,0,0
DrawRect wx-240,0,240,50
SetColor 255,255,255

  DrawText "cycle: "+(MilliSecs()-now),wx-120,10
  DrawText "steps: "+cycle,wx-240,10 
  cycle=0




  fps_c=fps_c+1
  fps=1000/(MilliSecs()-fps_t+1)
  fps_a=fps_a+fps


  DrawText "fps: "+(fps_a/fps_c)+" "+fps,wx-240,30 
  DrawText "cycle: "+(MilliSecs()-fps_t),wx-120,30


  If fps_c>100 Then
   fps_a=fps_a/fps_c
   fps_c=1
  End If

  fps_t=MilliSecs()

  Flip(-1)
  draw_t=MilliSecs()

End If

If KeyHit(key_escape) Then ende=True
Wend

