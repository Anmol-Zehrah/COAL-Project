INCLUDE Irvine32.INC
include Macros.inc

.data
copy BYTE 20 DUP(?)
count1 dword 0
flag BYTE 0
len1 Dword ?
len2 DWORD ?
back byte ?
arr BYTE "ABCDEFGHIJKLMNOPQRSTUVWXYZ",0
ans BYTE 20 DUP(?)
pos1 BYTE 20 DUP(?)
pos2 BYTE 20 DUP(?)
row BYTE 2
col BYTE 20
temprow BYTE 2
tempcol BYTE 20
str1	BYTE "--------- Please think of any word, as per your choice! --------- ",0ah,0dh,0ah,0dh,"                                 Step 01 : ",0ah,0dh,"                      ==============================",0ah,0dh,"                                 Table 01 : ",0
str11	BYTE "--------- Please think of any word, as per your choice! --------- ",0ah,0dh,0ah,0dh,"                                 Step 02 : ",0ah,0dh,"                      ==============================",0ah,0dh,"                                 Table 02 : ",0
str2	BYTE "How many letters are there in your word? Answer: ",0
str3	BYTE "Input the Column Number of Letter # ",0
str4    BYTE " : ",0
space   BYTE "                                                                                    ",0
str5	BYTE "Woohoo!! We guessed it right, your word Is = ",0
k       BYTE 1
i    BYTE 5
j    BYTE 0
wcount BYTE ?
str111 byte "Hello, Welcome to our Mind-Reading Game!!.....................: ",0

filehandle DWORD ?
afile BYTE "a.txt", 0
bfile BYTE "b.txt", 0
cfile BYTE "c.txt", 0
dfile BYTE "d.txt", 0
efile BYTE "e.txt", 0
ffile BYTE "f.txt", 0
gfile BYTE "g.txt", 0
hfile BYTE "h.txt", 0
ifile BYTE "i.txt", 0
jfile BYTE "j.txt", 0
kfile BYTE "k.txt", 0
lfile BYTE "l.txt", 0
mfile BYTE "m.txt", 0
nfile BYTE "n.txt", 0
ofile BYTE "o.txt", 0
pfile BYTE "p.txt", 0
qfile BYTE "q.txt", 0
rfile BYTE "r.txt", 0
sfile BYTE "s.txt", 0
tfile BYTE "t.txt", 0
ufile BYTE "u.txt", 0
vfile BYTE "v.txt", 0
wfile BYTE "w.txt", 0
xfile BYTE "x.txt", 0
yfile BYTE "y.txt", 0
zfile BYTE "z.txt", 0

bufferSize = 999990
buffer1 BYTE bufferSize dup(?)
copyarr byte 20 DUP(?)

.code
check PROC
	MOVZX eax,ans[0]

	CMP eax,'A'
	JE LA
		CMP eax,'B'
		JE LB
			CMP eax,'C'
			JE LC
				CMP eax,'D'
				JE LD
					CMP eax,'E'
					JE LEE
						CMP eax,'F'
						JE LF
							CMP eax,'G'
							JE LG
								CMP eax,'H'
								JE LH
									CMP eax,'I'
									JE LI
										CMP eax,'J'
										JE LJ
											CMP eax,'K'
											JE LK
												CMP eax,'L'
												JE LL
													CMP eax,'M'
													JE LM
														CMP eax,'N'
														JE LN
															CMP eax,'O'
															JE LO
																CMP eax,'P'
																JE LP
																	CMP eax,'Q'
																	JE LQ
																		CMP eax,'R'
																		JE LR
																			CMP eax,'S'
																			JE LS
																				CMP eax,'T'
																				JE LTT
																					CMP eax,'U'
																					JE LU
																						CMP eax,'V'
																						JE LV
																							CMP eax,'W'
																							JE LW
																								CMP eax,'X'
																								JE LX
																									CMP eax,'Y'
																									JE LY
																										CMP eax,'Z'
																										JE LZ
LA:
	MOV edx,OFFSET afile
	JMP Last
	
LB:
	MOV edx,OFFSET bfile
	JMP Last
LC:
	MOV edx,OFFSET cfile
	JMP Last
