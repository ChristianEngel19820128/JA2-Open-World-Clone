
Function map_generate_vegetation()


End Function




Function map_generate_urban()

  For Local i=0 To map_x-1
  For Local k=0 To map_y-1

    If map_height[i,k]>5 Then
      If Rand(0,10000)<50 Then

        Local g=Rand(0,16-map_height[i,k])

        For Local j=0 To Rand(0,g)
        For Local l=0 To Rand(0,g)

          If i+j<map_x And k+l<map_x Then
            If map_height[i+j,k+l]>5 Then
              map_urban[i+j,k+l]=Rand(0,g)
              If map_urban[i+j,k+l]>8 Then map_urban[i+j,k+l]=8
              map_vegetation[i+j,k+l]=0
              map_debris[i,k]=0
            End If
          End If

        Next
        Next

        For Local j=0 To Rand(0,g)
        For Local l=0 To Rand(0,g)

          If i-j>0 And k-l>0 Then
            If map_height[i-j,k-l]>5 Then
              map_urban[i-j,k-l]=Rand(0,g)
              If map_urban[i-j,k-l]>8 Then map_urban[i-j,k-l]=8
              map_vegetation[i-j,k-l]=0
              map_debris[i,k]=0
            End If
          End If

        Next
        Next

        For Local l=0 To Rand(0,g)
        For Local j=0 To Rand(0,g)

          If i-j>0 And k+l<map_x Then
            If map_height[i-j,k+l]>5 Then
              map_urban[i-j,k+l]=Rand(0,g)
              If map_urban[i-j,k+l]>8 Then map_urban[i-j,k+l]=8
              map_vegetation[i-j,k+l]=0
              map_debris[i,k]=0
            End If
          End If

        Next
        Next

        For Local l=0 To Rand(0,g)
        For Local j=0 To Rand(0,g)

          If i+j<map_x And k-l>0 Then
            If map_height[i+j,k-l]>5 Then
              map_urban[i+j,k-l]=Rand(0,g)
              If map_urban[i+j,k-l]>8 Then map_urban[i+j,k-l]=8
              map_vegetation[i+j,k-l]=0
              map_debris[i,k]=0
            End If
          End If

        Next
        Next

      End If

    End If

  Next

    loadbar("Generate Map Urban",i,map_x)

  Next

End Function
