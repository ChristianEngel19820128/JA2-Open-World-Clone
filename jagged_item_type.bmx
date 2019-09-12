




Function item_types_load()

	If FileType("config/item/item_list.txt")=1 Then

	Local flist:TStream=ReadFile("config/item/item_list.txt")
	
  For Local i=0 To item_type_max-1


		Local s:String
		
	  If i<10 Then s="000"+i
	  If i>9 And i<100 Then s="00"+i
	  If i>99 And i<1000 Then s="0"+i
	  If i>999 Then s=i
	
		
		If FileType("config/item/item_"+s+".txt")=1 Then
	
	    Local file:TStream=ReadFile("config/item/item_"+s+".txt")
	
      item_type[i]=1


      If Not Eof(flist) Then
        item_type_link[i]=ReadLine(flist)
      Else
        Print "Error on Itemlist"
        item_type_link[i]=String(i)
      End If


      ReadLine(file)
      item_type_name[i]=ReadLine(file)

      ReadLine(file)
      Local imgpath:String=ReadLine(file)

		  If FileType("gfx/item/"+imgpath)=1 Then
		    item_type_img[i]=LoadImage("gfx/item/"+imgpath,0)
        MidHandleImage(item_type_img[i])
      End If

      Local g

      'groups

      ReadLine(file)

      For Local k=0 To 2

			  Select ReadLine(file)
			
	        Case "none"
	          g=group_none
	
					Case "weapon"
			      g=group_weapon
			
			    Case "knife"
			      g=group_knife
					
			    Case "throwingknife"
			      g=group_throwingknife
			
			    Case "machete"
			      g=group_machete
			
			    Case "brassknuckles"
			      g=group_brassknuckles
			
			    Case "bat"
			      g=group_bat
			
			    Case "pistol"
			      g=group_pistol
			
			    Case "rifle"
			      g=group_rifle
			
			    Case "mpk"
			      g=group_mpk
			
				  Case "mp"
			      g=group_mp

	        Case "assaultrifle"
			      g=group_assaultrifle
			
	        Case "lmg"
			      g=group_lmg
						
				  Case "shotgun"
			      g=group_shotgun
			
	        Case "revolver"
			      g=group_revolver
			
	        Case "smg"
			      g=group_smg			
			
	        Case "mortar"
			      g=group_mortar
			
	        Case "rocketlauncher"
			      g=group_rocketlauncher
						
	        Case "magazine"
			      g=group_magazine
						
	        Case "ammo"
			      g=group_ammo
						
	        Case "armorpiercing"
			      g=group_armorpiercing
									
	        Case "hollowpoint"
			      g=group_hollowpoint
						
	        Case "subsonic"
			      g=group_subsonic
									
	        Case "grenade"
			      g=group_grenade
			
	        Case "shell"
			      g=group_shell
						
	        Case "rocket"
			      g=group_rocket
						
	        Case "explosive"
			      g=group_explosive
						
	        Case "detonator"
			      g=group_detonator
			
			    Case "addon"
			      g=group_addon
						
			    Case "scope"
			      g=group_scope
						
			    Case "supressor"
			      g=group_supressor
						
			    Case "bipod"
			      g=group_bipod
						
			    Case "grenadelauncher"
			      g=group_grenadelauncher
			
			    Case "light"
			      g=group_light
			
			    Case "flashlight"
			      g=group_flashlight
			
					Case "glowstick"
			      g=group_glowstick
			
					Case "weaponlight"
			      g=group_weaponlight
			
				  Case "laserpointer"
			      g=group_laserpointer
						
				  Case "gear"
			      g=group_gear

			    Case "backpack"
			      g=group_backpack
			
			    Case "vest"
			      g=group_vest
			
			    Case "protectionvest"
			      g=group_protectionvest
			
			    Case "goggles"
			      g=group_goggles
			
			    Case "watch"
			      g=group_watch
			
			    Case "headgear"
			      g=group_headgear
			
			    Case "pants"
			      g=group_pants
			
			    Case "shirt"
			      g=group_shirt
			
			    Case "tool"
			      g=group_tool
			
			    Case "compass"
			      g=group_compass
			
			    Case "canopener"
			      g=group_canopener
			
			    Case "crowbar"
			      g=group_crowbar
			
			    Case "monkeywrench"
			      g=group_monkeywrench
			
			    Case "wirecutter"
			      g=group_wirecutter
			
			    Case "lighter"
			      g=group_lighter
			
			    Case "camouflage"
			      g=group_camouflage
			
			    Case "key"
			      g=group_key
			
			    Case "keycard"
			      g=group_keycard
			
			    Case "medipack"
			      g=group_medipack
			
			    Case "toolbox"
			      g=group_toolbox
			
			    Case "journal"
			      g=group_journal
			
			    Case "tape"
			      g=group_tape
			
			    Case "disk"
			      g=group_disk
			
			    Case "case"
			      g=group_case		
				
			    Case "money"
			      g=group_money
						
			    Case "notes"
			      g=group_notes
						
			    Case "coins"
			      g=group_coins
						
			    Case "drink"
			      g=group_drink
									
			    Case "food"
			      g=group_food
									
			    Case "alcohol"
			      g=group_alcohol
									
			    Case "berries"
			      g=group_berries
						
			    Case "drug"
			      g=group_drug
			
				  Case "weaponpart"
			      g=group_weaponpart
						
					Case "fastloader"
			      g=group_fastloader
			
					Case "picklock"
			      g=group_picklock
			
		    	Case "leverage"
			      g=group_leverage
			
		    	Case "heap"
			      g=group_heap
			
	      End Select

        item_type_group[i,k]=g

      Next
  
      'dualhand
      ReadLine(file)
      item_type_dual[i]=Int(ReadLine(file))

      'inventory slot

      ReadLine(file)

      Select ReadLine(file)

        Case "none"
          g=player_inv_none

        Case "head"
          g=player_inv_head

        Case "face"
          g=player_inv_face

        Case "eyes"
          g=player_inv_eyes

        Case "mouth"
          g=player_inv_mouth

        Case "chest"
          g=player_inv_chest

        Case "back"
          g=player_inv_back

        Case "torso"
          g=player_inv_torso

        Case "belt"
          g=player_inv_belt

        Case "legs"
          g=player_inv_legs

        Case "knees"
          g=player_inv_knees

        Case "foot"
          g=player_inv_foot

        Case "holster"
          g=player_inv_holster

        Case "shoulders"
          g=player_inv_shoulders

      End Select

      item_type_inv_slot[i]=g

      'used spaces
      ReadLine(file)
      item_type_space[i]=Int(ReadLine(file))

      'used room
      ReadLine(file)
      item_type_room[i]=Int(ReadLine(file))

      'is supressed
      ReadLine(file)
      item_type_supressed[i]=Int(ReadLine(file))

      'addons
      ReadLine(file)
      item_type_supressor[i]=Int(ReadLine(file))

      ReadLine(file)
      item_type_bipod[i]=Int(ReadLine(file))

      ReadLine(file)
      item_type_scope[i]=Int(ReadLine(file))

      ReadLine(file)
      item_type_grenade[i]=Int(ReadLine(file))

      ReadLine(file)
      item_type_laser[i]=Int(ReadLine(file))


      'caliber

      For Local k=0 To 1

        ReadLine(file)

        Select ReadLine(file)
          Case "none"
            g=cal_none

          Case "cal_9mm"
            g=cal_9mm

          Case "cal_9mmHS"
            g=cal_9mmHS

          Case "cal_9mmPB"
            g=cal_9mmPB

          Case "cal_9mmSS"
            g=cal_9mmSS

          Case "cal_10mm"
            g=cal_10mm

          Case "cal_10mmHS"
            g=cal_10mmHS

          Case "cal_10mmPB"
            g=cal_10mmPB

          Case "cal_p357"
            g=cal_p357

          Case "cal_p357HS"
            g=cal_p357HS

          Case "cal_p357PB"
            g=cal_p357PB

          Case "cal_p45acp"
            g=cal_p45acp

          Case "cal_p45acpHS"
            g=cal_p45acpHS

          Case "cal_p45acpPB"
            g=cal_p45acpPB

          Case "cal_545x39mm"
            g=cal_545x39mm

          Case "cal_545x39mmHS"
            g=cal_545x39mmHS

          Case "cal_545x39mmPB"
            g=cal_545x39mmPB

          Case "cal_556x45mm"
            g=cal_556x45mm

          Case "cal_556x45mmHS"
            g=cal_556x45mmHS

          Case "cal_556x45mmPB"
            g=cal_556x45mmPB

          Case "cal_556x45mmSS"
            g=cal_556x45mmSS

          Case "cal_570x28mm"
            g=cal_570x28mm

          Case "cal_570x28mmHS"
            g=cal_570x28mmHS

          Case "cal_570x28mmPB"
            g=cal_570x28mmPB

          Case "cal_762x39mm"
            g=cal_762x39mm

          Case "cal_762x39mmHS"
            g=cal_762x39mmHS

          Case "cal_762x39mmPB"
            g=cal_762x39mmPB

          Case "cal_762x51mm"
            g=cal_762x51mm

          Case "cal_762x51mmHS"
            g=cal_762x51mmHS

          Case "cal_762x51mmPB"
            g=cal_762x51mmPB

          Case "cal_12x70"
            g=cal_12x70

          Case "cal_12x70slug"
            g=cal_12x70slug

          Case "cal_12x70buckshot"
            g=cal_12x70buckshot

        End Select

        If k=0 Then
          item_type_kaliber[i]=g
        Else
          item_type_kaliber_type[i]=g
        End If

      Next


      'type magazine
      ReadLine(file)
      item_type_magazin[i]=Int(ReadLine(file))

      'type ammo
      ReadLine(file)
      item_type_ammo[i]=Int(ReadLine(file))

      'damage
      ReadLine(file)
      item_type_damage[i]=Int(ReadLine(file))

      'range
      ReadLine(file)
      item_type_range[i]=Int(ReadLine(file))

      'stack and space

      ReadLine(file)

      Local st=Int(ReadLine(file))
      If st>item_stack_max Then
        item_type_stack[i]=item_stack_max
      Else
        item_type_stack[i]=st
      End If

      ReadLine(file)
      item_type_contain[i]=Int(ReadLine(file))




      'light and color

      ReadLine(file)
      item_type_light[i]=Int(ReadLine(file))
      ReadLine(file)
      item_type_light_range[i]=Int(ReadLine(file))
      ReadLine(file)
      item_type_light_duration[i]=Int(ReadLine(file))
      ReadLine(file)
      item_type_light_r[i]=Int(ReadLine(file))
      item_type_light_g[i]=Int(ReadLine(file))
      item_type_light_b[i]=Int(ReadLine(file))


      'values
      ReadLine(file)
      For Local k=0 To item_value_max-1
        item_type_value[i,k]=Int(ReadLine(file))
      Next

      'slots and capacity
      ReadLine(file)
      Local sl=Int(ReadLine(file))
      If sl>item_slot_max Then
        item_type_slots[i]=item_slot_max
      Else
        item_type_slots[i]=sl
      End If

      ReadLine(file)
      For Local k=0 To item_slot_max-1
        Local ca=Int(ReadLine(file))
        If ca>item_capacity_max Then
          item_type_slot_capacity[i,k]=item_capacity_max
        Else
          item_type_slot_capacity[i,k]=ca
        End If
      Next
	
		  CloseFile(file)
		
		End If

	  loadbar("Load Item Types",i,item_type_max)

  Next

  CloseFile(flist)

  End If

End Function




Function item_get_type_index(item:String)

  Local f=False
  Local i=0
  While i<item_type_max And f=False

    If item_type_link[i]=item Then
      f=True
      Return i
    Else
      i:+1
    End If

  Wend

  Return -1

End Function