LD:
	MOV edx,OFFSET dfile
	JMP Last
LEE:
	MOV edx,OFFSET efile
	JMP Last	
LF:
	MOV edx,OFFSET ffile
	JMP Last
LG:
	MOV edx,OFFSET gfile
	JMP Last
LH:
	MOV edx,OFFSET hfile
	JMP Last
LI:
	MOV edx,OFFSET ifile
	JMP Last
LJ:
	MOV edx,OFFSET jfile
	JMP Last
LK:
	MOV edx,OFFSET kfile
	JMP Last
LL:
	MOV edx,OFFSET lfile
	JMP Last
LM:
	MOV edx,OFFSET mfile
	JMP Last
LN:
	MOV edx,OFFSET nfile
	JMP Last
LO:
	MOV edx,OFFSET ofile
	JMP Last
LP:
	MOV edx,OFFSET pfile
	JMP Last
LQ:
	MOV edx,OFFSET qfile
	JMP Last
LR:
	MOV edx,OFFSET rfile
	JMP Last
LS:
	MOV edx,OFFSET sfile
	JMP Last
LTT:
	MOV edx,OFFSET tfile
	JMP Last
LU:
	MOV edx,OFFSET ufile
	JMP Last
LV:
	MOV edx,OFFSET vfile
	JMP Last
LW:
	MOV edx,OFFSET wfile
	JMP Last
LX:
	MOV edx,OFFSET xfile
	JMP Last
LY:
	MOV edx,OFFSET yfile
	JMP Last
LZ:
	MOV edx,OFFSET zfile
	JMP Last

Last:
	CALL OpenInputFile
	MOV filehandle, EAX
	MOV eax, filehandle
	MOV edx, OFFSET buffer1
	MOV ecx, bufferSize
	CALL ReadFromFile



	MOV eax, 0
	INVOKE str_length, addr buffer1
	MOV len1, eax

	MOV eax, 0
	INVOKE str_length, addr ans
	MOV len2, eax

	MOV back,al
	dec back
	MOV ebx, len1
	MOV ecx,0

	MOV esi, OFFSET buffer1
	
	MOV ecx, ebx
	Loop1:
		push ecx
		MOV esi, OFFSET buffer1
		add esi, count1
		MOV ecx, len2
		MOV edi, OFFSET copyarr
		cld
		;rep MOVsb

		pop ecx
		MOV eax,1
		INVOKE Str_compare, addr copyarr, addr ans
		jz _found

		INC count1
	
	Loop Loop1
		MOV flag,0
		
	JMP _end

	_found:
		MOV flag,1
					 
_end:
RET
check ENDP

;LOADING
loading PROC
	CALL CLRSCR
	MOV ecx,lengthof str111
	MOV dh, 10
	MOV dl, 43
	CALL GOTOXY
	MOV dh, 12
	MOV dl, 36
	mov esi,0
l1:
		CALL GOTOXY
		MOV eax, 30
		CALL delay
		MOV eax, 219
		mov al,str111[esi]
		CALL WriteChar
		INC dl
		inc esi
loop l1
	
	MOV eax, 2000
	CALL delay
RET
loading ENDP


; MAIN
main PROC

MOV eax, white + (lightblue * 16)
CALL SetTextColor
CALL CLRSCR

CALL loading
CALL CLRSCR

MOV DH,row
MOV DL,col
CALL GOTOXY
MOV edx,OFFSET str1
CALL WriteString
CALL CRLF
add row,6
add col,8
MOV DH,row
MOV DL,col
MOVZX ecx,i
MOV eax,1
L1:                       ;Printing Column Numbers of Table 1
	CALL GOTOXY
	CALL WriteDec
	add DL,4
	INC eax
Loop L1

MOV DL,col
MOVZX eax,col
MOV tempcol,al
add row,2
MOV DH,row
MOV ecx,30
MOV esi,OFFSET arr
L2:                            ; Printing Table 01
	CALL GOTOXY
	MOV eax,[esi]
	CALL WriteChar
	MOV eax,100
	CALL delay
	INC esi
	add DL,4
	CMP DL,48
	JE L3
	 JMP L4
