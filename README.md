# JA2-Open-World-Clone
This JA2 Open World Clone is written in BlitzMax and it's non OOP. All is none mixed structured code and all properties are global in the application. Except local loop or buffer variables. The properties are organized and named as objects of a logical type, like a soldier underline and his values. That's realy Oldscool. This produce long var-names like OOP do. So sometimes I buffer them in calculations. There are no dynamic arrays. This limits the RAM usage to the real maximum what is needed and it's save the time for reallocations. In except it will explode.

The startfile is "jagged.bmx". This file contains only the minimal code for starting a BlitzMax application in an endless loop until end is true.
Download the repo, compile "jagged.bmx" and Start should work.

It's a Long-Term-Project in progress. Realy it's in progress and I see it's a realy long term. But I have to much time, sometimes and as long I don't have to cut the lawn. Updates of repo can wait, as long there is no stable version. Uploads of a compiled version comes anytime. At the moment it makes no sense. Will see in future.

Don't be affraid the code is denglish. I try my best.

The changes from Int to lower Shorts and Bytes produces more than trouble. The RAM usage don't change, because all values will saved as Int in RAM. So I made a step back. For saving files the usage of mostly Bytes persist. The gameworld persist big and dynamic. In this case the global world must temporary be saved and loaded on filelevel. At the moment the max of the worldheightmap is 2048x2048 fields. On a let's say 1024x1024 field with a X,Y of 256 and a Z of 5 (yes there is a Z of more then 1) you can calculate that are many Bytes. Let me calculate that for you:

1024 x 1024 = 1.048.576 fields on GPS map
256 x 256 x 5 = 327.680 fields on world map
= 343.597.383.680 Bytes per field property (if it's a Byte)
~320 GB of RAW Data per field property

So there is many to read. The reality is: the most fields are empty, because they are air. That's 3/4 or more of all fields. So I can ignore them in certain cases. In other words the save and load world functions must reworked with a RLE run length encoding.

Another Case then loadingtimes and space is the FPS. If you ever tried to realize pathfinding you know. This costs time you need for other things. Multitasking is an Illusion. The difference is: If you step all the time truth your tasks or to end one step before starting the next one. It's like projects. Start many end nothing. Digressed.
Short: So I have reworked the Pathfinding of my A* algorithm.

I hope, I reach a state that is more then a techdemo anytime.

As I forgot. There is a file exporter. In this file there are functions to export grafics from STI file format. Its not buggy but a bit lazy and dirty. It works. I'm sure, I will rework it anytime. But it will never become a tool. It was always tought as edit and go source.

In all it's hard to code something useful. A project rises really fast to an amount and a point where I need to learn how to handle this. Except the time you can spend on it.

Oh, my tabstop in IDE is set to 2 spaces. Don't wonder about misrepresentation in repo. Sometimes I'm forced to use tab instead of spaces. But I like spaces and the BMax IDE don't convert tab to space.

BlitzMax offers you to compile at Windows, Unix/Linux or MacOS. If you have the compiler naturally. The compiler source can be found on Github "https://github.com/blitz-research".

The Trackerdata is a bit out of Date, but I will update it soon. The Icebox (to do list) is full. And I see there will be added much more whats to be done.
Trackerlink: https://www.pivotaltracker.com/n/projects/2348070
