## How to create rc file

1. create .mc file 
   attention : Line break required on last line 

2. open visual studio and open developer command prompt from tool menu 

3. input following command "mc <filename>.mc" 
```
ms provider.mc   
```  
   
4. create .rc and .f file 
```
rc.exe provider.rc
```  

5. make dll following command. 
```
link.exe /NOENTRY /MACHINE:X64 /DLL provider.res 
``` 

6. inclde header file and res file in your project and build 
   
7. set registry key 
   registry path is following(if you want to write system eventlog, you choose not Application but System path) 
   ```
   \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application  
   ``` 
   you make sub key in Application key.  
   Sub key name is should be the same of DLL name!!!!   
    
   And you make 2 values   
    
   1st   
   name - EventMessageFile   
   kind - REG_EXPAND_SZ   
   data - path to dll.mui( in my PC, this is C:\windows\system32\ja-jp\\***.dll.mui)  
   2nd  
   name - TypesSupported  
   kind - REG_DWORD  
   data - 0x00000000  
   
8. rename DLL to dll.mui and save in  C:\windows\system32\ja-jp\\***.dll.mui 
  
9. finally , run your app 