L3:
	MOV DL,col
	add DH,2
	MOV row,DH
L4:
Loop L2
add row,2
MOV DH,row
sub col,15
MOV DL,col
CALL GOTOXY
MOV edx,OFFSET str2
CALL WriteString
CALL Readint 
MOV wcount,al       
MOV DH,row							; Clear Previous Line 
MOV DL,col
CALL GOTOXY
MOV edx,OFFSET space
CALL WriteString
add col,5
MOV DH,row
MOV DL,col
CALL GOTOXY
MOV edx,OFFSET str3
CALL WriteString
MOV esi,OFFSET pos1
MOVZX ecx,wcount         ; taking column number as an input from user
L16:
	MOV DH,row
	MOV DL,col
	CALL GOTOXY
	MOV edx,OFFSET space
	CALL WriteString
	MOV DH,row
	MOV DL,col
	CALL GOTOXY
	MOV edx,OFFSET str3
	CALL WriteString
	MOVZX eax,k
	CALL WriteDec
	INC k
	MOV  edx,OFFSET str4
	CALL WriteString
	CALL ReadInt
	dec eax
	MOV [esi],eax
	INC esi
Loop L16
CALL CLRSCR
MOVZX eax,temprow
MOV row,al
sub tempcol,7
MOVZX eax,tempcol
MOV col,al
MOV DH,row
MOV Dl,col
CALL GOTOXY
MOV edx,OFFSET str11
CALL WriteString
add row,6
add col,7
MOV DH,row
MOV Dl,col
MOV tempcol,DL
MOV ecx,6
MOV eax,1
L6:                     ;Printing Column Numbers of Table 2
	CALL GOTOXY
	CALL WriteDec
	add DL,4
	INC eax
Loop L6
CALL CRLF

add row,2
MOV DH,row
MOV DL,col
MOV edi,0
MOV esi,0
MOVZX ecx,wcount
L7:                                   ; Printing Table 02
	MOVZX edi,pos1[esi*type pos1]
	push ecx
	MOV ecx,6
	L8:
		CALL GOTOXY
		MOV al,arr[edi*type arr]
		CALL WriteChar
		add edi,5
		add DL,4
	loop L8
	MOV eax,275
	CALL delay
	pop ecx
	CALL CRLF
	INC esi
	add row,2
	MOV DH,row
	MOV DL,tempcol
Loop L7

MOV DH,row							; Clear Previous Line 
MOV DL,col
CALL GOTOXY
MOV edx,OFFSET space
CALL WriteString
add row,2
sub col ,5
MOV DH,row
MOV DL,col
CALL GOTOXY
MOV edx,OFFSET str3
CALL WriteString
MOV k,1
MOV esi,OFFSET pos2
MOVZX ecx,wcount         ; taking column number as an input from user
L9:
	MOV DH,row
	MOV DL,col
	CALL GOTOXY
	MOV edx,OFFSET space
	CALL WriteString
	MOV DH,row
	MOV DL,col
	CALL GOTOXY
	MOV edx,OFFSET str3
	CALL WriteString
	MOVZX eax,k
	CALL WriteDec
	INC k
	MOV  edx,OFFSET str4
	CALL WriteString
	CALL ReadInt
	dec eax
	MOV [esi],eax
	INC esi
Loop L9

MOVZX ecx,wcount
MOV esi,0
L10:                                 ; Getting the Word 
	MOVZX eax,pos2[esi*type pos2]
	MOV ebx,5
	mul ebx
	MOV edx,0
	MOV dl,pos1[esi*type pos1]
	add eax,edx
	MOV al,arr[eax]
	MOV ans[esi],al
	INC esi
Loop L10
CALL CLRSCR
MOV DH,15
MOV Dl,15
CALL GOTOXY
MOV edx,OFFSET str5
CALL WriteString
MOV edx,OFFSET ans
CALL WriteString
MOV DH,30
MOV Dl,10
CALL GOTOXY 
call check
cmp flag,1
je find
mwriteln "*WORD HAS NOT BEEN FOUND!***"
jmp leend
find:
mwriteln "***WORD HAS BEEN FOUND!***"
leend:
exit
main ENDP
END main