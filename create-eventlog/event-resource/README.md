## How to create rc file

1. create .mc file 
   attention : Line break required on last line 

2. open visual studio and open developer command prompt from tool menu 
3. input following command "mc <filename>.mc" 
```
ms provider.mc   
``` 
4. after 3, create .rc and .f file 
```
rc.exe provider.rc
``` 

5. make dll following command. 
```
link.exe /NOENTRY /MACHINE:X64 /DLL provider.res 
``` 

6. inclde header file in your source file and build 
7. set registry key 
8. finally run your app! 


## Fix


