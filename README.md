---------------------------------------------------------------------------
---------------------------------------------------------------------------

# Francescos vim settings and awesome cheatsheet 

---------------------------------------------------------------------------
---------------------------------------------------------------------------

Intended for personal use, but if anybody find it interesting they are welcome
to have a look.

__To get my settings, after cloning this repository in the ~/.vim directory add a ~/.vimcr file with:__  
> source ~/.vim/.vimrc


## Start of personal cheatsheet

entire file: %  
copy entire file to clipboard: :%y+  


---------------------------------------------------------------------------
### Explorer, commands:

<:Ex :Sex :Vex>		
<% = new file | R = rename(move) file >  

---------------------------------------------------------------------------
### Insert lines:
<o>	open in new line under  
<O>	open in new line under  


<:set nu :set nonu>		turn on and off numbers  
:set mouse=a   causes Vim to see mouse/trackpad   
:set mouse=""  causes mouse/trackpad scrolling just effects the xterm,  
	       but Vim ignores it.  




---------------------------------------------------------------------------
### Markings:

:marks 				to list  
m <mark> 			to mark  
` <mark>			to go to mark  

---------------------------------------------------------------------------
### Operator c:

c + e 		cancella fino a fine parola e entri in insert  
c + $ 		cancella fino a fine linea e endtri in insert  

---------------------------------------------------------------------------
### Operator d:

dd 		cancella lines (e taglia)  
dw 		cancella parola (e taglia)  

---------------------------------------------------------------------------
### Cut/paste and undo redo:

p 		put: incolla  
"+p 		incolla da copia in altra applicazione  
y 		yield: copia  
"+y  
"*y		copia to clipboard (+ and * registers)  
  
u		undo  
ctrl-R		redo  

---------------------------------------------------------------------------
### Handling windows:

 <ctrl-w> <ctrl-w> 	- change from one window to other  
 :e filename       	- edit another file  
 :split filename   	- split window and load another file  
 ctrl-w up arrow   	- move cursor up a window  
 ctrl-w ctrl-w     	- move cursor to another window (cycle)  
 ctrl-w_           	- maximize current window  
 ctrl-w=           	- make all equal size  
 10 ctrl-w+        	- increase window size by 10 lines  
 :vsplit file      	- vertical split  
 :sview file       	- same as split, but readonly  
 :hide             	- close current window  
 :only             	- keep only this window open  
 :ls               	- show current buffers  
 :b 2              	- open buffer #2 in this window  
 :res +5  
 :res -5		- resize  
 :vertical resize 80    - self explanatory  


---------------------------------------------------------------------------
### End and beginning of file

G gg  		go to end or beginning of file  
<number>G	go to line  

---------------------------------------------------------------------------


:#,#s/vecchio/nuovo/g  	dove #,# sono i numeri che delimitano  
                	il gruppo di linee in cui si vuole sostituire.  

:%s/vecchio/nuovo/g    	per cambiare ogni occorrenza nell'intero file.  

:%s/vecchio/nuovo/gc   	per trovare ogni occorrenza nell'intero file  
                       	ricevendo per ognuna una richiesta se  
			effettuare o meno la sostituzione.  


<ctrl>+I		next  
<ctrl>+O		previus (mark? file?)  

R 			Replace mode  

:bro[wse] ol[dfiles]	shows a list of recent fies!  

---------------------------------------------------------------------------
### To modify many lines:

Move to the start of the first line in your range  
(gg for first line, ^ to move to the start).  
<C-V>  
Move down to the last line in your range:  
Ifoo<ESC>     -inserts whith big I just after you hit <ESC>  

---------------------------------------------------------------------------
### Vimdiff:


:diffthis  
:diffoff  

]c :        - next difference  
[c :        - previous difference  
do          - diff obtain  
dp          - diff put  
zo          - open folded text  
zc          - close folded text  
:diffupdate - re-scan the files for differences  

:copen   to open quickfix
---------------------------------------------------------------------------
### Registers

:reg     acessregisters  
vimx     open vim with clipboard support!  
Ctrl-f   show command line as a file  
Ctrl-r   acess register from command line (:)  
:redir @<register>   
:redir OFF  

