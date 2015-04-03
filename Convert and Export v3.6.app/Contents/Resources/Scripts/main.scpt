FasdUAS 1.101.10   ��   ��    k             l      ��  ��   %
"Convert and Export" for iTunes
Originally written by Doug Adams (dougadams@mac.com)
Modified by Kelly Koehn (kkoehn@x95.us)

This script requires the use of kid3 for ID3 modification.  This can be downloaded here: http://kid3.sourceforge.net/
Simply download and copy to the Applications folder.

Tested on Yosemite (10.10) with iTunes 12.1.0.50 and kid3 3.2.0.

=========

TODO:
- Add progress bar during track work
- Ensure that progress window stays up during progress (leave iTunes in background)
- Bring finished window to front
- Remove hard coded kid3 links in case the application changes something

=========

Updated by Kelly Koehn
v3.6 March 23, 2015
- Add feature to export album artwork for non-MP3 albums.  Fixes issue where iTunes purchases (mostly AAC tracks) would have blank album artwork.
- Replaces/fixes ID3 when exporting to MP3
- Add cancel buttons to all available modal windows
- Cleaned up window titles
- Created custom function for cleaning up quoted track names during ID3 repair

Updated by Kelly Koehn
v3.5 February 19, 2015
- Added ability to maintain playlist order through incremental track numbering

Updated by Kelly Koehn
v3.4 February 10, 2015
- Added AAC export functions
- Added ability to bypass encoding functionality for exporting raw files (AAC/MP3)

Updated by Kelly Koehn
v3.3 October 7, 2014
- Remove some forbidden characters due to improved file systems
- Added prompt to place items into folders based on artist name or not

Updated by Kelly Koehn
v3.2 August 21, 2014
- Added timeout to processing section
- Cleaned up old lines of code
- Added additional debug messages where needed to track progress through script
- Further 10.9 compatibility adjustments
- Added error numbers to messages
- Note regarding 10.9 and iTunes -- YOU MUST RUN THIS AS AN APPLICATION!  Do not attempt
  to run this inside iTunes as a script or it will give you a 1712 AppleEvent time out.  Simply export
  the script as an Application (changing name, of course) and you are good to go.
  Source: http://forums.ilounge.com/applescripts-itunes-mac/245120-need-help-add-tracks-files-via-applescript.html
  
Updated by Kelly Koehn
v3.1 July 4, 2014
- Added support for 10.9 or higher
- Added 'my' to function CleanName calls
- Fixed done dialog
- Added some debug dialogs (commented out)
- Reworked file skipping code

Updated by Kelly Koehn
v3.0 July 22, 2012
- Added new Artist - Name.ext naming convention
- Does not convert MP3 files, just copies them
- Fixes file names that do not conform to POSIX standards
- Mutes audio during conversion and unmutes later

=========

v2.0 july 28, 2011
- updated for Lion compatibility (will not run on PPC machines without re-compiling and saving)

v1.1 apr 17 05
- fixed a bug which prevented the converted file from being moved properly

v1.0 apr 13 05
- initial release


     � 	 	> 
 " C o n v e r t   a n d   E x p o r t "   f o r   i T u n e s 
 O r i g i n a l l y   w r i t t e n   b y   D o u g   A d a m s   ( d o u g a d a m s @ m a c . c o m ) 
 M o d i f i e d   b y   K e l l y   K o e h n   ( k k o e h n @ x 9 5 . u s ) 
 
 T h i s   s c r i p t   r e q u i r e s   t h e   u s e   o f   k i d 3   f o r   I D 3   m o d i f i c a t i o n .     T h i s   c a n   b e   d o w n l o a d e d   h e r e :   h t t p : / / k i d 3 . s o u r c e f o r g e . n e t / 
 S i m p l y   d o w n l o a d   a n d   c o p y   t o   t h e   A p p l i c a t i o n s   f o l d e r . 
 
 T e s t e d   o n   Y o s e m i t e   ( 1 0 . 1 0 )   w i t h   i T u n e s   1 2 . 1 . 0 . 5 0   a n d   k i d 3   3 . 2 . 0 . 
 
 = = = = = = = = = 
 
 T O D O : 
 -   A d d   p r o g r e s s   b a r   d u r i n g   t r a c k   w o r k 
 -   E n s u r e   t h a t   p r o g r e s s   w i n d o w   s t a y s   u p   d u r i n g   p r o g r e s s   ( l e a v e   i T u n e s   i n   b a c k g r o u n d ) 
 -   B r i n g   f i n i s h e d   w i n d o w   t o   f r o n t 
 -   R e m o v e   h a r d   c o d e d   k i d 3   l i n k s   i n   c a s e   t h e   a p p l i c a t i o n   c h a n g e s   s o m e t h i n g 
 
 = = = = = = = = = 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 6   M a r c h   2 3 ,   2 0 1 5 
 -   A d d   f e a t u r e   t o   e x p o r t   a l b u m   a r t w o r k   f o r   n o n - M P 3   a l b u m s .     F i x e s   i s s u e   w h e r e   i T u n e s   p u r c h a s e s   ( m o s t l y   A A C   t r a c k s )   w o u l d   h a v e   b l a n k   a l b u m   a r t w o r k . 
 -   R e p l a c e s / f i x e s   I D 3   w h e n   e x p o r t i n g   t o   M P 3 
 -   A d d   c a n c e l   b u t t o n s   t o   a l l   a v a i l a b l e   m o d a l   w i n d o w s 
 -   C l e a n e d   u p   w i n d o w   t i t l e s 
 -   C r e a t e d   c u s t o m   f u n c t i o n   f o r   c l e a n i n g   u p   q u o t e d   t r a c k   n a m e s   d u r i n g   I D 3   r e p a i r 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 5   F e b r u a r y   1 9 ,   2 0 1 5 
 -   A d d e d   a b i l i t y   t o   m a i n t a i n   p l a y l i s t   o r d e r   t h r o u g h   i n c r e m e n t a l   t r a c k   n u m b e r i n g 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 4   F e b r u a r y   1 0 ,   2 0 1 5 
 -   A d d e d   A A C   e x p o r t   f u n c t i o n s 
 -   A d d e d   a b i l i t y   t o   b y p a s s   e n c o d i n g   f u n c t i o n a l i t y   f o r   e x p o r t i n g   r a w   f i l e s   ( A A C / M P 3 ) 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 3   O c t o b e r   7 ,   2 0 1 4 
 -   R e m o v e   s o m e   f o r b i d d e n   c h a r a c t e r s   d u e   t o   i m p r o v e d   f i l e   s y s t e m s 
 -   A d d e d   p r o m p t   t o   p l a c e   i t e m s   i n t o   f o l d e r s   b a s e d   o n   a r t i s t   n a m e   o r   n o t 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 2   A u g u s t   2 1 ,   2 0 1 4 
 -   A d d e d   t i m e o u t   t o   p r o c e s s i n g   s e c t i o n 
 -   C l e a n e d   u p   o l d   l i n e s   o f   c o d e 
 -   A d d e d   a d d i t i o n a l   d e b u g   m e s s a g e s   w h e r e   n e e d e d   t o   t r a c k   p r o g r e s s   t h r o u g h   s c r i p t 
 -   F u r t h e r   1 0 . 9   c o m p a t i b i l i t y   a d j u s t m e n t s 
 -   A d d e d   e r r o r   n u m b e r s   t o   m e s s a g e s 
 -   N o t e   r e g a r d i n g   1 0 . 9   a n d   i T u n e s   - -   Y O U   M U S T   R U N   T H I S   A S   A N   A P P L I C A T I O N !     D o   n o t   a t t e m p t 
     t o   r u n   t h i s   i n s i d e   i T u n e s   a s   a   s c r i p t   o r   i t   w i l l   g i v e   y o u   a   1 7 1 2   A p p l e E v e n t   t i m e   o u t .     S i m p l y   e x p o r t 
     t h e   s c r i p t   a s   a n   A p p l i c a t i o n   ( c h a n g i n g   n a m e ,   o f   c o u r s e )   a n d   y o u   a r e   g o o d   t o   g o . 
     S o u r c e :   h t t p : / / f o r u m s . i l o u n g e . c o m / a p p l e s c r i p t s - i t u n e s - m a c / 2 4 5 1 2 0 - n e e d - h e l p - a d d - t r a c k s - f i l e s - v i a - a p p l e s c r i p t . h t m l 
     
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 1   J u l y   4 ,   2 0 1 4 
 -   A d d e d   s u p p o r t   f o r   1 0 . 9   o r   h i g h e r 
 -   A d d e d   ' m y '   t o   f u n c t i o n   C l e a n N a m e   c a l l s 
 -   F i x e d   d o n e   d i a l o g 
 -   A d d e d   s o m e   d e b u g   d i a l o g s   ( c o m m e n t e d   o u t ) 
 -   R e w o r k e d   f i l e   s k i p p i n g   c o d e 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 0   J u l y   2 2 ,   2 0 1 2 
 -   A d d e d   n e w   A r t i s t   -   N a m e . e x t   n a m i n g   c o n v e n t i o n 
 -   D o e s   n o t   c o n v e r t   M P 3   f i l e s ,   j u s t   c o p i e s   t h e m 
 -   F i x e s   f i l e   n a m e s   t h a t   d o   n o t   c o n f o r m   t o   P O S I X   s t a n d a r d s 
 -   M u t e s   a u d i o   d u r i n g   c o n v e r s i o n   a n d   u n m u t e s   l a t e r 
 
 = = = = = = = = = 
 
 v 2 . 0   j u l y   2 8 ,   2 0 1 1 
 -   u p d a t e d   f o r   L i o n   c o m p a t i b i l i t y   ( w i l l   n o t   r u n   o n   P P C   m a c h i n e s   w i t h o u t   r e - c o m p i l i n g   a n d   s a v i n g ) 
 
 v 1 . 1   a p r   1 7   0 5 
 -   f i x e d   a   b u g   w h i c h   p r e v e n t e d   t h e   c o n v e r t e d   f i l e   f r o m   b e i n g   m o v e d   p r o p e r l y 
 
 v 1 . 0   a p r   1 3   0 5 
 -   i n i t i a l   r e l e a s e 
 
 
   
  
 l     ��������  ��  ��        j     �� �� 0 mytitle myTitle  m        �   $ C o n v e r t   a n d   E x p o r t      l     ��������  ��  ��        l     ��  ��    4 .set the list of characters you want to replace     �   \ s e t   t h e   l i s t   o f   c h a r a c t e r s   y o u   w a n t   t o   r e p l a c e      l     ��  ��    ? 9disallowedChars will be replaced with the replacementChar     �   r d i s a l l o w e d C h a r s   w i l l   b e   r e p l a c e d   w i t h   t h e   r e p l a c e m e n t C h a r      l     ��   ��    ! in this case, an underscore      � ! ! 6 i n   t h i s   c a s e ,   a n   u n d e r s c o r e   " # " j    �� $�� "0 disallowedchars disallowedChars $ m     % % � & &  : #  ' ( ' l     ��������  ��  ��   (  ) * ) l     �� + ,��   + = 7anything in disallowedChars2 will be removed altogether    , � - - n a n y t h i n g   i n   d i s a l l o w e d C h a r s 2   w i l l   b e   r e m o v e d   a l t o g e t h e r *  . / . l      0 1 2 0 j    �� 3�� $0 disallowedchars2 disallowedChars2 3 m     4 4 � 5 5   1   blank    2 � 6 6    b l a n k /  7 8 7 l     �� 9 :��   9 % property disallowedChars2 : "'"    : � ; ; > p r o p e r t y   d i s a l l o w e d C h a r s 2   :   " ' " 8  < = < l     ��������  ��  ��   =  > ? > l     �� @ A��   @ A ;set the character you'd like to use to replace the invalid     A � B B v s e t   t h e   c h a r a c t e r   y o u ' d   l i k e   t o   u s e   t o   r e p l a c e   t h e   i n v a l i d   ?  C D C l     �� E F��   E - 'characters specified in disallowedChars    F � G G N c h a r a c t e r s   s p e c i f i e d   i n   d i s a l l o w e d C h a r s D  H I H j   	 �� J�� ,0 replacementcharacter replacementCharacter J m   	 
 K K � L L  _ I  M N M l     ��������  ��  ��   N  O P O l     �� Q R��   Q ( " determine if system vol was muted    R � S S D   d e t e r m i n e   i f   s y s t e m   v o l   w a s   m u t e d P  T U T l     �� V W��   V _ Y C: http://leafraker.com/2007/11/13/mute-system-volume-with-apple-script-and-quicksilver/    W � X X �   C :   h t t p : / / l e a f r a k e r . c o m / 2 0 0 7 / 1 1 / 1 3 / m u t e - s y s t e m - v o l u m e - w i t h - a p p l e - s c r i p t - a n d - q u i c k s i l v e r / U  Y Z Y l    
 [���� [ r     
 \ ] \ l     ^���� ^ e      _ _ l     `���� ` n      a b a 1    ��
�� 
mute b l     c���� c I    ������
�� .sysogtvlvlst   ��� null��  ��  ��  ��  ��  ��  ��  ��   ] o      ���� 
0 _muted  ��  ��   Z  d e d l    f���� f Z     g h���� g =    i j i o    ���� 
0 _muted   j m    ��
�� boovfals h I   ���� k
�� .aevtstvlnull��� ��� nmbr��   k �� l��
�� 
mute l m    ��
�� boovtrue��  ��  ��  ��  ��   e  m n m l     ��������  ��  ��   n  o p o l     �� q r��   q "  Fix for escaping characters    r � s s 8   F i x   f o r   e s c a p i n g   c h a r a c t e r s p  t u t l     �� v w��   v < 6 Source: http://macscripter.net/viewtopic.php?id=13471    w � x x l   S o u r c e :   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 1 3 4 7 1 u  y z y l   & {���� { r    & | } | I   "�� ~��
�� .sysontocTEXT       shor ~ m    ���� "��   } n       �  1   # %��
�� 
txdl � 1   " #��
�� 
ascr��  ��   z  � � � l  ' , ����� � r   ' , � � � m   ' ( � � � � �   � n      � � � 1   ) +��
�� 
txdl � 1   ( )��
�� 
ascr��  ��   �  � � � l     ��������  ��  ��   �  � � � l  -	 ����� � O   -	 � � � k   1	 � �  � � � I  1 6������
�� .miscactvnull��� ��� null��  ��   �  � � � Z   7 � � ����� � G   7 R � � � >  7 C � � � n   7 A � � � 1   ? A��
�� 
pKnd � n   7 ? � � � 1   = ?��
�� 
ctnr � n   7 = � � � 1   ; =��
�� 
pPly � 4  7 ;�� �
�� 
cBrW � m   9 :����  � m   A B��
�� eSrckLib � =  F N � � � 1   F K��
�� 
sele � J   K M����   � Q   U � � � � � I  X �� � �
�� .sysodlogaskr        TEXT � m   X [ � � � � � X Y o u   m u s t   s e l e c t   s o m e   t r a c k s   i n   i T u n e s   f i r s t . � �� � �
�� 
btns � J   ^ c � �  ��� � m   ^ a � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   f g����  � �� � �
�� 
disp � m   j k����  � �� � �
�� 
appr � o   n s���� 0 mytitle myTitle � �� ���
�� 
givu � m   v y���� ��   � R      ������
�� .ascrerr ****      � ****��  ��   � L   � �����  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � &   Prompt for direct copy function    � � � � @   P r o m p t   f o r   d i r e c t   c o p y   f u n c t i o n �  � � � l  � ��� � ���   � � � If the user selects 'yes' here, the script will directly copy files and will not re-encode those files that do not match the selected encoder type.    � � � �(   I f   t h e   u s e r   s e l e c t s   ' y e s '   h e r e ,   t h e   s c r i p t   w i l l   d i r e c t l y   c o p y   f i l e s   a n d   w i l l   n o t   r e - e n c o d e   t h o s e   f i l e s   t h a t   d o   n o t   m a t c h   t h e   s e l e c t e d   e n c o d e r   t y p e . �  � � � l  � ��� � ���   � f ` If the user selects 'no' here, it will re-encode the files based on the output type you select.    � � � � �   I f   t h e   u s e r   s e l e c t s   ' n o '   h e r e ,   i t   w i l l   r e - e n c o d e   t h e   f i l e s   b a s e d   o n   t h e   o u t p u t   t y p e   y o u   s e l e c t . �  � � � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � �� A r e   w e   d i r e c t l y   c o p y i n g   f i l e s   ( p r e s e r v i n g   c o n t e n t   t y p e )   o r   r e - e n c o d i n g   t h e m   t o   a   s i n g l e   c o n t e n t   t y p e ?     N o t e   t h a t   i f   y o u   s e l e c t   D i r e c t   C o p y   y o u   w i l l   s t i l l   h a v e   t h e   o p t i o n   t o   r e p a i r   I D 3   t a g s   a n d   a l b u m   a r t w o r k . � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � �  R e - e n c o d e �  � � � m   � � � � � � �  D i r e c t   C o p y �  ��� � m   � � � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   � �����  � �� ���
�� 
appr � m   � � � � � � � $ W h a t   a r e   w e   d o i n g ?��   �  � � � Z   � � � � � � � =   � � � � � 1   � ���
�� 
rslt � K   � � � � �� ���
�� 
bhit � m   � � � � � � �  C a n c e l��   � L   � �����   �  � � � =   � � � � � 1   � ���
�� 
rslt � K   � � � � �� ���
�� 
bhit � m   � � � � � � �  R e - e n c o d e��   �  ��� � r   � � � � � m   � � � � � � �  r e - e n c o d i n g � o      ���� 0 
progaction 
progAction��   � r   � � � � � m   � � � � � � �  d i r e c t - c o p y � o      ���� 0 
progaction 
progAction �    l  � �����~��  �  �~    l  � ��}�}     Get selection of songs    � .   G e t   s e l e c t i o n   o f   s o n g s  r   � �	
	 n   � � 1   � ��|
�| 
sele 4  � ��{
�{ 
cBrW m   � ��z�z 
 o      �y�y 0 myselection mySelection  l  � ��x�x     plural for dialog    � $   p l u r a l   f o r   d i a l o g  r   � � m   � � �  s o      �w�w 0 s    Z  ��v�u =  � l  ��t�s I  ��r �q
�r .corecnte****       ****  n  �!"! 2  ��p
�p 
cobj" o   � ��o�o 0 myselection mySelection�q  �t  �s   m  �n�n  r  
#$# m  
%% �&&  $ o      �m�m 0 s  �v  �u   '(' l �l�k�j�l  �k  �j  ( )*) l �i+,�i  + - ' Get encoder information, if applicable   , �-- N   G e t   e n c o d e r   i n f o r m a t i o n ,   i f   a p p l i c a b l e* ./. r  #010 n  232 1  �h
�h 
pnam3 1  �g
�g 
pEnc1 o      �f�f 0 encoderbackup encoderBackup/ 454 r  $+676 m  $'88 �99  7 o      �e�e 20 newencodedfileextension newEncodedFileExtension5 :;: Z  ,4<=�d�c< =  ,3>?> o  ,/�b�b 0 
progaction 
progAction? m  /2@@ �AA  r e - e n c o d i n g= k  60BB CDC r  6CEFE n  6?GHG 1  ;?�a
�a 
pnamH 2  6;�`
�` 
cEncF o      �_�_ 0 
myencoders 
myEncodersD IJI l DD�^�]�\�^  �]  �\  J KLK r  D�MNM c  D�OPO l D�Q�[�ZQ I D��YRS
�Y .gtqpchltns    @   @ ns  R o  DG�X�X 0 
myencoders 
myEncodersS �WTU
�W 
prmpT b  JUVWV b  JQXYX l 	JMZ�V�UZ m  JM[[ �\\  C o n v e r t   t r a c k�V  �U  Y o  MP�T�T 0 s  W m  QT]] �^^    u s i n g . . .U �S_`
�S 
inSL_ l 
X_a�R�Qa l X_b�P�Ob c  X_cdc o  X[�N�N 0 encoderbackup encoderBackupd m  [^�M
�M 
list�P  �O  �R  �Q  ` �Lef
�L 
okbte m  begg �hh  O Kf �Kij
�K 
cnbti l 	hkk�J�Ik m  hkll �mm  C a n c e l�J  �I  j �Hno
�H 
apprn o  ns�G�G 0 mytitle myTitleo �Fpq
�F 
mlslp m  z{�E
�E boovfalsq �Dp�C
�D 
empL�C  �[  �Z  P m  ���B
�B 
ctxtN o      �A�A 0 mynewencoder myNewEncoderL rsr Z ��tu�@�?t = ��vwv o  ���>�> 0 mynewencoder myNewEncoderw m  ��xx �yy 
 f a l s eu R  ���=�<z
�= .ascrerr ****      � ****�<  z �;{�:
�; 
errn{ m  ���9�9���:  �@  �?  s |}| l ���8�7�6�8  �7  �6  } ~~ l ���5���5  � 8 2 Set file extension based on encoder type selected   � ��� d   S e t   f i l e   e x t e n s i o n   b a s e d   o n   e n c o d e r   t y p e   s e l e c t e d ��4� Z  �0����3� =  ����� o  ���2�2 0 mynewencoder myNewEncoder� m  ���� ���  M P 3   E n c o d e r� k  ���� ��� r  ����� m  ���� ���  m p 3� o      �1�1 20 newencodedfileextension newEncodedFileExtension� ��0� r  ����� m  ���� ���  M P E G   a u d i o   f i l e� o      �/�/ (0 newencodedfiletype newEncodedFileType�0  � ��� =  ����� o  ���.�. 0 mynewencoder myNewEncoder� m  ���� ���  A A C   E n c o d e r� ��� k  ���� ��� r  ����� m  ���� ���  m 4 a� o      �-�- 20 newencodedfileextension newEncodedFileExtension� ��,� r  ����� m  ���� ���  A A C   a u d i o   f i l e� o      �+�+ (0 newencodedfiletype newEncodedFileType�,  � ��� =  ����� o  ���*�* 0 mynewencoder myNewEncoder� m  ���� ���  A I F F   E n c o d e r� ��� k  ���� ��� r  ����� m  ���� ���  a i f f� o      �)�) 20 newencodedfileextension newEncodedFileExtension� ��(� r  ����� m  ���� ���  A I F F   a u d i o   f i l e� o      �'�' (0 newencodedfiletype newEncodedFileType�(  � ��� =  ����� o  ���&�& 0 mynewencoder myNewEncoder� m  ���� ���  W A V   E n c o d e r� ��� k  �� ��� r  ��� m  �� ���  w a v� o      �%�% 20 newencodedfileextension newEncodedFileExtension� ��$� r  	��� m  	�� ���  W A V   a u d i o   f i l e� o      �#�# (0 newencodedfiletype newEncodedFileType�$  � ��� =  ��� o  �"�" 0 mynewencoder myNewEncoder� m  �� ���   L o s s l e s s   E n c o d e r� ��!� k  ,�� ��� r  $��� m   �� ���  a l a c� o      � �  20 newencodedfileextension newEncodedFileExtension� ��� r  %,��� m  %(�� ��� 2 A p p l e   L o s s l e s s   a u d i o   f i l e� o      �� (0 newencodedfiletype newEncodedFileType�  �!  �3  �4  �d  �c  ; ��� l 55����  �  �  � ��� l 55����  �   Choose saving location   � ��� .   C h o o s e   s a v i n g   l o c a t i o n� ��� r  5L��� l 5H���� I 5H���
� .sysostflalis    ��� null�  � ���
� 
prmp� b  9D��� b  9@��� m  9<�� ���  M o v e   n e w   f i l e� o  <?�� 0 s  � m  @C�� ���    t o . . .�  �  �  � o      ��  0 thenewlocation theNewLocation� ��� Z Mc����� = MR   o  MP��  0 thenewlocation theNewLocation m  PQ�
� boovfals� R  U_��
� .ascrerr ****      � ****�   ��

� 
errn m  Y\�	�	���
  �  �  �  l dd����  �  �    l dd�	�   !  Set encoder, if applicable   	 �

 6   S e t   e n c o d e r ,   i f   a p p l i c a b l e  Z  d��� =  dk o  dg�� 0 
progaction 
progAction m  gj �  r e - e n c o d i n g r  n| 4  nv�
� 
cEnc o  ru� �  0 mynewencoder myNewEncoder 1  v{��
�� 
pEnc�  �    l ����������  ��  ��    l ������     Skip counter    �    S k i p   c o u n t e r  r  ��  m  ������    o      ���� 0 	skipcount 	skipCount !"! l ����������  ��  ��  " #$# l ����%&��  % * $ Prompt for artist folder separation   & �'' H   P r o m p t   f o r   a r t i s t   f o l d e r   s e p a r a t i o n$ ()( I ����*+
�� .sysodlogaskr        TEXT* m  ��,, �-- | D o   y o u   w a n t   t o   s e p a r a t e   t r a c k s   i n t o   i n d i v i d u a l   a r t i s t   f o l d e r s ?+ ��./
�� 
btns. J  ��00 121 m  ��33 �44  Y e s2 565 m  ��77 �88  N o6 9��9 m  ��:: �;;  C a n c e l��  / ��<=
�� 
dflt< m  ������ = ��>��
�� 
appr> m  ��?? �@@ 0 A r t i s t   f o l d e r   s e p a r a t i o n��  ) ABA Z  ��CDEFC =  ��GHG 1  ����
�� 
rsltH K  ��II ��J��
�� 
bhitJ m  ��KK �LL  Y e s��  D r  ��MNM m  ��OO �PP  y e sN o      ���� (0 createartistfolder createArtistFolderE QRQ =  ��STS 1  ����
�� 
rsltT K  ��UU ��V��
�� 
bhitV m  ��WW �XX  C a n c e l��  R Y��Y L  ������  ��  F r  ��Z[Z m  ��\\ �]]  n o[ o      ���� (0 createartistfolder createArtistFolderB ^_^ l ����������  ��  ��  _ `a` l ����bc��  b   Prompt for DAN-TRAX   c �dd (   P r o m p t   f o r   D A N - T R A Xa efe Z  �Hgh��ig =  ��jkj o  ������ (0 createartistfolder createArtistFolderk m  ��ll �mm  n oh k  �>nn opo I �	��qr
�� .sysodlogaskr        TEXTq m  ��ss �tt D o   y o u   w a n t   t o   e n a b l e   D A N - T R A X ?     T h i s   a l l o w s   y o u   t o   m a i n t a i n   p l a y l i s t   o r d e r i n g   b y   a d d i n g   a n   i n c r e m e n t a l   n u m b e r   t o   y o u r   t r a c k   f i l e   n a m e .     P l e a s e   n o t e   t h a t   t h i s   w i l l   b y p a s s   a n y   t r a c k - e x i s t s   f u n c t i o n a l i t y   a n d   w i l l   a l w a y s   a s s u m e   t h e   t r a c k   d o e s   n o t   e x i s t   i n   t h e   d e s t i n a t i o n .r ��uv
�� 
btnsu J  ��ww xyx m  ��zz �{{  Y e sy |}| m  ��~~ �  N o} ���� m  ���� ���  C a n c e l��  v ����
�� 
dflt� m  ������ � �����
�� 
appr� m   �� ��� . E n a b l e   D A N - T R A X   n a m i n g ?��  p ���� Z  
>����� =  
��� 1  
��
�� 
rslt� K  �� �����
�� 
bhit� m  �� ���  Y e s��  � r   ��� m  �� ���  y e s� o      ���� 0 dantrax danTrax� ��� =  #/��� 1  #&��
�� 
rslt� K  &.�� �����
�� 
bhit� m  ),�� ���  C a n c e l��  � ���� L  24����  ��  � r  7>��� m  7:�� ���  n o� o      ���� 0 dantrax danTrax��  ��  i r  AH��� m  AD�� ���  n o� o      ���� 0 dantrax danTraxf ��� l II��������  ��  ��  � ��� l II������  �   Prompt for MP3 repair   � ��� ,   P r o m p t   f o r   M P 3   r e p a i r� ��� Z  I������� l IP������ =  IP��� o  IL���� 0 
progaction 
progAction� m  LO�� ���  d i r e c t - c o p y��  ��  � k  S��� ��� I Sq����
�� .sysodlogaskr        TEXT� m  SV�� ��� D o   y o u   w a n t   t o   r e p a i r   t h e   I D 3   t a g s   ( a r t i s t ,   t i t l e ,   a l b u m )   a n d   t h e   a l b u m   a r t w o r k   f o r   M P 3   f i l e s ?     T h i s   w i l l   c a u s e   a d d i t i o n a l   d i s k   a c t i v i t y   a n d   r e q u i r e   t h e   k i d 3   p r o g r a m   t o   b e   i n s t a l l e d   i n   t h e   A p p l i c a t i o n s   f o l d e r .     T h i s   w i l l   n o t   a f f e c t   n o n - M P 3   f i l e s   ( s u c h   a s   A A C ) .� ����
�� 
btns� J  Ya�� ��� m  Y\�� ���  Y e s� ���� m  \_�� ���  N o��  � ����
�� 
dflt� m  de���� � �����
�� 
appr� m  hk�� ��� 0 R e p a i r   M P 3   t a g s / a r t w o r k ?��  � ���� Z  r������� =  r~��� 1  ru��
�� 
rslt� K  u}�� �����
�� 
bhit� m  x{�� ���  Y e s��  � r  ����� m  ���� ���  y e s� o      ���� 0 runmp3repair runMp3Repair��  � r  ����� m  ���� ���  n o� o      ���� 0 runmp3repair runMp3Repair��  ��  � r  ����� m  ���� ���  n o� o      ���� 0 runmp3repair runMp3Repair� ��� l ����������  ��  ��  � ��� r  ����� m  ������  � o      ���� 0 cnt  � ��� r  ����� m  ������ � o      ���� 0 dantraxcount dantraxCount� ��� t  ����� X  ������� k  ���� ��� Q  ������ l ������ k  ���� � � l ����������  ��  ��     l ������   #  Get track info for file name    � :   G e t   t r a c k   i n f o   f o r   f i l e   n a m e  r  ��	 n ��

 I  �������� 0 	cleanname 	CleanName �� e  �� n  �� 1  ����
�� 
pArt o  ������ 0 thetrack theTrack��  ��    f  ��	 o      ���� 0 trackartist trackArtist  r  �� n �� I  �������� 0 	cleanname 	CleanName �� e  �� n  �� 1  ����
�� 
pnam o  ������ 0 thetrack theTrack��  ��    f  �� o      ���� 0 	trackname 	trackName  l ����������  ��  ��    l ���� !��    m g These values are used for setting the ID3 tags later.  They are specially quoted for command-line use.   ! �"" �   T h e s e   v a l u e s   a r e   u s e d   f o r   s e t t i n g   t h e   I D 3   t a g s   l a t e r .     T h e y   a r e   s p e c i a l l y   q u o t e d   f o r   c o m m a n d - l i n e   u s e . #$# r  ��%&% n ��'(' I  ����)���� $0 unquotedvariable UnquotedVariable) *��* e  ��++ n  ��,-, 1  ����
�� 
pArt- o  ������ 0 thetrack theTrack��  ��  (  f  ��& o      ����  0 originalartist originalArtist$ ./. r  �010 n �232 I  ���4���� $0 unquotedvariable UnquotedVariable4 5��5 e  ��66 n  ��787 1  ����
�� 
pnam8 o  ������ 0 thetrack theTrack��  ��  3  f  ��1 o      ���� 0 originalname originalName/ 9:9 r  ;<; n =>= I  ��?���� $0 unquotedvariable UnquotedVariable? @��@ e  AA n  BCB 1  ��
�� 
pAlbC o  ���� 0 thetrack theTrack��  ��  >  f  < o      ���� 0 originalalbum originalAlbum: DED l ��������  ��  ��  E FGF r  HIH l J����J e  KK n  LML 1  ��
�� 
pKndM o  �� 0 thetrack theTrack��  ��  I o      �~�~ $0 existingfiletype existingFileTypeG NON l �}�|�{�}  �|  �{  O PQP l �zRS�z  R E ? Direct Copy: Get file extension of existing file based on type   S �TT ~   D i r e c t   C o p y :   G e t   f i l e   e x t e n s i o n   o f   e x i s t i n g   f i l e   b a s e d   o n   t y p eQ UVU Z  XWX�y�xW =  &YZY o  "�w�w 0 
progaction 
progActionZ m  "%[[ �\\  d i r e c t - c o p yX k  )T]] ^_^ l ))�v�u�t�v  �u  �t  _ `a` Z  )Rbcd�sb =  )0efe o  ),�r�r $0 existingfiletype existingFileTypef m  ,/gg �hh  M P E G   a u d i o   f i l ec r  3:iji m  36kk �ll  m p 3j o      �q�q 20 newencodedfileextension newEncodedFileExtensiond mnm =  =Dopo o  =@�p�p $0 existingfiletype existingFileTypep m  @Cqq �rr 0 P u r c h a s e d   A A C   a u d i o   f i l en s�os r  GNtut m  GJvv �ww  m 4 au o      �n�n 20 newencodedfileextension newEncodedFileExtension�o  �s  a x�mx l SS�l�k�j�l  �k  �j  �m  �y  �x  V yzy l YY�i�h�g�i  �h  �g  z {|{ l YY�f}~�f  } 6 0 Set File Exists message to no for each instance   ~ � `   S e t   F i l e   E x i s t s   m e s s a g e   t o   n o   f o r   e a c h   i n s t a n c e| ��� r  Y`��� m  Y\�� ���  n o� o      �e�e "0 trackfileexists trackFileExists� ��� l aa�d�c�b�d  �c  �b  � ��� l aa�a���a  � . ( Check if new file exists in destination   � ��� P   C h e c k   i f   n e w   f i l e   e x i s t s   i n   d e s t i n a t i o n� ��� O  a��� Z  g���`�� =  gn��� o  gj�_�_ (0 createartistfolder createArtistFolder� m  jm�� ���  y e s� Z  q����^�� I q��]��\
�] .coredoexbool        obj � c  q���� l q���[�Z� n  q���� 1  ���Y
�Y 
psxp� l q���X�W� b  q���� b  q���� b  q���� b  q���� b  q���� l q���V�U� c  q���� b  q|��� b  qx��� o  qt�T�T  0 thenewlocation theNewLocation� o  tw�S�S 0 trackartist trackArtist� m  x{�� ���  :� m  |�R
�R 
ctxt�V  �U  � o  ���Q�Q 0 trackartist trackArtist� m  ���� ���    -  � o  ���P�P 0 	trackname 	trackName� m  ���� ���  .� o  ���O�O 20 newencodedfileextension newEncodedFileExtension�X  �W  �[  �Z  � m  ���N
�N 
psxf�\  � r  ����� m  ���� ���  y e s� o      �M�M "0 trackfileexists trackFileExists�^  � r  ����� m  ���� ���  n o� o      �L�L "0 trackfileexists trackFileExists�`  � k  ��� ��� l ���K���K  � j d Skip track-exists checking if DAN-TRAX is enabled.  Assume track does not exist and convert/create.   � ��� �   S k i p   t r a c k - e x i s t s   c h e c k i n g   i f   D A N - T R A X   i s   e n a b l e d .     A s s u m e   t r a c k   d o e s   n o t   e x i s t   a n d   c o n v e r t / c r e a t e .� ��J� Z  ����I�� =  ����� o  ���H�H 0 dantrax danTrax� m  ���� ���  y e s� r  ����� m  ���� ���  n o� o      �G�G "0 trackfileexists trackFileExists�I  � Z  ����F�� I ���E��D
�E .coredoexbool        obj � c  ����� l ����C�B� n  ����� 1  ���A
�A 
psxp� l ����@�?� b  ����� b  ����� b  ����� b  ����� b  ����� l ����>�=� c  ����� o  ���<�<  0 thenewlocation theNewLocation� m  ���;
�; 
ctxt�>  �=  � o  ���:�: 0 trackartist trackArtist� m  ���� ���    -  � o  ���9�9 0 	trackname 	trackName� m  ���� ���  .� o  ���8�8 20 newencodedfileextension newEncodedFileExtension�@  �?  �C  �B  � m  ���7
�7 
psxf�D  � r  ����� m  ���� ���  y e s� o      �6�6 "0 trackfileexists trackFileExists�F  � r  ���� m  ��� ���  n o� o      �5�5 "0 trackfileexists trackFileExists�J  � m  ad���                                                                                  MACS  alis    t  Macintosh HD               ��H+  ˙
Finder.app                                                     #,�B�<        ����  	                CoreServices    �+a      �B�    ˙ˍˌ  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l �4�3�2�4  �3  �2  � ��� l �1���1  � / ) Convert or copy track to new destination   � ��� R   C o n v e r t   o r   c o p y   t r a c k   t o   n e w   d e s t i n a t i o n� ��� Z  � �0  =   o  �/�/ "0 trackfileexists trackFileExists m   �  n o k  � 	 l �.�-�,�.  �-  �,  	 

 l �+�+   X R Placeholder value so we don't delete file if track matches and we are re-encoding    � �   P l a c e h o l d e r   v a l u e   s o   w e   d o n ' t   d e l e t e   f i l e   i f   t r a c k   m a t c h e s   a n d   w e   a r e   r e - e n c o d i n g  r   m   �  n o o      �*�* 20 sametracktypedontdelete sameTrackTypeDontDelete  l �)�(�'�)  �(  �'    l �&�&   @ : Link new track based on direct-copy or re-encoding choice    � t   L i n k   n e w   t r a c k   b a s e d   o n   d i r e c t - c o p y   o r   r e - e n c o d i n g   c h o i c e  Z  � �% =  !!"! o  �$�$ 0 
progaction 
progAction" m   ## �$$  r e - e n c o d i n g k  $h%% &'& l $$�#�"�!�#  �"  �!  ' ()( Z  $f*+� ,* l $=-��- F  $=./. l $+0��0 >  $+121 o  $'�� $0 existingfiletype existingFileType2 o  '*�� (0 newencodedfiletype newEncodedFileType�  �  / l .93��3 >  .9454 o  .1�� $0 existingfiletype existingFileType5 l 186��6 b  18787 m  1499 �::  P u r c h a s e d  8 o  47�� (0 newencodedfiletype newEncodedFileType�  �  �  �  �  �  + k  @V;; <=< l @@�>?�  > 3 - Re-encode the file with the selected encoder   ? �@@ Z   R e - e n c o d e   t h e   f i l e   w i t h   t h e   s e l e c t e d   e n c o d e r= ABA r  @NCDC n  @JEFE 4  EJ�G
� 
cobjG m  HI�� F l @EH��H I @E�I�
� .hookConvnull���     ****I o  @A�� 0 thetrack theTrack�  �  �  D o      �� 0 newtrack newTrackB J�
J r  OVKLK m  ORMM �NN  n oL o      �	�	 20 sametracktypedontdelete sameTrackTypeDontDelete�
  �   , k  YfOO PQP l YY�RS�  R - ' The file types are the same, link them   S �TT N   T h e   f i l e   t y p e s   a r e   t h e   s a m e ,   l i n k   t h e mQ UVU r  Y^WXW o  YZ�� 0 thetrack theTrackX o      �� 0 newtrack newTrackV Y�Y r  _fZ[Z m  _b\\ �]]  y e s[ o      �� 20 sametracktypedontdelete sameTrackTypeDontDelete�  ) ^�^ l gg��� �  �  �   �    _`_ =  kraba o  kn���� 0 
progaction 
progActionb m  nqcc �dd  d i r e c t - c o p y` e��e k  u|ff ghg l uu��������  ��  ��  h iji l uu��kl��  k , & Link to the existing file for copying   l �mm L   L i n k   t o   t h e   e x i s t i n g   f i l e   f o r   c o p y i n gj non r  uzpqp o  uv���� 0 thetrack theTrackq o      ���� 0 newtrack newTracko r��r l {{��������  ��  ��  ��  ��  �%   sts l ����������  ��  ��  t uvu l ����wx��  w D > Change original directory location in case file was converted   x �yy |   C h a n g e   o r i g i n a l   d i r e c t o r y   l o c a t i o n   i n   c a s e   f i l e   w a s   c o n v e r t e dv z{z r  ��|}| n ��~~ 1  ����
�� 
pLoc o  ������ 0 newtrack newTrack} o      ����  0 theoldlocation theOldLocation{ ��� l ����������  ��  ��  � ��� l ��������  �   Get type of new track   � ��� ,   G e t   t y p e   o f   n e w   t r a c k� ��� r  ����� l �������� e  ���� n  ����� 1  ����
�� 
pKnd� o  ������ 0 newtrack newTrack��  ��  � o      ���� 0 newfiletype newFileType� ��� l ����������  ��  ��  � ��� l ��������  � N H Determine if we need to copy like-type file or move converted file					   � ��� �   D e t e r m i n e   i f   w e   n e e d   t o   c o p y   l i k e - t y p e   f i l e   o r   m o v e   c o n v e r t e d   f i l e 	 	 	 	 	� ��� Z  �������� =  ����� o  ������ $0 existingfiletype existingFileType� o  ������ 0 newfiletype newFileType� r  ����� m  ���� ���  c p� o      ���� 0 trackaction trackAction��  � r  ����� m  ���� ���  m v� o      ���� 0 trackaction trackAction� ��� l ����������  ��  ��  � ��� l ��������  � * $ Create artist folder, if applicable   � ��� H   C r e a t e   a r t i s t   f o l d e r ,   i f   a p p l i c a b l e� ��� Z  �������� =  ����� o  ������ (0 createartistfolder createArtistFolder� m  ���� ���  y e s� k  �!�� ��� I �������
�� .sysoexecTEXT���     TEXT� b  ����� m  ���� ���  m k d i r   - p  � l �������� n  ����� 1  ����
�� 
strq� l �������� n  ����� 1  ����
�� 
psxp� l �������� b  ����� l �������� c  ����� o  ������  0 thenewlocation theNewLocation� m  ����
�� 
ctxt��  ��  � o  ������ 0 trackartist trackArtist��  ��  ��  ��  ��  ��  ��  � ���� I �!�����
�� .sysoexecTEXT���     TEXT� b  ���� b  ����� b  ����� b  ����� o  ������ 0 trackaction trackAction� m  ���� ���   � l �������� n  ����� 1  ����
�� 
strq� n  ����� 1  ����
�� 
psxp� o  ������  0 theoldlocation theOldLocation��  ��  � m  ���� ���   � l ������� n  ���� 1  ��
�� 
strq� l ������� n  ���� 1  ��
�� 
psxp� l ������� b  ���� b  ���� b  ���� b  ���� b  ���� l � ������ c  � ��� b  ����� b  ����� o  ������  0 thenewlocation theNewLocation� o  ������ 0 trackartist trackArtist� m  ���� ���  :� m  ����
�� 
ctxt��  ��  � o   ���� 0 trackartist trackArtist� m  �� ���    -  � o  ���� 0 	trackname 	trackName� m  �� ���  .� o  ���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  ��  ��  � Z  $������� =  $+��� o  $'���� 0 dantrax danTrax� m  '*�� �    y e s� I .u����
�� .sysoexecTEXT���     TEXT b  .q b  .E b  .A b  .5	 o  .1���� 0 trackaction trackAction	 m  14

 �    l 5@���� n  5@ 1  <@��
�� 
strq n  5< 1  8<��
�� 
psxp o  58����  0 theoldlocation theOldLocation��  ��   m  AD �    l Ep���� n  Ep 1  lp��
�� 
strq l El���� n  El 1  hl��
�� 
psxp l Eh���� b  Eh b  Ed b  E` b  E\ !  b  EX"#" b  ET$%$ b  EP&'& l EL(����( c  EL)*) o  EH����  0 thenewlocation theNewLocation* m  HK��
�� 
ctxt��  ��  ' o  LO���� 0 dantraxcount dantraxCount% m  PS++ �,,    -  # o  TW���� 0 trackartist trackArtist! m  X[-- �..    -   o  \_���� 0 	trackname 	trackName m  `c// �00  . o  dg���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  ��  � I x���1��
�� .sysoexecTEXT���     TEXT1 b  x�232 b  x�454 b  x�676 b  x898 o  x{���� 0 trackaction trackAction9 m  {~:: �;;   7 l �<����< n  �=>= 1  ����
�� 
strq> n  �?@? 1  ����
�� 
psxp@ o  �����  0 theoldlocation theOldLocation��  ��  5 m  ��AA �BB   3 l ��C����C n  ��DED 1  ����
�� 
strqE l ��F����F n  ��GHG 1  ����
�� 
psxpH l ��I����I b  ��JKJ b  ��LML b  ��NON b  ��PQP b  ��RSR l ��T����T c  ��UVU o  ������  0 thenewlocation theNewLocationV m  ���
� 
ctxt��  ��  S o  ���~�~ 0 trackartist trackArtistQ m  ��WW �XX    -  O o  ���}�} 0 	trackname 	trackNameM m  ��YY �ZZ  .K o  ���|�| 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  � [\[ l ���{�z�y�{  �z  �y  \ ]^] l ���x_`�x  _ � | delete the track (applies to tracks that are re-encoded and not of the same type (IE: exporting AAC -> MP3, not MP3 -> MP3)   ` �aa �   d e l e t e   t h e   t r a c k   ( a p p l i e s   t o   t r a c k s   t h a t   a r e   r e - e n c o d e d   a n d   n o t   o f   t h e   s a m e   t y p e   ( I E :   e x p o r t i n g   A A C   - >   M P 3 ,   n o t   M P 3   - >   M P 3 )^ bcb Z  ��de�w�vd l ��f�u�tf F  ��ghg =  ��iji o  ���s�s 0 
progaction 
progActionj m  ��kk �ll  r e - e n c o d i n gh =  ��mnm o  ���r�r 20 sametracktypedontdelete sameTrackTypeDontDeleten m  ��oo �pp  n o�u  �t  e I ���qq�p
�q .coredelonull���     obj q o  ���o�o 0 newtrack newTrack�p  �w  �v  c rsr l ���n�m�l�n  �m  �l  s tut l ���kvw�k  v 3 - Run only if we are repairing ID3 and artwork   w �xx Z   R u n   o n l y   i f   w e   a r e   r e p a i r i n g   I D 3   a n d   a r t w o r ku yzy Z  ��{|�j�i{ =  ��}~} o  ���h�h 0 runmp3repair runMp3Repair~ m  �� ���  y e s| k  ���� ��� l ���g�f�e�g  �f  �e  � ��� l ���d���d  �   Only process MP3 files   � ��� .   O n l y   p r o c e s s   M P 3   f i l e s� ��� Z  �����c�b� =  ����� o  ���a�a 20 newencodedfileextension newEncodedFileExtension� m  ���� ���  m p 3� k  ���� ��� l ���`�_�^�`  �_  �^  � ��� l ���]���]  �   Check if artwork exists   � ��� 0   C h e c k   i f   a r t w o r k   e x i s t s� ��� Z  �����\�[� > ����� n  ����� 2 ���Z
�Z 
cArt� o  ���Y�Y 0 thetrack theTrack� J  ���X�X  � k  ���� ��� l ���W�V�U�W  �V  �U  � ��� l ���T���T  � 1 + Get current time string for temp file name   � ��� V   G e t   c u r r e n t   t i m e   s t r i n g   f o r   t e m p   f i l e   n a m e� ��� r  ���� l ���S�R� \  ���� \  �	��� l � ��Q�P� I � �O�N�M
�O .misccurdldt    ��� null�N  �M  �Q  �P  � l  ��L�K� 4   �J�
�J 
ldt � l ��I�H� m  �� ���  1 / 1 / 1 9 7 0�I  �H  �L  �K  � l 	��G�F� I 	�E�D�C
�E .sysoGMT long   ��� null�D  �C  �G  �F  �S  �R  � o      �B�B 0 
nowseconds 
nowSeconds� ��� l �A�@�?�A  �@  �?  � ��� l �>���>  � !  Get artwork from new track   � ��� 6   G e t   a r t w o r k   f r o m   n e w   t r a c k� ��� r  "��� l ��=�<� n  ��� 1  �;
�; 
pRaw� n  ��� 4  �:�
�: 
cArt� m  �9�9 � o  �8�8 0 thetrack theTrack�=  �<  � o      �7�7 0 trackartwork trackArtwork� ��� l ##�6�5�4�6  �5  �4  � ��� l ##�3���3  � $  Open temp file for image file   � ��� <   O p e n   t e m p   f i l e   f o r   i m a g e   f i l e� ��� O #?��� r  '>��� l ':��2�1� I ':�0��
�0 .rdwropenshor       file� b  '2��� b  '.��� m  '*�� ��� 
 / t m p /� o  *-�/�/ 0 
nowseconds 
nowSeconds� m  .1�� ���  . j p g� �.��-
�. 
perm� m  56�,
�, boovtrue�-  �2  �1  � o      �+�+ 0 tmpimagefile tmpImageFile�  f  #$� ��� l @@�*���*  � { utell me to set tmpImageFile to (open for access "/Users/kkoehn/Desktop/" & nowSeconds & ".jpg" with write permission)   � ��� � t e l l   m e   t o   s e t   t m p I m a g e F i l e   t o   ( o p e n   f o r   a c c e s s   " / U s e r s / k k o e h n / D e s k t o p / "   &   n o w S e c o n d s   &   " . j p g "   w i t h   w r i t e   p e r m i s s i o n )� ��� l @@�)�(�'�)  �(  �'  � ��� l @@�&���&  �    Save artwork to temp file   � ��� 4   S a v e   a r t w o r k   t o   t e m p   f i l e� ��� l @@�%���%  �   Assumes JPEG file   � ��� $   A s s u m e s   J P E G   f i l e� ��� O  @`��� r  N_��� l N[��$�#� e  N[�� n  N[��� 1  VZ�"
�" 
pRaw� n  NV��� 4 QV�! 
�! 
cArt  m  TU� �  � o  NQ�� 0 newtrack newTrack�$  �#  � o      �� 0 artworkdata artworkData� 5  @K��
� 
capp m  DG �   c o m . a p p l e . i T u n e s
� kfrmID  �  l aa����  �  �    O  a{	 I gz�

� .rdwrwritnull���     ****
 o  gj�� 0 artworkdata artworkData �
� 
refn o  mp�� 0 tmpimagefile tmpImageFile ��
� 
wrat m  st��  �  	 m  ad�                                                                                  sevs  alis    �  Macintosh HD               ��H+  ˙System Events.app                                              ��4�M        ����  	                CoreServices    �+a      �5"�    ˙ˍˌ  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    l ||����  �  �    l ||��     Clear existing images    � ,   C l e a r   e x i s t i n g   i m a g e s  Z  |�� =  |� o  |�� (0 createartistfolder createArtistFolder m  � �  y e s k  ��   !"! l ����
�	�  �
  �	  " #$# l ���%&�  %   Set MP3 ID3 to v2.4   & �'' (   S e t   M P 3   I D 3   t o   v 2 . 4$ ()( l ���*+�  *    Remove all artwork images   + �,, 4   R e m o v e   a l l   a r t w o r k   i m a g e s) -.- l ���/0�  / , & Add primary artwork image from iTunes   0 �11 L   A d d   p r i m a r y   a r t w o r k   i m a g e   f r o m   i T u n e s. 232 l ���45�  4 ' ! Set artist, track and album name   5 �66 B   S e t   a r t i s t ,   t r a c k   a n d   a l b u m   n a m e3 7�7 I ���8�
� .sysoexecTEXT���     TEXT8 b  ��9:9 b  ��;<; b  ��=>= b  ��?@? b  ��ABA b  ��CDC b  ��EFE b  ��GHG b  ��IJI m  ��KK �LL � / A p p l i c a t i o n s / k i d 3 . a p p / C o n t e n t s / M a c O S / k i d 3 - c l i   - c   ' t o 2 4 '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " "   " " '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " / t m p /J o  ���� 0 
nowseconds 
nowSecondsH m  ��MM �NN F . j p g "   " " '   - c   ' s a v e '   - c   ' s e t   T i t l e   "F o  ��� �  0 originalname originalNameD m  ��OO �PP & " '   - c   ' s e t   A r t i s t   "B o  ������  0 originalartist originalArtist@ m  ��QQ �RR $ " '   - c   ' s e t   A l b u m   "> o  ������ 0 originalalbum originalAlbum< m  ��SS �TT  " '   - c   ' s a v e '  : l ��U����U n  ��VWV 1  ����
�� 
strqW l ��X����X n  ��YZY 1  ����
�� 
psxpZ l ��[����[ b  ��\]\ b  ��^_^ b  ��`a` b  ��bcb b  ��ded l ��f����f c  ��ghg b  ��iji b  ��klk o  ������  0 thenewlocation theNewLocationl o  ������ 0 trackartist trackArtistj m  ��mm �nn  :h m  ����
�� 
ctxt��  ��  e o  ������ 0 trackartist trackArtistc m  ��oo �pp    -  a o  ������ 0 	trackname 	trackName_ m  ��qq �rr  .] o  ������ 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  �  �  �   Z  ��st��us =  ��vwv o  ������ 0 dantrax danTraxw m  ��xx �yy  y e st k  �9zz {|{ l ����������  ��  ��  | }~} l �������     Set MP3 ID3 to v2.4   � ��� (   S e t   M P 3   I D 3   t o   v 2 . 4~ ��� l ��������  �    Remove all artwork images   � ��� 4   R e m o v e   a l l   a r t w o r k   i m a g e s� ��� l ��������  � , & Add primary artwork image from iTunes   � ��� L   A d d   p r i m a r y   a r t w o r k   i m a g e   f r o m   i T u n e s� ��� l ��������  � ' ! Set artist, track and album name   � ��� B   S e t   a r t i s t ,   t r a c k   a n d   a l b u m   n a m e� ���� I �9�����
�� .sysoexecTEXT���     TEXT� b  �5��� b  �	��� b  ���� b  ���� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� � / A p p l i c a t i o n s / k i d 3 . a p p / C o n t e n t s / M a c O S / k i d 3 - c l i   - c   ' t o 2 4 '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " "   " " '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " / t m p /� o  ������ 0 
nowseconds 
nowSeconds� m  ���� ��� F . j p g "   " " '   - c   ' s a v e '   - c   ' s e t   T i t l e   "� o  ������ 0 originalname originalName� m  ���� ��� & " '   - c   ' s e t   A r t i s t   "� o  ������  0 originalartist originalArtist� m  � �� ��� $ " '   - c   ' s e t   A l b u m   "� o  ���� 0 originalalbum originalAlbum� m  �� ���  " '   - c   ' s a v e '  � l 	4������ n  	4��� 1  04��
�� 
strq� l 	0������ n  	0��� 1  ,0��
�� 
psxp� l 	,������ b  	,��� b  	(��� b  	$��� b  	 ��� b  	��� b  	��� b  	��� l 	������ c  	��� o  	����  0 thenewlocation theNewLocation� m  ��
�� 
ctxt��  ��  � o  ���� 0 dantraxcount dantraxCount� m  �� ���    -  � o  ���� 0 trackartist trackArtist� m  �� ���    -  � o   #���� 0 	trackname 	trackName� m  $'�� ���  .� o  (+���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  ��  ��  u k  <��� ��� l <<��������  ��  ��  � ��� l <<������  �   Set MP3 ID3 to v2.4   � ��� (   S e t   M P 3   I D 3   t o   v 2 . 4� ��� l <<������  �    Remove all artwork images   � ��� 4   R e m o v e   a l l   a r t w o r k   i m a g e s� ��� l <<������  � , & Add primary artwork image from iTunes   � ��� L   A d d   p r i m a r y   a r t w o r k   i m a g e   f r o m   i T u n e s� ��� l <<������  � ' ! Set artist, track and album name   � ��� B   S e t   a r t i s t ,   t r a c k   a n d   a l b u m   n a m e� ��� I <������
�� .sysoexecTEXT���     TEXT� b  <���� b  <_��� b  <[��� b  <W��� b  <S��� b  <O��� b  <K��� b  <G��� b  <C��� m  <?�� ��� � / A p p l i c a t i o n s / k i d 3 . a p p / C o n t e n t s / M a c O S / k i d 3 - c l i   - c   ' t o 2 4 '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " "   " " '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " / t m p /� o  ?B���� 0 
nowseconds 
nowSeconds� m  CF�� ��� F . j p g "   " " '   - c   ' s a v e '   - c   ' s e t   T i t l e   "� o  GJ���� 0 originalname originalName� m  KN�� ��� & " '   - c   ' s e t   A r t i s t   "� o  OR����  0 originalartist originalArtist� m  SV�� �   $ " '   - c   ' s e t   A l b u m   "� o  WZ���� 0 originalalbum originalAlbum� m  [^ �  " '   - c   ' s a v e '  � l _����� n  _� 1  ~���
�� 
strq l _~���� n  _~ 1  z~��
�� 
psxp l _z	����	 b  _z

 b  _v b  _r b  _n b  _j l _f���� c  _f o  _b����  0 thenewlocation theNewLocation m  be��
�� 
ctxt��  ��   o  fi���� 0 trackartist trackArtist m  jm �    -   o  nq���� 0 	trackname 	trackName m  ru �  . o  vy���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  � �� l ����������  ��  ��  ��    l ����������  ��  ��    l ���� !��      Close temp file   ! �""     C l o s e   t e m p   f i l e #$# O ��%&% I ����'��
�� .rdwrclosnull���     ****' o  ������ 0 tmpimagefile tmpImageFile��  &  f  ��$ ()( l ����������  ��  ��  ) *+* l ����,-��  ,   Delete temp file   - �.. "   D e l e t e   t e m p   f i l e+ /0/ I ����1��
�� .sysoexecTEXT���     TEXT1 b  ��232 b  ��454 m  ��66 �77  r m   / t m p /5 o  ������ 0 
nowseconds 
nowSeconds3 m  ��88 �99  . j p g��  0 :��: l ����������  ��  ��  ��  �\  �[  � ;��; l ����������  ��  ��  ��  �c  �b  � <��< l ����������  ��  ��  ��  �j  �i  z =��= l ����������  ��  ��  ��  �0   k  ��>> ?@? l ����������  ��  ��  @ ABA l ����CD��  C . ( Increase skip counter for final message   D �EE P   I n c r e a s e   s k i p   c o u n t e r   f o r   f i n a l   m e s s a g eB FGF r  ��HIH [  ��JKJ o  ������ 0 	skipcount 	skipCountK m  ������ I o      ���� 0 	skipcount 	skipCountG L��L l ����������  ��  ��  ��  � MNM l ����������  ��  ��  N OPO r  ��QRQ [  ��STS o  ������ 0 cnt  T m  ������ R o      �� 0 cnt  P UVU r  ��WXW [  ��YZY o  ���~�~ 0 dantraxcount dantraxCountZ m  ���}�} X o      �|�| 0 dantraxcount dantraxCountV [�{[ l ���z�y�x�z  �y  �x  �{  �   skip on failure   � �\\     s k i p   o n   f a i l u r e� R      �w]^
�w .ascrerr ****      � ****] o      �v�v 0 errmsg errMsg^ �u_�t
�u 
errn_ o      �s�s 0 n  �t  � I ���r`�q
�r .sysodlogaskr        TEXT` b  ��aba b  ��cdc b  ��efe m  ��gg �hh  E R R O R :  f o  ���p�p 0 errmsg errMsgd m  ��ii �jj  ,   N u m b e r :  b o  ���o�o 0 n  �q  � k�nk l ���m�l�k�m  �l  �k  �n  �� 0 thetrack theTrack� o  ���j�j 0 myselection mySelection� m  ���i�i  ��� lml l ���h�g�f�h  �g  �f  m non r  �	pqp 4  �	�er
�e 
cEncr o  		�d�d 0 encoderbackup encoderBackupq 1  		�c
�c 
pEnco s�bs l 		�a�`�_�a  �`  �_  �b   � m   - .tt�                                                                                  hook  alis    N  Macintosh HD               ��H+  ��
iTunes.app                                                      A��^�.        ����  	                Applications    �+a      �^�~    ��  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��   � uvu l     �^�]�\�^  �]  �\  v wxw l     �[yz�[  y &   Script is finished, show dialog   z �{{ @   S c r i p t   i s   f i n i s h e d ,   s h o w   d i a l o gx |}| l 		~�Z�Y~ r  		� m  		�� ���  s� o      �X�X 0 s  �Z  �Y  } ��� l 		+��W�V� Z 		+���U�T� = 		��� o  		�S�S 0 cnt  � m  		�R�R � r  	 	'��� m  	 	#�� ���  � o      �Q�Q 0 s  �U  �T  �W  �V  � ��� l 	,	8��P�O� O 	,	8��� I 	2	7�N�M�L
�N .miscactvnull��� ��� null�M  �L  � m  	,	/�K
�K misccura�P  �O  � ��� l 	9	z��J�I� I 	9	z�H��
�H .sysodlogaskr        TEXT� b  	9	\��� b  	9	D��� b  	9	@��� m  	9	<�� ��� 
 D o n e !� o  	<	?�G
�G 
ret � o  	@	C�F
�F 
ret � l 	D	[��E�D� b  	D	[��� b  	D	W��� b  	D	S��� b  	D	O��� b  	D	K��� o  	D	G�C�C 0 cnt  � m  	G	J�� ��� 
   f i l e� o  	K	N�B�B 0 s  � m  	O	R�� ��� 8   c o n v e r t e d / c o p i e d .     S k i p p e d  � o  	S	V�A�A 0 	skipcount 	skipCount� m  	W	Z�� ���    f i l e s .�E  �D  � �@��
�@ 
btns� l 
	_	d��?�>� J  	_	d�� ��=� m  	_	b�� ��� 
 C l o s e�=  �?  �>  � �<��
�< 
dflt� m  	g	h�;�; � �:��
�: 
disp� m  	k	l�9�9 � �8��7
�8 
appr� o  	o	t�6�6 0 mytitle myTitle�7  �J  �I  � ��� l     �5�4�3�5  �4  �3  � ��� l     �2���2  �   Unmute the audio   � ��� "   U n m u t e   t h e   a u d i o� ��� l 	{	���1�0� Z  	{	����/�.� = 	{	~��� o  	{	|�-�- 
0 _muted  � m  	|	}�,
�, boovfals� I 	�	��+�*�
�+ .aevtstvlnull��� ��� nmbr�*  � �)��(
�) 
mute� m  	�	��'
�' boovfals�(  �/  �.  �1  �0  � ��� l     �&�%�$�&  �%  �$  � ��� l     �#���#  � "  File Name Cleaning Function   � ��� 8   F i l e   N a m e   C l e a n i n g   F u n c t i o n� ��� l     �"���"  � ] W C: http://techierambles.blogspot.com/2009/04/applescript-to-automatically-replace.html   � ��� �   C :   h t t p : / / t e c h i e r a m b l e s . b l o g s p o t . c o m / 2 0 0 9 / 0 4 / a p p l e s c r i p t - t o - a u t o m a t i c a l l y - r e p l a c e . h t m l� ��� i    ��� I      �!�� �! 0 	cleanname 	CleanName� ��� o      �� 0 thename theName�  �   � k     m�� ��� l     ����  �  �  � ��� Q     j���� k    W�� ��� l   ����  �  �  � ��� r    ��� m    �� ���  � o      �� 0 newname newName� ��� Y    U������ k    P�� ��� l   ����  �  �  � ��� l   ����  � 2 ,check if the character is in disallowedChars   � ��� X c h e c k   i f   t h e   c h a r a c t e r   i s   i n   d i s a l l o w e d C h a r s� ��� l   �� �  � 7 1replace it with the replacementCharacter if it is     � b r e p l a c e   i t   w i t h   t h e   r e p l a c e m e n t C h a r a c t e r   i f   i t   i s� � Z    P l   �� E   	 o    �� "0 disallowedchars disallowedChars	 l   
��

 n     4    �	
�	 
cha  o    �� 0 i   o    �� 0 thename theName�  �
  �  �   k   ! ,  r   ! * b   ! ( o   ! "�� 0 newname newName o   " '�� ,0 replacementcharacter replacementCharacter o      �� 0 newname newName  l  + +����  �  �    l  + +� �    3 -check if the character is in disallowedChars2    � Z c h e c k   i f   t h e   c h a r a c t e r   i s   i n   d i s a l l o w e d C h a r s 2 �� l  + +����   # remove it completely if it is    � : r e m o v e   i t   c o m p l e t e l y   i f   i t   i s��    !  l  / 9"����" E  / 9#$# o   / 4���� $0 disallowedchars2 disallowedChars2$ l  4 8%����% n   4 8&'& 4   5 8��(
�� 
cha ( o   6 7���� 0 i  ' o   4 5���� 0 thename theName��  ��  ��  ��  ! )��) k   < C** +,+ r   < A-.- b   < ?/0/ o   < =���� 0 newname newName0 m   = >11 �22  . o      ���� 0 newname newName, 343 l  B B��������  ��  ��  4 565 l  B B��78��  7 : 4if the character is not in either disallowedChars or   8 �99 h i f   t h e   c h a r a c t e r   i s   n o t   i n   e i t h e r   d i s a l l o w e d C h a r s   o r6 :��: l  B B��;<��  ; 0 *disallowedChars2, keep it in the file name   < �== T d i s a l l o w e d C h a r s 2 ,   k e e p   i t   i n   t h e   f i l e   n a m e��  ��   k   F P>> ?@? r   F NABA b   F LCDC o   F G���� 0 newname newNameD n   G KEFE 4   H K��G
�� 
cha G o   I J���� 0 i  F o   G H���� 0 thename theNameB o      ���� 0 newname newName@ H��H l  O O��������  ��  ��  ��  �  � 0 i  � m   
 ���� � n    IJI 1    ��
�� 
lengJ o    ���� 0 thename theName�  � K��K l  V V��������  ��  ��  ��  � R      ��LM
�� .ascrerr ****      � ****L o      ���� 0 errmsg errMsgM ��N��
�� 
errnN o      ���� 0 n  ��  � I  _ j��O��
�� .sysodlogaskr        TEXTO b   _ fPQP b   _ dRSR b   _ bTUT m   _ `VV �WW & E R R O R   ( C l e a n N a m e ) :  U o   ` a���� 0 errmsg errMsgS m   b cXX �YY  ,   N u m b e r :  Q o   d e���� 0 n  ��  � Z[Z l  k k��������  ��  ��  [ \��\ L   k m]] o   k l���� 0 newname newName��  � ^_^ l     ��������  ��  ��  _ `a` l     ��bc��  b > 8 Function for returning non-quoted outside quoted values   c �dd p   F u n c t i o n   f o r   r e t u r n i n g   n o n - q u o t e d   o u t s i d e   q u o t e d   v a l u e sa efe i    ghg I      ��i���� $0 unquotedvariable UnquotedVariablei j��j o      ���� 0 thevar theVar��  ��  h k     2kk lml l     ��������  ��  ��  m non Q     pqrp k    ss tut r    
vwv l   x����x n    yzy 1    ��
�� 
lengz l   {����{ n    |}| 1    ��
�� 
strq} o    ���� 0 thevar theVar��  ��  ��  ��  w o      ���� 0 numchars numCharsu ~��~ l   ��������  ��  ��  ��  q R      ���
�� .ascrerr ****      � **** o      ���� 0 errmsg errMsg� �����
�� 
errn� o      ���� 0 n  ��  r I   �����
�� .sysodlogaskr        TEXT� b    ��� b    ��� b    ��� m    �� ��� 4 E R R O R   ( U n q u o t e d V a r i a b l e ) :  � o    ���� 0 errmsg errMsg� m    �� ���  ,   N u m b e r :  � o    ���� 0 n  ��  o ���� L     2�� l    1������ c     1��� n     /��� 7  # /����
�� 
cha � m   ' )���� � l  * .������ \   * .��� o   + ,���� 0 numchars numChars� m   , -���� ��  ��  � l    #������ n     #��� 1   ! #��
�� 
strq� o     !���� 0 thevar theVar��  ��  � m   / 0��
�� 
TEXT��  ��  ��  f ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       :���  % 4 K����� ����k���\����������������������������������������������������������������  � 8��~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H� 0 mytitle myTitle�~ "0 disallowedchars disallowedChars�} $0 disallowedchars2 disallowedChars2�| ,0 replacementcharacter replacementCharacter�{ 0 	cleanname 	CleanName�z $0 unquotedvariable UnquotedVariable
�y .aevtoappnull  �   � ****�x 
0 _muted  �w 0 
progaction 
progAction�v 0 myselection mySelection�u 0 s  �t 0 encoderbackup encoderBackup�s 20 newencodedfileextension newEncodedFileExtension�r  0 thenewlocation theNewLocation�q 0 	skipcount 	skipCount�p (0 createartistfolder createArtistFolder�o 0 dantrax danTrax�n 0 runmp3repair runMp3Repair�m 0 cnt  �l 0 dantraxcount dantraxCount�k 0 trackartist trackArtist�j 0 	trackname 	trackName�i  0 originalartist originalArtist�h 0 originalname originalName�g 0 originalalbum originalAlbum�f $0 existingfiletype existingFileType�e "0 trackfileexists trackFileExists�d 20 sametracktypedontdelete sameTrackTypeDontDelete�c 0 newtrack newTrack�b  0 theoldlocation theOldLocation�a 0 newfiletype newFileType�` 0 trackaction trackAction�_ 0 
nowseconds 
nowSeconds�^ 0 trackartwork trackArtwork�] 0 tmpimagefile tmpImageFile�\ 0 artworkdata artworkData�[  �Z  �Y  �X  �W  �V  �U  �T  �S  �R  �Q  �P  �O  �N  �M  �L  �K  �J  �I  �H  � �G��F�E���D�G 0 	cleanname 	CleanName�F �C��C �  �B�B 0 thename theName�E  � �A�@�?�>�=�A 0 thename theName�@ 0 newname newName�? 0 i  �> 0 errmsg errMsg�= 0 n  � 	��<�;1�:�VX�9
�< 
leng
�; 
cha �: 0 errmsg errMsg� �8�7�6
�8 
errn�7 0 n  �6  
�9 .sysodlogaskr        TEXT�D n Y�E�O Mk��,Ekh b  ��/ �b  %E�OPY #b  ��/ ��%E�OPY ���/%E�OP[OY��OPW X  �%�%�%j O�� �5h�4�3���2�5 $0 unquotedvariable UnquotedVariable�4 �1��1 �  �0�0 0 thevar theVar�3  � �/�.�-�,�/ 0 thevar theVar�. 0 numchars numChars�- 0 errmsg errMsg�, 0 n  � 	�+�*�)����(�'�&
�+ 
strq
�* 
leng�) 0 errmsg errMsg� �%�$�#
�% 
errn�$ 0 n  �#  
�( .sysodlogaskr        TEXT
�' 
cha 
�& 
TEXT�2 3 ��,�,E�OPW X  �%�%�%j O��,[�\[Zl\Z�k2�&� �"��!� ���
�" .aevtoappnull  �   � ****� k    	���  Y��  d��  y��  ���  ��� |�� ��� ��� ��� ���  �!  �   � ���� 0 thetrack theTrack� 0 errmsg errMsg� 0 n  ��������� �t�������� ��
 ��	�������� � � � � �� ���� � � ��� ���������%������8��@������[]������g��l������������x�����������������������������,37:?KO��W\lsz~������������������������������������������������[gkqv������������������������#9����M\c����������������������
+-/:AWYko����������������������������������������KMOQSmoqx��������������68���gi�������������
� .sysogtvlvlst   ��� null
� 
mute� 
0 _muted  
� .aevtstvlnull��� ��� nmbr� "
� .sysontocTEXT       shor
� 
ascr
� 
txdl
� .miscactvnull��� ��� null
� 
cBrW
� 
pPly
� 
ctnr
� 
pKnd
� eSrckLib
� 
sele
� 
bool
�
 
btns
�	 
dflt
� 
disp
� 
appr
� 
givu� � 

� .sysodlogaskr        TEXT�  �  �  
�� 
rslt
�� 
bhit�� 0 
progaction 
progAction�� 0 myselection mySelection�� 0 s  
�� 
cobj
�� .corecnte****       ****
�� 
pEnc
�� 
pnam�� 0 encoderbackup encoderBackup�� 20 newencodedfileextension newEncodedFileExtension
�� 
cEnc�� 0 
myencoders 
myEncoders
�� 
prmp
�� 
inSL
�� 
list
�� 
okbt
�� 
cnbt
�� 
mlsl
�� 
empL�� 
�� .gtqpchltns    @   @ ns  
�� 
ctxt�� 0 mynewencoder myNewEncoder
�� 
errn������ (0 newencodedfiletype newEncodedFileType
�� .sysostflalis    ��� null��  0 thenewlocation theNewLocation�� 0 	skipcount 	skipCount�� (0 createartistfolder createArtistFolder�� 0 dantrax danTrax�� 0 runmp3repair runMp3Repair�� 0 cnt  �� 0 dantraxcount dantraxCount��  ��
�� 
kocl
�� 
pArt�� 0 	cleanname 	CleanName�� 0 trackartist trackArtist�� 0 	trackname 	trackName�� $0 unquotedvariable UnquotedVariable��  0 originalartist originalArtist�� 0 originalname originalName
�� 
pAlb�� 0 originalalbum originalAlbum�� $0 existingfiletype existingFileType�� "0 trackfileexists trackFileExists
�� 
psxp
�� 
psxf
�� .coredoexbool        obj �� 20 sametracktypedontdelete sameTrackTypeDontDelete
�� .hookConvnull���     ****�� 0 newtrack newTrack
�� 
pLoc��  0 theoldlocation theOldLocation�� 0 newfiletype newFileType�� 0 trackaction trackAction
�� 
strq
�� .sysoexecTEXT���     TEXT
�� .coredelonull���     obj 
�� 
cArt
�� .misccurdldt    ��� null
�� 
ldt 
�� .sysoGMT long   ��� null�� 0 
nowseconds 
nowSeconds
�� 
pRaw�� 0 trackartwork trackArtwork
�� 
perm
�� .rdwropenshor       file�� 0 tmpimagefile tmpImageFile
�� 
capp
�� kfrmID  �� 0 artworkdata artworkData
�� 
refn
�� 
wrat�� 
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� 0 errmsg errMsg� ������
�� 
errn�� 0 n  ��  
�� misccura
�� 
ret �� �	�*j  �,EE�O�f  *�el Y hO�j ��,FO���,FO��*j 
O*�k/�,�,�,�
 *a ,jv a & 9 ,a a a kva ka la b   a a a  W 	X  hY hOa a a a  a !mva la a "a # O_ $a %a &l  hY "_ $a %a 'l  a (E` )Y 	a *E` )O*�k/a ,E` +Oa ,E` -O_ +a .-j /k  a 0E` -Y hO*a 1,a 2,E` 3Oa 4E` 5O_ )a 6  �*a 7-a 2,E` 8O_ 8a 9a :_ -%a ;%a <_ 3a =&a >a ?a @a Aa b   a Bfa Cfa D Ea F&E` GO_ Ga H  )a Ia JlhY hO_ Ga K  a LE` 5Oa ME` NY s_ Ga O  a PE` 5Oa QE` NY W_ Ga R  a SE` 5Oa TE` NY ;_ Ga U  a VE` 5Oa WE` NY _ Ga X  a YE` 5Oa ZE` NY hY hO*a 9a [_ -%a \%l ]E` ^O_ ^f  )a Ia JlhY hO_ )a _  *a 7_ G/*a 1,FY hOjE` `Oa aa a ba ca dmva la a ea # O_ $a %a fl  a gE` hY _ $a %a il  hY 	a jE` hO_ ha k  [a la a ma na omva la a pa # O_ $a %a ql  a rE` sY _ $a %a tl  hY 	a uE` sY 	a vE` sO_ )a w  Da xa a ya zlva ka a {a # O_ $a %a |l  a }E` ~Y 	a E` ~Y 	a �E` ~OjE` �OkE` �Oa �nN_ +[a �a .l /kh  )�a �,Ek+ �E` �O)�a 2,Ek+ �E` �O)�a �,Ek+ �E` �O)�a 2,Ek+ �E` �O)�a �,Ek+ �E` �O��,EE` �O_ )a �  0_ �a �  a �E` 5Y _ �a �  a �E` 5Y hOPY hOa �E` �Oa � �_ ha �  H_ ^_ �%a �%a F&_ �%a �%_ �%a �%_ 5%a �,a �&j � a �E` �Y 	a �E` �Y Q_ sa �  a �E` �Y =_ ^a F&_ �%a �%_ �%a �%_ 5%a �,a �&j � a �E` �Y 	a �E` �UO_ �a � �a �E` �O_ )a �  I_ �_ N	 _ �a �_ N%a & �j �a .k/E` �Oa �E` �Y �E` �Oa �E` �OPY _ )a �  �E` �OPY hO_ �a �,E` �O_ ��,EE` �O_ �_ �  a �E` �Y 	a �E` �O_ ha �  ha �_ ^a F&_ �%a �,a �,%j �O_ �a �%_ �a �,a �,%a �%_ ^_ �%a �%a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y �_ sa �  L_ �a �%_ �a �,a �,%a �%_ ^a F&_ �%a �%_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y A_ �a �%_ �a �,a �,%a �%_ ^a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �O_ )a � 	 _ �a � a & _ �j �Y hO_ ~a � �_ 5a � àa �-jv�*j �)a �a �/*j �E` �O�a �k/a �,E` �O) a �_ �%a �%a �el �E` �UO)a �a �a �0 _ �a �k/a �,EE` �UOa � _ �a �_ �a �ja � �UO_ ha �  Xa �_ �%a �%_ �%a �%_ �%a �%_ �%a �%_ ^_ �%a �%a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y �_ sa �  Xa �_ �%a �%_ �%a �%_ �%a �%_ �%a �%_ ^a F&_ �%a �%_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y Oa �_ �%a �%_ �%a �%_ �%a �%_ �%a �%_ ^a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �OPO) 	_ �j �UOa �_ �%a �%j �OPY hOPY hOPY hOPY _ `kE` `OPO_ �kE` �O_ �kE` �OPW X a�%a%�%j OP[OY��oO*a 7_ 3/*a 1,FOPUOaE` -O_ �k  aE` -Y hOa *j 
UOa_%_%_ �a	%_ -%a
%_ `%a%%a akva ka ka b   a O�f  *�fl Y h
�� boovfals� ����� �  �� �� �������� �������� t������
�� 
cSrc�� H
�� kfrmID  
�� 
cUsP���
�� kfrmID  
�� 
cFlT��v
�� kfrmID  � ���  A A C   E n c o d e r�alis    
  
LEXAR_16GB                     BD ����~~~NEW                                                         ����            ����  JIS            /:Volumes:LEXAR_16GB:~~~NEW/    ~ ~ ~ N E W   
 L E X A R _ 1 6 G B  /~~~NEW   /Volumes/LEXAR_16GB ��  ��  �� �� � ���  D u r a n   D u r a n� ���  O r d i n a r y   W o r l d� ���  D u r a n   D u r a n� ���  O r d i n a r y   W o r l d� ��� > D u r a n   D u r a n   [ T h e   W e d d i n g   A l b u m ]� ���  M P E G   a u d i o   f i l e� �� �����
�� 
cobj�� �Falis    B   Macintosh HD               ��H+  ��QOrdinary World.mp3                                             ��R�?2D        ����  	                Duran Duran [The Wedding Album]     �+a      �?x�     ��Q������� "� "; dK  �Macintosh HD:Users: kkoehn: Music: iTunes: iTunes Media: Music: Duran Duran: Duran Duran [The Wedding Album]: Ordinary World.mp3  &  O r d i n a r y   W o r l d . m p 3    M a c i n t o s h   H D  kUsers/kkoehn/Music/iTunes/iTunes Media/Music/Duran Duran/Duran Duran [The Wedding Album]/Ordinary World.mp3   /    ��  � ���  M P E G   a u d i o   f i l e� A�Fr   �   ��tdta���� JFIF     �� C 


�� C		�� XX ��              	�� E  	 !1AQ"aq2��#B������	$3Rb�r�%CS�46���            �� :   !1AQ"a2q�B�������#R�3$r%b���   ? ��CP�7޵�ϛT�!ڿ��c��zg8�P(�(�(�(�(�(�(�(�(�(xج?��*NF><�(�ʀXd�z� 8��zb�� P P P P P�_ha�[p��;|�΀�@@@@@@@@@@@@@@@@@@@@@@@@q�� �
 �
 �
 �
9�� �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �=*��B��ր�4(������NU����@y�
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �6A�U�J�n�������`��c��4䝅� ��ր�-[�$���I�`z�K@��	_�x� c��{���K¨�Z�� ����\B#'�>a$03ǭU��j֎�����$����]ˋ�̞�]S�S�5/�U��r���rB����jRW�*TW�]�uMC��,u�5�Y� ���j�y:��oԹ|� �ͧ�^�=M�uuޕs�Fe�Z+��8 �9'�r|��j�dӉ1�� �&�mo4��W�QI
l���v5�<��������%xwoНMw�Z�gU��"�]ƀ��q��<��o(qtDe�X�k�R�5��(�\0Wx�V<��<��UM�~��+�:�T���Z	�-����#�$���I���ս-���Q����D,�w��O�~U5�*�D3]�}�.����&�l'S�؜V�AJ���;�mYǛ!�I
���k���[�SxBS�`2֪&2\�;��1�ʀ��۲� �`�PhY �
� Gph��ճ'�m�(�ʀޚ<�ZKr����d���@%XY6E�̐r{q@tٷ�x|w�o��:��6�!Kq#}['�}+)d�H�j�\���s`���ɰ^��j����������'��1��W�9��P�&��?/7��'�1m# ������{�z�����*��+����SA�2knb�kw�����>�� ���G-P�P���q���fW�����h�j�T>�� ��қ&���w2�=��ʒx?B)L(�
�����1@@@@@@@@@@@@@@@@@@���A=�a@{m�&70}����7��5��FC�n�A'�Ԡx�+P��U���ߕKZ ��ଡ�l�k�R}�F�]�������d�IcX&S�f# ����J��]�F|+���M=n�t�/P���{9<Ո�$�9�Υ$�4�n�~��\toOn���r�O���4cЍݻ��)�d[S����X&�Y��1�u����� J�~�e=D��Sѝj�����}2Ǘ����'�Kr�BGZ����۫�8�l��ӘZ��� ��ּ��6��qjQR,����ۑ�=�5d�qd4��p�S��?��Ph6�}+�M�>bƼ�b1�n>x�N�Eɣ��/��v0�P��k��uk8ٮ�,�`#9B�����
������g���]k#���<�i8��1�8(ñ9�g']�E[t?��:�Z�:>��;d/~��*v���[*Q�9[8{S׵md����dg�#?a��@^��^M��4Hz���[��Nҧ�de����H3��s��VNE齗� Z}�/�� �.,��1�urە���ǚ^�+N�M���z��&�Kۋ�}F͊�I*���{|�ԫ����T�\O �)ϽAa��J�m*[�f��'Ē�7�����+f��Iv��h��$��� %�g�MY譫[��y�[M�3n	;������Ѻ%����Ք�S����vX��/ ���T:AP|�̓�:��R#�rE(�
G&?	RFI��<�ڂ��ƾ�}�|�)�~��l��!�c�ʡ&�Hl� g��������� Dc�z�lq�J����o�ڒ���0MIC@�m����c2*P7K:4q���W��V>��'�%�K�3���g�b��c�K;�$Mu*ガ0EM�@
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
�D$� |8��l��K�0[��A c��ދ�{2��ФQ�  ��8���Ձ���ܙ�����>�`��c�Ӎ������ῗ@r�&�M�4��Ib1N&]���|�bj��M�Z>��&���l�����H����<9沅��5�^�m�}-��_��=��\_4��)
[9'h㿽o&�9>̢��Fߴ�Biw��h�L6ztE�k�!�G�ڭ�uBZ�V�'@��34:����~�#�� �A��O���t�:��cay�t���y�si�@�������\W����^�T�h�	��n#�5+����:�QhWzu�+%��f'��G8�����Z)8�*g�� ��?�	�Ň�'Q,�o4���^���u�-�G*m:d��k�%�Y�z∬�l>�F5,�G�9�1�����TMS�O���*����[Gw|����n,~D� J�/�Z)?�[9[�X/z�@��I����M��x%k9j.�%l�kb�V�a���a\�Y�I��j��3M��oN�	^mER�f�j��9�]]Ր�)n��zg���OO��-�Y�b�7�8��z��t�^�x^�i��F��m����T}�B��J��Jv��d���>�(��^\]3��� �e'���~*Hh}3�uV��aj.o�˷���3ܚ�t���� ��s��L��Rimv�R��:;��In��銉I�;t_S}@t˦zz�Kӡ0XڠH�p�zy��6�ozB���=�z�_vR�cba��?1�Ki��5MB;?#|�6L&G�����[&ڶQ��9���}o�}�ng��[�?i�����dV��NW�R~���jJ�3ڀ����>��2�d�B밪+,"E���V@[qcf�U]&f��l�`�$�۷�Wim�t�6�nL�9XD���� {���Q"MkI�J�����U6�0�����4�`j��ܖb�ܜ����}(P P P P P P P P P P P P P P P P P��2��� �Jo�Z5ʦPmp�$��ަ���G��u''w�u �$� ���z�� �ʭ`�[Vo�Ĥ�'*�g?�,c���,xYo� |��,���Iwy׺�w7���-%Q�n~�8�Iܤ�l��h��%�:W��텪�_�D �Jb� ǝ��=O~դ��L�qEe�M�TiW�k��5��LV�7?y�F?	a���J����s��:���L�\&�$��92�0HS�q\����Ѯ8�ϫ�?�zoFi	�i6���> ��}�<�"���:��*�sؐ��WQe[jw��|�CG��'`�f�ĭ��H�o�[�U�˥u�a=�R̋��yή2�
�*��ֻ�Pm#�}T�~���r��{{��혾��H �����W<�f��o�B��}]���Xۥ��[�y#sd{�W����&�<�Z�x����Q1e.v�B�AYM:4]�U�_��S�
9���5rc�T�3�>,��WJk���8;�M�g���B�D�������B���#�韕eJW�IE*�9�f7��O�Z��ă?u������P�܉F��~$ZEi�Z�0�-��	�s��Ҧ]�V*���RT&���Oֈ�������d��#�]˳��w�,��Zk�1��v���������'L�'p�=��7�6V*���'���[	|<�:(o�s4�DY������W�&�J����H�5���ᢺ/mc��#��wl�kH�բ�����)��,v�\f��BۣQ��l)�m�?J��A��"\ζN�����:�cr� 1��u��E�a.�r� �:�h~~ô2Kj��J�"�K��i>� Χ�������(���6B�#���I���>��	�y�.�Y�N0jn���啶�Kl��Gʣ� �Iqĳ�����1����35������dlI??ʤ*�@b�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(J2Ì�ڀ�d�cQ�c�T�r{T�����:A�Ol <�A��j5L�si,ȅ�B�F�����4�p�v���qP��PI���x5 ����?�~1�Y[���K$��l �:�ɍ���u��R�Ϩ���+1���[�(�tW����������c��ı�Xd3G���'��K�ʖ��;K�}_]�1
������g�F;*3\>G�K�Xi'�}�r�B��6��.֋7�9p�{��������(ߵV��t�I�k�v��mc!��d�3c�'�޻pԢ��rerL�r�~��� ��w�y� ��0��$�;Oe���j�%��Z �ZU擪<�k�Rbd�rX�QTj�%J��zg���\�.��dV_(�'�8��U��"{��������{}�V�������~��e�E�{;���t>��1s}?�f�����+X�)s�r�V�&��ֺ4vv��Jb�O|��:��B{��>U*�y$U��'�~�}�5����:�e����?�� ����*�Od��e!�V���\jS��q;ػ�Ϊ�`]Ⱦc��R	�������D�t�*�Q���v�Y�U��O 3��
:Kc~�z}�~κ֓�6���$In�lB�A�
���W.Y6��lq_��?�C6�q�r+������Ƴ��n�j�Mm2�ؙ-��y�#�e F[��=���*ר�� U�H�i�C
,��0G��-�S�#�����|p�&\�\�A�յrt��՜���������7�u8ZFpߋnsߌU�]"�tq%T��
&�t�4��w-,�I�d����1��^*����X>��Gp 2A(��sI*a�BOq;E"Ȝ2���w��F1m��m&6HX�	S���5��!���H�ȥ$S�V ��kL�� P P P�(P P P P P P P�7���X�X�=sN���weqc(�� ��p�)RA�B*�Th� (�(�(�(�(�(H��Wp\�e�� �Nե���J��<R�zw�E�.u/6O6(V��@1)�~qǵ%+�	���2���� {�zUl�hZ�Q��>���Ň��-����=i~��i^�v������ Gޜ~�<U�}��� cN���9�MI'K�OR�D3�s\�3��.d�S^��ZRi�����x�Ӛ�Z�~ʿ(dY���3�=+He�����m#��e�GV)y�_[ɦ�0��ϙ���??zޒm]њN���}q�v=;��������o��*뷱c�Y�s�T�S�MvJ�I?c�|$�lt?^i6p�c@֤�D���13�7���p8N,����4�wI�Q_M����s��e|~��6�DŮ�^���W�h�I1���� һ0IBU�e�rV|��O�|?�KI���9g��"&+"d����WD����o�τ�{iѽQs�v��)�Y���������=-����?z#M�G�M��WK�ep�lh? � v��h��쇦QA���Vd�d-�OΨ�h�u�#�.���QXno-@��d���#��A�MQ-6+꯳��x�8l-e,^h��?�LT�ZN�F��J�|=K]:'��y"cg�q�'<�� z�}2�7�ʚ��\j�SL|��0�Ԗ9���w�\]��z]�q��� r��q,~lQ��=9�",����s�^)X\������d��y
�ᶞ�ON���I�^� ��8�3�'Ot��K�ζq%Ğl�=X���U)I���ER��!]۸�'�P���c��c��JdQ��� �� s����;Gp�	IP�G��n�V���\%Ӌ���v�A�%���޺S|�^�oq��i�.�Oe�R'�ɯ��VLd�f���䛤D�'�@�
 ��4��M�����%Rx�8' ����TUY�n4�[�d�om��|ؕq��w�Uj�C<�yr2�	6� �?�Q��9&}�+;{/4:il����e�$7S�z��:ű���RtE��đ���� �D�Cq9'j�&(�(�s��u�&����E{d��e5�]B$�W�����ttL1os�>f��Ϊd,�QO��J��y��rKG|�c��U�My� ����H�c��� �� ?#޻�t��ȣ�T�5�KJ�tۻގ�&��$-�����vR{���rΓ�X�(�l����:6�scy���H�K�`pA�Ú�� (�(��~���Y����Z�V��FE�!b8L���\��a	ph�(�!◆/��\rܻ�w4��(Y`u l9�Ek�nvc8�����υ�g�k�]"�Xv��I�T��F���h���@���W_&䱮���r.� �?U��M��k��`�ڶ��f@��H9������e���+��"�E�����ŕ���o2G2��4��x����գ��N�K��P�z��}��j����Ǫ��5��ң���d\�����Q\^T�ak����ɞ>��Zf��`�K�8#[|ň�]� m��c�S�JR��S5s�Q�Y�P P P P P P��l���<Ԡ(�a$�f!�_���zQ�����r;�T��$Űc\p�{�}>ue�I~t� ��%�v��������p6��
;�ߜ��벷�i��m�P[2����" z @��v�3\���bFr?
��-��$~2�̫�lr��"�����<}~U��G��Ke�?�΂�Ix��#�� �������w]̣";r�c�_7͑�|�����6�S-εs���G�ߏ��I ��`��v�����7���y��<D��ZIBa�M������?:�j��crmox�E ��v)�� �'�;v?��Iz��I�C��G�.�N���u��l�a�����ޥ��N�Ѿ}�z�H��mR���y|�����A��j�*/��m:c_�"�|p��\�m����aY����ǰ�j�q��Q��h�g�5}�P��l���[Er����j���i�Lt�g�i a��!����Y���c�X����[�l��y�ߥ��� 5�젷��\0���a8VC�Ծ�v�� ��I�Z�M�w�c���B�܆ۙq��sUK��e�:��;Ď���ƳDX�����8<���R��=_O���w��R������4���YIn8#���9{�W����ml��W������3�x����x�d�z�-T՞m+L��C�l�i#�(�bT�<����M+�P~�]#�^tDtՕ���%�u�H2�,Tz}pq�)�3�N	(��MJ��As��85/��4��PF��2>�	�d�xb'Bv���Z4�Q�3��0�~�6É��ƨ\|D|��J�J��.�u���ѡ14�8l��>�vR�{1Em���f�2j���Z${�����������K�8 �ʘ�
�n�Ȏ�܌ddd��m�;�ޟy�VBA��N�{�Ҭ�芡L ����b2���D��on���W.߾u��+������^��g��q�yMov<�1� ��{zґZcŽ�	<�t`��K*� r;b�����m!�En�Y�o�@���T�>�-De�F�C��c�Nưze�8��
 �-��+'�����̙��\~_� K������7菦�;�����H�����3����n��\<���|�!�n�qM�GJX��Z�ޯmm�ʙK�d��Z>T�q����W���[î����E�2��d�|��W,�I%(4�18E�|��Kjj�6u=���N�����'�^�X�gMM��nf@dw�gzxC��Fxm�D]���$h�lX$Ys�os��W�<ye9�F�z20�b���}?��������{���3��m�s�v��� N*Jkh��R�h�����͕�_u=���}"7��\ȿ�O�淔�-vB\#�$%��@��E�����f�����oQB|(q���x�F<ՈBY[h�5џe�����m��C��Y����	#Lr���x��jj4���x��9��!�\������H�C_�-#���N�8�/�`}��q]�/EQ�?s��N�G�~��|V���Eh+�Al� w�2�x�n��@�cz�:��_Ȟߧ܉����[xk�^hچ�qay5�����d�o+9ې�����Ȕ�O܈��\\Iw<�J�$�1fgbē�Oz�$�"����@@@@@�&ky�T%]ea�hlZ��
�-�P���X����l��XK��PHlv9u��� B�d�q7M��(�%�<c8� ;Ԥ��=J�,�i��*��|�+����«B��$�{���Z.��?�kb�
��ؾ#h�o/��Xa��0F>ι�q��F�Z�-���Tiז��wK���i�r̒T��o�T#<�Rn�� C��ms�R��x�7b�C�p�o�;����Wj�Zo�G�E{��d��P�$�XK>q�G�=�F�̞�����֓��ꉧ�XC�nm���~�$�O��|�>RH�?����_f+�/,�X�ƫ���%p�M����>��q��;Zeeԉ�`e�|�+�x�Xs������zOi�oS�^uF�g�ͅ�KqOt?v���s���Iqz�R$}e�N�{�ֽ-}fڍ�Z���E$��}I g5U��l��AzW����$ў���Z+䀂r2��#�oa�g��k�����v/g��yC�,�N n����*ͦ�2���d�����c�/�����ūɷ̉�x�#��9$��9-tk�.�&=}�o:���혐��w���=�� 1Z<�+L��5�4Oz
�R�U[����F@f�P{`��TB_1�q�-T�kɝfI��t����ĒT����Z5�fK�C�3A>��g�����vJo��}?:�JZHe���s���ga�I9�q��� 3R���2K�~(�h���Mq���;��q�q��g�������YG�=e�<ّЫ�A�����H�R��0�h�B�b�F	'�Y*�Ic�!�����bU�f�->��1��p���ʾ�X�N�����!��Ճ�������+���՘�ފ��X���=B� v�r^Z7�8U
�F9��� Jʒ�"�Z8$Պ��
&����W�� ��CR��R���H�]�v��o�9q���*ޠ[w;\���#̩|����ă��K7ŲH���aHo5�[<�dUh1��'������d�.NWa�2o�\��p�ʒA��v�������`�R���;V�~���)�D-)�R�d�T�\{�>�d#���
 �:��-�]C�r_\úH�ke��Z1��#���G��E;r:{�/�u�}a;M����Z��G�*�� Ǐ�vGɌq��^8�%2G�o�RN��=h�k�4r�\+�Өf`=9�;|X��k�o�͒�}"���s\h��u�����6¡�g�{|�&_�L�1�|�W�A�-���}]uwq2�R��PF|�y2ʼܓ����se[r���t Pר:�m5;�>��+�:MB�qi�C�u�S��>�ǉ��A?��qi'%����uN����8-5+�#�_��1v��� ֐qNr�M��.\b�G��� �Mt��:D�]��iƢ��Iʩ�l*�Ë�^iv��%d��e� �ǥ힦�)$ڊ�A��s��#�c�k����})Q�Y�>�"�;W�4�ǟ�!�ߪ�k-;W������	.�@9�ʻ|l����I���� x���}��~�'Lu :~�m(8*�ϯ8��L5�c��o
��o�:j>I�G���J��9q�zK�\\YE�35�`��$W��5�ʲ�H�pq��������.���[)l#�x �e�E���^3�o	sVg$ӦG+B�@@@@@@�~�����.ΑK��4�ȥx u-*�BN}=� :�*KE^�%�MV-[��<��y3:3ڝ�r8��sJ��	
������b�ᙶ�aR[#�#ӏ�Q^�d]=�x�v��A�[���֒��˻L��:̚���H��i�ý�`�{⭶�_�B]�]K'X�1��;��B�����J���W�uA�|+����i�[U2��?;��j�$�2^���-��5���O��qb�H	��px���Gn�����Լ ����k�m�?t�5yp� ������*��Z2q�%�{����5���A���������1��oo|f���m	;I����%�r];�4���#�0 ��3Z'ez��R�}��kh�]��m?�?�R�r�鯴PjRi-id�rU���$7Ƞ)���՗�!�}�?��M���]�|�g����Fk��P�Q�u
���2� �����5{mM|'����;VO�Ko8�O�����YN*J��)qvw�NkֽIl��������Aؘ�{�� ʹ�4��mi[9��g�{�����E�c4�;�f�(��Ͼ�tbJ*�1��r�鰻��x��%�) l�0�����-��B�Xl.���a�It�����y�|�荖^��Q��(.E�Wd(2(���NO��o�JJ=-wԀī2�\���r��XBx'��D�g����C�z|�v� ������l�ú�޾�v��^�t;[���WOmq�^?�3$�Ѻ�1��M]$;D���sIsZ���!��ᶫz�[�����~Mi���[��9I��v�(�9�1ީ�ⶴYI�q�x������kt��[[^"��A�i�����/rSI��LyR}�5���>�,����
d8��I9H��Q�����P P���U�/1�o�����d�V�@Wanm��K��0�u}�� !��Ւ!���X��w��l���$ q�sϭMY(�o��\b@H2��`�p'���P����X<�R�m4��x�&wyC�ڤ
q�u�C�
]��Tے>!��� � O��{a�\�rg)r�מr~��@b�� P�_b�Ӻ{R��e�jS^%���DX�o�����G�.�z$�Tu_��h�Mn.��u�>����yvW73c *��8ϽsC�=�i�<��~�~"�7SZ��u��k	e���3FE�u�o����WNR���twH��ƿ�W���T�/�	�|�����Y>Zv�_��(FiIvp��X�n|.��k�k^ն�b�4����ǧ�_A�77�qf�x�19Z��@�
 ��3�/<�|D�0�}ޛ�N���4��@�@x;O�9�}�^^�|������q�B-Kе<;�<�N��z���ޭ�o4��$��I�nЃ� �Ҹ�Y�=U��:����}#�|g�3�?.:cA�m���Մw:뿝<�aB�숸<���������8�̴���Q��C��n���6�*/,&[[H����3ܞ+�(g6t��8�EB)�k�_Au�>Kc�Z��kb�*�%r�����,?��Cy��c�r�� ���[�5MB>�Һ�;�N.�;�2�~Nv��z�'����H��R��O���Rh�Bm������M�k�Պ���ʦ�}�oto����`C�i6.Y4*���g*��E?]'��MZ��5�u�Yu������n�$��߂Ny�W��.h✹��t� P P P P P��ڀQ"	/gp����d���,-|:ӭ��$�ۏ��Fx_A�o�h�����ᔖ�j����[]l�M�Q��> x>�|���,H�.Q.!�$�F�>���C�o��vcU�~� P�aQ�H������__�$C��;Y�@I��eS$|{�R�{����N��-�*y�W��|�`�`�j��W}aw����ti��WcYO��YG~�f���N��,\(ۇĊ��� >���z�d�]M�IԲi���>��W��!h��d`�C��sS&���0�'Q+���z��o�t-j;�)�ȊKY$,��F9�=F(�AS�צ��gr������ � ����Z�a@?��<ۧAck��=���v��C��գ��y���B0����� J=�,	�UKK_�����DR�8>����N�!�����B;	����Id2�X�j��9��k����a�ݾ��ܬR�f��C�o^*�ĩM����P�Z��J���e$���Qi�-B+�ۋ���<�`4�X��hM�Wq�va��4`3m*	�܌�@csďN�g�m۷�������V��S��߭M�V{k���ck�Y�T� �lP}��x��LG��*~���`^L������ c�[�]{R��y���`��k<r�,=�k�)z�]^�;�����v��U�A���"��MZ�
 �
Sh�>���3ٙ�w�� ��9����E=Ov�M�	��b�����|�)�*v�v����cD$��X�)-���Uu�x�hԬ!Ӥ�C�#���7�*$v�pGz>ʈ�/y,b��K0r^�cl灼|�S�l��F�G/���w�`��nI� �+�������h�y�>\|;��	��r��w9C�x��Y��(��x_�/ѽu���c�#�pֱ��\R�;>���Hh.�M��Ņ���o��FA���~���˓G�3ۜc*��oS�ae�:�BU��EbTz0 �k�y<�*��S��(�ƱӾ��V���Cz���r0���?�N��<���t�t|��V�Fw;��b}�95�a�(��k�i^�м5�����M����y��'
}8�O�a�>ol��n<N��:�����WWb�]�]R&� ��O��J�渱B/�j=#�3��Sg*�U�_�ω:�#ec�O1���8'��z9q��(?Ts�|&���k�֍�t�3H�%�@�[��H�p�|��|Yd�q�=\����T�� i��o�o��ڎ�#k�ry��1���oɌ���`�5$�1��Mj/�C�����*��6�o��ʆ�#ڱ�r���/5:}�<~��gk��2-����9ݖb+����;&�]� ���t�t��	Ķ3�n��K��>ǚ��_���~gV��n'"�����x��7*KK�0?M�!�?*�qϜS8Z�� ��@@@@@@d�M �K�{�ءE����<��ߏZ�Aau��s�V���#��eR��s9���kGm%eQ��}Fí.!��D��U�E��#�ݸ��VoMr%�u���'0ȡ�(x�w��V�տ�!{���g���2�|�
�#8��nԋ~���۵�����5*�t�a���^��>�CR���_4�ۏ@J��Ҳ����F�Hd�z�D�ˁ����X��� oZ�ߩ�e:e���-���6����9�*޿^��|W�����s��X�M��<��+�8���ދ&G��u��ՓS�.c���������ԷdF<Q䓴�f�XSc�\jK���>Ԥn���I���%r�@3���s���i ��N��X��H�'�7�|��9��~Ukih��m3N�u$��_#�-f�$;s�����}���t��ֱ���!��;��eݴ�V�x���@�$|�12
�sK��s� Q�*����+����@a�9�1@{M���m�Oʀ�&�Q��oÐ[�h�W��QJǅ��c�#�KvQ�U�J�� m��}E@$)��G9ӊU P�B���Bz�K�K4��B��#�P��D�Ы1�)�v��('�S�L�d�!
	R�-����x9[��#�C�����t4��L���2�=�5�u���
z��iV�E��H��c���5*ԩ�}!���ӎ�|�YϘc���^���t@��.m�g�.!�ɲ�ж���' �Y&�V�̧�b����&A��7ˏҞ��#F�}��c���H�� ��T��hi��=���1Eؤ�.s��”����(x��t�c77
�"��U �Xf����ta��'^�;���돲����j=�w1�Ae@=~�*��x0Δ�}�6�V�����ՖgO�5�}�V(�'V�N5y{�M�l�<e���^���G��Ky>妩��	�y���x�'�����M��]g(P P �Н5/Xu~��»��uR?�����?�?c\P�5�~�z[i;�6Ų��yg 6�ן�J�Ο)n�D�q�9$pI�5�=��:g�����w@i��6��^��Mg{,�n2A�?־a�<���i��J/c_Oh��Y=�R�����G5�֭rD��Ɗ��}?ҽ�C�����f�/�I�_�����z����iy-l..^X-l��g�\�yˌ"��*:V8�[�8'�#�i�׋��Ґ-��KPW���S�ʽ�-cVyY��/��Y����-o�ʸe�{��?:��²�wٿ��gGE� �Kø�}��G���;�E�s�����&��?B�L8���u�A@@@@@@dw‰<�S^�.)c�E�b�(�Q��ߞ9���C��ǉz�Z��RO$O;�����k��|s[��� �N���������+�#E#�d�"��i�q�Y9֬�-y��l�D�(�0\�I��W]r0����s
� �X��c�?�B�o[ ��wܙ�&BD{���lgi?��ަ��� [��hE��n/9�� ��H 8����E����?���=�m=�?y����������J��6�x�r�]�����H%BX6��l*���[E����oĲ��[�s�mܞG�VJ����-y7�n�rT3�l
�폭d���Ės<7^^��M��=�� �J�A=���A�4ߺ[[�n%��TMs�	�<Փ�R,�j�<��ҨO��1���ڪ��:O�k�>����yb�@/.��J���|��=jb�k`��\�?�r5��wv��h.2m��]Ï�<��ehO���g4�6W��kf<�,��A#���rp=j��ۿ�5�+y��_!G�x^W��Ve�@l(�� dc<���~T�m/�����4�m�6�Q���� ಘ�v�A'p�M�F�7�u �ϥ�f[h��4�`�îӌ��P��(��ѼaK#(a�$c#�{Б�݂�v�q���&H�)*���Jڕi��Mֳ�ys|HŮE*��o_oΛ�<tմz_Si�4rڤ���m�n���%�u$8�2Mm�+H��U%�?�I�$qڴWQ_�ΖQ4��$��[n
��n��9��Iz�b��0Drwf{I<�N���x��j=I4j�$��βN#>��6�@ 0���ML�����PI�2v��3����Jɯbl@�1�;F=�UD��/��C( ^�у��T�[%Y<��?��>�HQ� {xS�n�F�K�I3�)6cڸ<�B?��g��ʽ���0��tM���%��'��/2E�,|ZcrmE�;G7��gK7�z��hsN�0����+� N<����Y&�e�/�tw�(�ɭ�_ڢ-7��ΝfI��΁@�c�W��ڝ�G�9M+�>!�o%̩��1
��K�0+]tK�5���څ���� '�E)�Lk� �H
���=
z���u��f���v8����^W����{�����z�B$�"��xƟ*:��}*<O��CSM�W^��c�V�Y辚�d�ń3�q�,v�����*��e������>4u֏����-���񆑰y��^tqf�j��sm����~��m.m?��#�G�����X��8Ғ��f������	r�e�Б���I|���yUh�[� f���Uֵk��[B�6��$�߁ǵq�S���Ǎ�g�ރ�?g��n��t��C"򏌡�8�������Δ�h�M���]=�^�w���Y���/������璄4@@@@@�8`{�����C��R�5����΃;�$���+H��@�⹱�P�+��Єx�e\�`�>���F}�����N��,��e�ǟ�q���:�}�n/���X��c��6�݌��;}��K����j�J�ܦ�!q$w<�՟ָ�A���M~�JJ�s)�E4[�*ÿ�Q�
�K��4�	����8c�'��$B�� B?�kQ�'is&���w.Ud��%�9�H݆��JH�=�_����,+<ܓ�8�ѰFB�>�
��&�S[��ci�Ў5Q�E�T8 �ÿ֡��o[բ-�A/�I���5[݁n�i�Bn{w`� h�{��e�&�t�Ok��@�4q�f���� �sS^�swow��3D�9;c¾1��>�K��V��A�z}z^��u�������Ob7� \|��)��ˮ�2��ŵ��.�mpYǵ# �|����$���ѪF5�]s�Y�cT|v�x4 F(�"TB�X�Ĭ0T���m��p=����>����(����)�o(!G<2�_��%���Ny�F�s�`�Ź�������)@�䓒��<��x�b��q��1@@m�I�bY]�"m�1�U�8�$ДH-V&��ymXyL3�cf �� �[���1M��E���=��*^'�	��*�S�� ���p�L��2�6���U[�*������9I��Nq���~jR� k��γ(�&�����.N��8K���$��<��(��|�\�'�s���'�.-����	RdQ��0���G}�ݤ�钄I��<#��͉�9ϸ�5H�L��$��WC�Xz̱�g2��U9'*��hy��R��`ޣN���AY���3"�Q��H��py�o~�ο� ����,ً�~�p�<�k\�q-��bK�Хk(#T����9� Z�7��SL��C�97�'�r�����-έz��_i���c��^Ǐ��r�G�����l埰���t�Ɵב�C%ԑ�mww p�����qy+2��-����Y#8�;����B��Ů�gj���.#����	��yr���d���$�G�_�/�d�+���DizkV�ق�k)9��<�u8�\�q���9R��P��؛�� �?nu��LwZ���� ��[�������a���!8��k=#��o�I.gf]�Ĩ0;zq]�\T�sd\��;�zKZ�Դ�����݂�&8'���zm���	OQE��u�uMKX��GL��k\���0VOE��<|���e�ﳻ�8�ϛ��R��<qn��v�U����Ĵ�:��]Sh{w��ڠ��5�<��vn�V1x�� �:��mOBԎ���K̒��]�9�r>x�_v��*<��v��ϳ�Z�f����L^n纷O26Ry���3Zg�=œ���/�n_����N!��U��'��|���k�u��4r_�F�� ��T���-�ZWP��YF �^�5��g�)�,�	8���` (�(�(�(�(H��Tc$㓁@_�ݝ�/������H�h�#>涋�nʲ�t^����}�@�Q�K&�����.[�B�C@,�d��%�x� � #����I�4�l�u=6��d����p�0N?�=�޴��:�X����U�Ŵ�$Xa�p���T&���%�� t� 7R��U�!k32�$NÏ���T"�l��]SW��(qDL�u����r�ҴU-���k���/b�(�#�lAl,s�#�ұ��j<�(U���ۜa�3�5Rh���]���y�]wXw�(	#�A
3����$�l�HLXy8�� Z���cU�Ԯ!K�2F��~Sr}}�ڦR�@l���V^;r�v>�@e���G�N�0@K�o�m��H�� V]>�ˁ�%Y8,�}M^�^��ݯݯ�ȓylP��=EU��5�ƈʸ\�B�y�>� ׻�΀��c%�*1��ʂO��J�� $ � sR��t��D$�p�����8����7�<�:��E�	S�g��Ԁ�t��j%h����&�����T(��IF��^�6Gp�m�l��YOӰ��o�� "�����[�c�Q:��13yR���G�Q�ظ��J�vܼ�Ҩt@w��P>A���tF���E�[�s��w������yӝ����s+Ie(�2I�A�����H��u�`�����I1�
��p}k?TY-o����;d�7��y	$�P�0W��Z�R^�ho����h��i3>]�n|獎 8����d���Q���ݸ��9�����a��jw0<�k����F�|\6x��M��څ��b�֒wc�vvn;�*SR���#HndE,Ȍ@޻IǸ��2�bg+�S�o8�f��ax%��O��ҷ�Z=B0̬Y6����ʹc���u4ϻ:M��4�Y�����x��xb���r4�W1�j��AQ�8�?:�K��ʩTf|�� ��_��V?����F�+� ��~��mG�8����M�~_��ޠ�$=;�Qt��Wz&�y�\ł�A)ݑ��J��Y6��d������ �:��^�X.<��w���$�8�+XJP�&Ss�+�����-�Q�v:e�3�w2G��U�E6^1r�H�;��
�~h];gv��X$E��nی����ŊY$����_$����;�eN���mo�~ �5�T���Z�xI�9�挵aҞtwD�}D��,�G''߽['��O�֐ïxaq�Iqkqy�g�1�${�xIU0��%���InP�J�?/�rIO�e����N���[ۄq�q��Â�R��͝�Q$����T�zk�����kH�c��� U��2?E��\�̶���`�j�mT�>d�����O���K�[K���(�i�N�G>E�Y�W�/:���������{K�X�r>\����qh���BB� P P PS��f��)����Ci���4fGkl�q�pO5�����?fF<K���H�����y�r�1��5Y;�z!�K�Q3�R���H�=�;�F�-�����Q���K{�5�4�� c5���mZ�+�b6�,����}*��#�H�ƙ�L��[�JR�Io�l��+(����ZCP���6�7��o������T��.��<s�M��W�f�_aΰ��!���X�w�>�38�k�${z�E'ۢ�YL� ����y�:sT� ��0z��sڡŧL����UΟj�r�P���q�{��ug�X�ҳ懠�kV�$+n#�³��7�� �3ǯү�`Y�j/�E��J�K4WqbU*p a�|� *�+�+�i���ԙ�;�m��Kh��F-���#�A���&�SCr��o�;K�2�ުI�e*��*Ð�q��O�[�kF�P�{y�a[�ώ�܎{ՒOd6�c���5RO4@{�'��M��� =q�=N"��@Y���d 6>x�=¥$(BT����ڥh�o�7�NB������O���.�J!\��n��q����Sb���F���<�uh���)8���|b��N�Y���.o�NdY�aT�B=*��,�Z��Ј��7�D��w��7|~ur�5Oz�1@@�O:b�o"�z������o���WLџ�7�y�Ƒˀ7=�}�ps� �܋�s�ܟ2��\���<����w�ͤM�&�4fD�7��*�Tg#��ǭQ?DH��ŏ��8f̌ q��F��n��2�^D�Mf������ޣ��y!��t)v&���a��s�?�-$�\r�oK*f �Q$���nڡ=���6��D��#a��N}y�`н�}j m'8ǵ �J�^����:>˔!�}g ��D�i��u$ϼ��k�t�v9��6,���3�\_�=!\�{��j�-?O��V�fBI�&�(��L���ų෎=m/��,�N�,�`����A������\��/C���by����
�Q4Ҥh7;��=��@}T����n���;����/���5�����`�>�:��6���qXc���;z$
�i��5���=�r���1��� ���,���0E�(�9��ԉO���n�o�BH_��`^��?N����
�@ �����s�ѮA�Fs�*&~��{�o�q�N<n���Ӭ,-�]G@s�C,���z�������q�_fS�Zg�zЃd0�īJ^F죹��6Z\A���n��R�Lz��Ԁ�@@@m�_2x�,� ��'�(�K���K{|x�A�m ���k���!�L�z�Lu��P��#$����\q�;Oj�/}2=D�mz�Y.7�-#b|G�.+5�b}�]g$p߇}?ba�C�0�G��;V��Z�����[U�?*�K�{�� n*x'՛�����T49kom��JD[{KYf, ���Krl��g�7��gBԺ�j���{*Jb��Ш�C8���z�iM>&�:/.��H�i�5��Z�ב,��h[����R��}�=9�:έ��zOQ�Z]��tn;�L�j�}��(�k�7wc����ڌc�7;g��1���G5-s�����;{).a�Ik$b1���88���1G��f:J��[}��#n��oc�0lz~�|蚡D:���$L.G�� �׸��	�+��l�K0�N=9�v�<ѴFR������#׏�Q@��dpĳs���mߵ@>4�"1K�I ̊�T�[?όsۚ����s��[\"��lBcj��]�~���G��H�P�)��9m��^*�`.�҅ӂ���	hU�H= �'�Y-�j�u��+J���� �*����� z���b;8%��%�#�\871�=>/ATI�'�R�X�V���g��3��֬m���UD;��j�X�?.i��M�p���fP���>�����TU���G�i�B�B�`*"�B�=��'ʧKM�nݑ(�����Q�@ H/O������J˥cm��wW>dp� �M���J���`�N8 � P P-�A�@�����'1N	bF�s]1�vS����^��\><���yR!�A�5�1�2K2ٷ�����UR8�����ɡ�J�'��
�i;[���`�J�rI�1��1@y���y^P��)"%$Q�7�"������'��Ҫ�h�B]T�<#?�z���`�0s����2L�121f'$����ϰ�W������ ���W���z���#$}�zS|��F� ���ï z�[{���Q;v$3�'���z�����S���I�Mv��4���,� =�>� �A����WIj�(ym�A��>�����-4��������ޓ���e��Hb��_Č=Q��#�ncp��X�;��}�� ���gď	-�n�D��@� ��������J�k_�zJxS]�ί�)�s�O�v+9���XӾ>Ur�����*�OA��Ϧ})�!�����jsZ��<���⹹q�8>6�0ʜ�0���{�q�;ԅ�Z���?�՞U'�)�5�ǚ��{-Uʉ��I�Zu�{�^F�Z�D�H�2e��&�+�IG��|���I�#�_��^ep�w,ag�P����R��.�� @⠓q�� �
 �
 ��bsԚTDd=�JFq��T��ng� ��&����s���q��V�P#�6�WM����#���H��(s���kHz��t�t��^]�#�v�TGn� ��)�а��)o����,Fxa� �!)!>�cWJӲ�>�-��%�����~��y7 g;p� ��N�d���Y]�U��k5��e��/EpSo3P�%�?h��׵8���rEڡ�!,`��1�})��*�ѷC����I��a{Éo�� 9����ڬ�Z:7�u��M*��+���~q|��ϱ�UZT�K��i}/C��H?d2ú�4����y�l��*_I��-���f�����yq�>�VX���O4��uS�c���Q`�M$���P#�s�P	Ct6�����t��{�V���u��/|�~C4�wV� :O@�n5N���57�m��	�r�vⴭ]�cW��
�xW��r�ku��U��I#,�G Lѥ��H�b���s�7d��`P�#o ��9㚮�a}�Ha����D���(�2�䏕_�E�o#{��b�C��o����{/�ӢY��f���z��~�k�S�5t�@����Io�����A�#���]6��cU���� O5�e�� }���Ȭ�Ѳl[e���cQ9A�,�|� �S��6��/VE�ݩ[	%e2�� 9I�ɔ�2;f��g�#vxZU.�x�v�=��۟z�{&6��48ZI$��3��\C��Aa�9���;)��4mb�0@Wn�Kf#�����+7V�k�)#��_
�F ��X��V%���;�m�s�� �@@f��K4�AӶ/!�Xď7�s	U`��H9��]Q(��_y�Ipkec#1�|�b\d=����K l��e�������l.��� NGps��6�C}�"=@E(��1 �?�QU�Z���-
� �H�G�B)���~u�^���Cu����"Ir.>m�#w�{UR$Y,�M���1D�f��G�ɫR@K�9���F �9KFǸ zU��\�V^���&BNx$��d����
�� �1���^���++�^���G���NJ���WՂ��?�R��Im�zr�K%̊U ���S�v��2i��>{�YQ�z��;�l5����䳔J��k�6#�
��$�)�vu%��L�E6&��Dд�hx�f��X,/�d�J]��:��u��mK_ե�Z��qq"���{�zWIT�iU,p;�[� �.�#�8�o9�X7V��^g���Yc�_�:�y&�7ꏰ�̳8
����j���H�M-�6c��/N��� 6�o�A`U���>��h��$�2]�;��}�v_�6�����=��A�+�>^�b(��!�� sT�O-"ƛ�8��IҰ���JԛR�̪�%Gœ��W,�5���8|�C��c�8����|�� �g����$YF �����	��a���RR��z���qΗ�f��^��6�Mg#&�a� �d��z�YTr|��9D���ɘ�BG}=tX�ė�]�Ny� P�>E���*:]�u�+��t�6X��\��A��T�
 �%���S�F���Y����v�ר:sR�
�����IQ\��s]+J�ez)_,�F8��\"�9�L�q�8"���@��?S��kjC�qo YVx�-#s���TJ��G��N�s�fܤ�Ѯ� `=��q���;n�'H���a���t�&�nfo4�:H �5V��hl��Sle��@rP¢A��,���"�%;�����2��%Xg��� ���lC�dE����{|�h�]W���Lp^����%H#�ww����K���w{w4�',d��������J�U7F
�*��r��=�}*����]B�V,dV���&,��e�R������ɧ�t�f���e��׶��c?:�"G��~���ho5K�.�݃E�o�v��?J���"��N�X�i�&�yX� ����'�dRf���7�YA����*|�S�F[�H�Zi�a4��#*�c�܏~ÿ����\�.��\����ګb�Pk7�V)
��������U��z�֮,�/l�݌�ʡ�g��Qmt(���;��G1i�l��SSlQ��X��E3���M�B�\�c�Xz��B��mNi�����0ݴza�5[b������#ka�#�,n���d�E�,ZI`|��g!�#���a*��(�Z��ͥ�O�3��d
ba� e���t씬kfi�Y�0Ĝlo�p���Ω��af��v��*\�$�X�u��Q�U�Av3� P P-:u����2�I$���HY7s�{���D3M���H#r��i��ݐq�3�Edm!/{��G�7E���R1��㹨��Pi�-�������9\0ノj�'L����P.&��V�A\gd��{���Hu�ڊb�X����豏����V����H����ko"�$�Xq�c=��Zd�����`����G�Y=챦���NA��1@��� ��T��R�m d��9���1��^�V�/�z^+�I��קּU��ug���h�G<?� Q^����	�Sm�]E���� �
�z��:�O���\�N�.F23T�T���K'�������=��}��q��$�0+;#��s�k� �NW�O'�. ����s^��G��P#���}j;,�vlR{���'���W=��'>=��}	.u8m�p_sm���\�Β�mR}��b##����ղȜyz8n�cm�T閰�$�Hx5�� �4X�tC�G�
�O��@�:���FS��i��TG'<�^���m�gι���D���IRKp��n�c��U�9c�����u(&�h������]�$+�/,|S��Z��CC}n��Q���qZc����2ȯ�&��=c{����Ek�����enʇ�l��g��)G�m��������Lt�O����� ��~������?�pOroΧƔ���jR�F�a�P P P2����I!�팮���ޥ�nmVi�ª�?�O���Sw�U�7�.�zŔ�)n|�-l�k�' �����l�7i��+G%ˇx� �	W9�����*����f��.��y�m�2�k0�"
������*:V?�-��i��J�I4�8�q�)���J�ب�mq4OhӀ��Øfs�T$�0"���%��͎P7���� 쥻:%�"m}�#`�Y�Ao`}��Td�bF�#c��w�q��o�Jg'��F�ۿ��O��#b[��p*�X��@=a�¿����ڥ3���$>o=�=�qPq��J� 8��^{�;-O��紻Ӗ���q�Z�UU1�T���Sa�G��]�U���,�@G��<�#�8 sǽ+��������J뮻��Ғ�e�
 c��N]QE~�_�������Ă\�is�� 6��S;��(f��i@r�cS��� ���Y�bI���c���6�Y5�_6�@� ?���z��W���G�AFgW!��x���Ɖ"��2��8�UH5��I��@,�殺��f6�\Ԯ�&׶�Xo��s�t<�U���s����K��j�Q[t���T���2�e'l�T)գ֮��+�Bi�,��-�i��Q�@' Q�[�$�e��@��9��9m�,����[?ƪH9e=����S��2	5�
"���I���4�/�aږA��7�p�������R@�@�p9>�+�`{�=EV�\��y�;����m��-��̎i�$XC�ʫ�
'����*E���$���<���iR�[wbcnGά�;d����o�(�w(��q�O��%��d�4U	
 �3��u
H8��Iz�����J�:y��{)2}F�>3\>^%�F	�l���d�.��5�Y���n2�'���b�"�)�X�Xܵ�]y����a����&�����@u���]_���4+7?xx��M�c���9�;��T�;|y7qg����7U�hY�8$�9�q��8>i���⾒x:�����e'��>�W�mQ4l�#h��8�>B�?4{�0���9�O���&��m� PiW�r·���xls���y�Iq�c&T]w����h���xH!6��γ�V��7m�� �7�N�E4`/�� �3�ժ�I�&�����¾��o����+��'�Z���Eцd���@��Lvz�Ǉ����+�v�/�2��ֺ��jY��`����w	%0>���U_I�O�f`H`�Sدs���N|=!׺7��lE#ԘAvPm:�d{�G�^�9s��C��d��> x�����t���2�TN�PG�Y��ǧ 
�(�N^�ғ�Y�� P P P� 	�0���7��m��έJ~�{�d�ƬIa������M�*�g<���/R�x��K���^=����t	���5}gP�[�O���&o���d�l�RS���:��.�:l�D	o�<3�a��h�N,r�Oq:�,���>L��轿*�{��Mf}:�'��8�dPn��!�p����2�r۬�kj�n h����������F�b�h���G4&���� �?�ҩd�]P�7Bާ8��b�r��U@�E 0]���Q`���re��'q.pI�;�m��I;�]��(]��*�<d��E�T֏e;	1��)�~���P4�$\���v��a����Pj�Ul���b>���R��I�#���� 2�m���2�=��@��4�ωO����4���' z��2(� RL�>Y%�ݰ�}�v�BOV���Y�fo)���S�����J�R�{oޔ��3 '����PJ��9$��P�
 �3����]A�h�,��� ���b*	��'���eD̯<��(��X�ˎ˪��q`�,��RH�@AC��[��*oTȭ��U$(�(	R��=���3G,��:�*����U��m��g�M�O?�d9g�%o��|՛t�$,�u&,�<�+
�3�e��b��8�A�d=�8"��[ГC
7��>tA��q�*�ɱ5���nV[q,�=�; �Lf�dm$2�9"�Y?v�a�#��	����E�#�b�]a�@%�b� �<b�K��ȰP�F
�X�E4�(��R��d��c@y'#�BM�W�:t�[Y��R���l�0��A�C\�УE��O����J��u���L�!V��D$�bA�\�R�����V G�>��>\��\Z%~}������N��C�R$��x�;�d��X���1�M��>���q�~�г��������I�;��=��q���5���%<l�� �� u^�����!{w'>d$�'>���]���A(��x{�StOZ�����w!�{��~��Xs��xK��>�h�V� �W�M���aVp����s_3���/C�O�D�Gѵkn'�h���]��5�97f��;���ݪGs�ɸ������R���x�����&&�I��W�^���[�Wњv$>4CdwR4ιm��ڜS�w4����>Z�h��in ��8���U��V̛�����+�:����4�2�*��'���Ҵ��V��v�G�K�k]ᆣ�cٍ#���0f�y�����I�Y����
�����H�,�D�	�_s�o�v�����Lo�����oYA�=�k1��s����~F��ON/�ue[��Lar9$�zs[� ڇ�X�`�g�z}����2ڒ�+2�ɏ�WF	T���&՟�l�ӯ'��C��H�������j��vh�@@@��� �4b $M�A<��Q$���P�c�(�H`��R�}g9����q"4b 6�Ѿ�w�}ʳ�7�B�t]"+�k{��K���������jWԩ���/[�ZT0��U)����l������D�Btm;6�F��YAܮT�<�������mfh纇ȗN*��&S4L}G#<� :�KM!���y� y�E��U;�G'�|'�>U���%p¥���?��j��� FU��o#v����4n���p�aܜ��T�C6��0��0��nY�|߄n@o�嚔io
�*�U>WA������\]4�T+7d]��Ǡ�@h�$����� J�1PAb�ؑ�4�3(B���N��'>��o;U�� ����P��ʭn�t;5�:bH&��uSm����
���Z4��+c%܊�.3�CnL�²��J�@@=Y�F�%Vo�r�(A9�S����k4HT��
 �
U�s�<q�V�%�4F����&cm�HUo���涋UL�!�l#(�y�݉h\:ٷ�ێW�ަK[�� [o����!y&$I=��28 7Ğ��VQ���ݯk	j�hq��
�D둏�Os���*$�'��0i�2j��ȐܕT[�C ������j���_~ �򦔦�T�����,�������:�%�ی����كdcp�T�+avC��1\Ȅ�H?� )�/�}�X�U��
W�~� �� }x��i�jVVp���R�"C cדP�m��ri#�O�e����[k����o���[��9r�w'Ҹ�{�u�1M$���|?�}w�K�,l&ih-�� Ue�rԘk��!F(>���N2��=����]W�D�ic�^�A#�ϓ>$X�{0N=*�O%�_���,����]�:_\Z���)<J��ʥ{�w�j��w�k��px��g���]���u��J�c
)V��zz׸��4y� ��9t�(lb�1��>����������-�ƿ�P�B��9���|����h�qI|�t�Ek��C��7VXZE_��n ��s�p�^��Eȱ[I�U��ު9��C�s��;�\Z<�u.���8��Ȋv����;��O$d8u82A��4��jUb]n�#�ȉbWv��߽_\j$FM�dN�K�u`�U(pO���5�\�����p��M��})cL�er���{��ױ�ET����p��4�jV�	o8�5�>�u����9�W�:m�M]�<�a[���*{2�=�Ӑ�iq;؆@~X����Fy�7�@9\z�*���=�>.���+}�u�����cQ�D�n�c� ������*G,}Q�uT\*@P P P�~.��иE�m��p=�tQ����m3��$\���g�<��R�Vs�:�:�T�\�%�ʳ*���=�	��V2q�2mto�.tx��Th-����?_��մ�-�?n��o��Օ�Ho|n�HPs�R���d���孪K��]�cHF��ϯ�T']5��(�v�Զ�/?{z�-�����DF2� o.O���c��U���V�Q*��!�s늩&^T� �F��c p�X4�2,���2 >�ߝ@2˵��s�&��&R�q��b�};P��1؞q�M�(�l�����@��g0���<���@k+�� 8'=���zn�aհT��`;��[�^<��-͈n�s+�x9�y?ʬ�*/�/�E�D�CyF3�e�
���W��\��l۩��uu$�y�a��. (���rjӟ'a"#v�K�X�,O���W;�4� �
 �
 �
 d@����1@@(�QE[�+Ŀ|v| ���K�G޷��!��9.�-V(CM�i��F���ާM��Ԑ�Ip�T}ټ���ݔn�>�o�D�7��,�����c�,��\����oT��b��[����\��jw�=���id�V��EH�P(���n䷹Z�W��f��5. Y"����o�cێFݿJ.�}��f�!qŜ���1�����ⱒ��q����2}��Y�0�����d�`c ���PG�CÝg�_�y��9n-�˄��
�Q{�Ԛ�#J.��gF�r�>���^��E�떗+��$�LC'��^L��`�n*K�l�dn�?�3���
�@����@f�^d��|�iպ�M��Y����70&�C� ���e75�
��q�Sբ��G\Լ!���Yk�K[���!GO��"�zd~u��#R����+)Ϗ���?o.���m4^��a��.�mҞ?
�(�u�� ��-�)��۩j�������S^��ۤ��B��ܓ]ޔs����� T>�Zv}0� ���]xZ&��́T�VRs�'����K��g��V+:ϥG��W+wk�r䈆�qߏҸ�j3Vko���k��圌��Wrt�����ԀM⮑�j���n.4���'�"�P@�I����(�RT��m	�W�Κ�BK]6�R�6��̊Or��+�+�~����j/D�4�L���*�J�fm��f>��y��c�V�͕U�\}N^�txq⇄W��[����Jom�?;�� �s�w��q���9s'*��gC��z���-�k�8��(Kn�1�W|�ZfQNOGׯ�� �Z�M�Qk�A���18�U?���y2�\�Eό8�Hp��8�s�r���Ϙۀ!Nq��s��h�0�ϛ_�b���BjATH��@�;�����ᚔ&�r4|��I
 �
 �
 ��wU�E����q(<���t>�ҟ�,��~�W���� S�{��ȕ����>B���h��K���|���S���k;Xud�{��}y�??�V��JFOoDg��w��1���k���ŵ�ǧ��vJtA���!~��ǟ9vK��}9�wA�d��hm�a2+���=��̰�Y���9Y%NH����� Wױ�U%D�����+HӪ�����ɴ~�����'d�5�-�T(���)�r}�BD�����/gyY��
	�ُ��?Z��*�4���y-m���2��~��X~�Y6�,7g�(@*7^��U$�]�T�<�7�@	��-��NW=�
 ��D㌌�Þ;}(r���Wk H-�|����y��y���C�q���qK���(�e���Ϧ=�@���Sn{{s�z|Ⱦ`�ʯȭ	.���T���Þ���F�JIk��d�Dxbe��L��U�VH�{�`� P P P P P P�]�P�t�41I�JSδ�(=�'b?�t�6��ŗZ4�䅣xn$0��`�6g�/�gެ��GF�3E�ӡ��Y�6����g#��?Z�"z������K�\Fe9�z`��XN2Oeӳ։J������� �c� Fr=Gl�c��d�W��ۥ�!���s�嘂Jz�Wdҫ�4�z����53D�[<�M�22�z�AZ�]]���.IY%�Ye]跩�̤m�>/M웢qo%��C*�3��A�����g�V&V1F��G�*��H��Xő��}ր���&�>��a6��-�W�,9��ذ����>l1��[7�>>�i�&ZˣYC�:|Cr��v�y��q�q�����Ǹ��d�Bm)-��u�����Ewӷ�25����o� p�ʺ!���5�Q�Òԙ�7���o :�����k��0�:��U���ȩ���O�bmK�vU�_����Ӫ<F�֭l �tR%�]=~2 �Xo����)��rFR�޽
*����(��gm-��p���UMM^�7�}��!�M7J�-�[j,V��t��F{^�ϖN]���]�����t��(R�I%�~/��Q��R}�\J�ϵ2�sb�3B��S)"���`�4n;ε�	M?��d~�>Uu�Yu\�y{�7����J.^��r�9�x��n+�⫏��9?	�� `���<T�#S�u���P�H�K�#wP ]�+��Ҍcz^#_S>�[L�B����U��e�k[p&iW�r0	��Y�Wd�\�zr]���5���ʶ����H��:��K�:��N�MR�o9Q���$|EW�'&���Ji$N<J�R-�{A��ګj=��D�z�ӧl����TP@���+�S����i���㮑��9}�Z���t�m�,���N6���c�s�R����c��7>�_i(~нY���g5�����j�?�df?���p8��Í�y��&Pu�@@@�F�kV��|�]��DҾ3�2j>ğ@��i���N�2i�
�֊?ȇ-�����y�u=��Ks߭�4��rp� N�f�H�Df+M"���E�#+�l����1P�E��j�����umq�C�j�Y��F��5f��"�y4�0_x�_��(�"�@�>D����U��OG�SFVK���1ߩF%�w���j�B��e6 �f$>lGi��³,8h�ž��s[�wF�X<c'���7Dvx�_��5�o�ذ�$��=��T�1�{��m�o�B�U}x�e'q|Yn�z� �1����0��C񵳌P�F�A�7��/z�P�x?�Ԡa��@�?���� g�M�G�f[d�2��C�>��ږm#Ʀ!!1�Vʚ�����2��w����9��-�O�جm�4�˴�4d���B��DUR�B�(�(�(�(�(��ޙ�Kh��)�ʨ��ϒ8�޵��FoC̷J��O2
��գ*Fŉ�������L�7]Nְ��.�����@`2*Ԗ�� `2ut0�iv�<&9)Z�%����}W�³ȣJ�.�'�m�/<�*ֲ��G����UcVCd��}���H"���c���?/Z�N����"��k+;1@V�1�b���}i� FOc��>��a��*J��bl?��t��]�YQkP���2"ĩ����Lzc�+�]� ���;Q�Nԭ�,�C"ʾ`�,FJU��l���Uϫ�~c�u�8F.4��������+Ɨ��E�юE$�.���m���x�;vL����o�^/'Ѥ���j�'�'��.��ԯ�X���y5��ƒg�9)J��
�In9P������	B�Ae�G$�'T�/����G�e��gb?Ŀ\�:��x?'��-����+G�b00;��ι�˄w�t��˓�>��:|:u�Pā4
�=�^|1�)h���&2x�.�����rֺ�[9�X�3x��V(��&r�n1>.���uZj�}]=֩��h���p^��B�G��u�8��:���G7XXt�zΩfc0��Y�w+����YM�;n��jK���A�xQ�ך}���Gk����A�/�p{���\���$� :qJ]Y�s�O����aX.��H��;c� w W��Ph��R'�q]���*����QMݘ�l�^�}5a�0{lnb����\H�J܊��r�~�h#�� �f�9��U�����;:�ƶ������+|*=9��d����*)T���P,����2�%T��^>���\U��VR�E���Ѻ�E����^[J�҈ˣ P��u,����\\��8��׫�n~�Lj�܄�Ke&ྦྷ�j�%�b[sG�?D3j�M�}%��i5��X��u���>���H�U���	*�EZ^�q��V���]]J�Ą�s�����'%�7��-�IE.�~��u��Ԓ,},�RS	���,89���w��ryU��;�� �ө}��Y�q����I�qc$�p�/�+X|c���ʙ�����F���0x���=ƫ���վ�fW�Ybu
9$mbN=�|�2�GD��)?.;���+�9����᧌����~^9�_.)�]�s�Ǹ��kk�E:� �l�H�Xy�>���]��Ppr$s��'�!ꨨ�V)��*���@G�Ul�h��%e�GR�a����j�D��4"� K�I zn��(ɿsh Wt��>[ �=@��(�޵�2,`��S��3ꦖI�K�Eg8�a�I_�@�hk��n�Y�7�l8�$�<U�"�E��(ڇj�*e�z�a�}h�<�� .Z2I\��q�?:��ŕt�{(�!dh]\�>���c�n*�CbO�JZs��c.Pch>�I�	+��>�5 ��-��M#ª<���&�8#�{՞�%���ݐ֪D~_�n3�sϡ?* ܾq/���v��PF��hm�)TFcG+�Q�� :���3���[��72�>ܔ�};������ZeP P P P P Pٔ���0�[=�(=�bѦ�y���&����F��֐z!�i5ޘ�ym�e��?y�|�y�>��m�Q�h�ۼ��+�W�>t_�Z3�T��С�S��6�c%����b�D��џ\�e$�7�Ηv�Gwp��op��$7�U�����fw14� ����`�� �T�����͕�[�$hr�ܡ����� }hۍ/�o��I���.`�-XK�d�O zҭ���� �G�2F���A��O�5�.�7U	
$�F3� gҀ��(HP���c��H��l209�>��H��ʹF�I�UF���>�<H.O���W~(u'ݶD,B��\:�b�{�Uu��iK�>�xU��9�]�.��A��s{��{�z�*rx�%\�sq�E�'�7j0��d�O^D<�z	�n��].vx�f(HB	�c�i���T|���YԬzϫ즳�N��m�x�M���'*�?׽T��캴�h�������L�/��ro�ܑ�pG�o8G$i���{뎻��C�9��fq5쾪0zHAB<Q���u��k�k�E��G�[@e�!,����<W.|1�Ԏ�d���:J��-��ts�D�5d�cY�Ɗq�~[sϸ�q~�&��_�Y��"��ϴ�\��=�P�D��Xbg�'�w �� J�>,{��.�=)�e�Z:]\O���4f@Ɯ�۽kQs��:[u5+�-y�Oq�DJ�e�a�6��5ҼU->�,��Kao����K	X-��p�`Ƿ�+��������%{=/�ō5�;�/�=mB&��亽¥ʢ*�o�� l�_+���~?���x����3� �ţ�4M�_�]^�m�4׷��\yn����ߊ�ˏ��x�[���tvb�(�9?��}�x���������n#�	L��'�~��~/��_��|���9��Q鲥�\�$��yӃ�9�m�����\�W� FE� �����u�Ϩ}m��Ox_g����W������Cs,Ʊ��y� z��;�? ~w7�����s��A��c�-�&�� O��6��'{�C"��
yD�K�ϯ#���~�����j'�?�����f���Lx�Ꮏy��-�v��*jl$�a,A��� N�>�<K��w�c����)��h��ʪHF܃�lc#����ŠP�p��B~0cl���zzhW3i�]A�u9cl89� ���U�Z�E�({��J�pU�3�ۊ���;������ $5@6<Q��+,ᱰ�R�G�@b9 'j�6w��zÂɻrNI�O��(Vz{�G�Onc� G9���O�JV�6�pj�t#��FI�/¡���8��:�iQQ���X"�"A_�w���T�%�y��l����]�a�*��������OVTH�M�s��IV�L�.b���[�;�D��7�V�T�O��b��$גyn�� y�{���[�e�x#*�.)V��PU��~��z�q�k�|�w���K4���F�]�'�52[�ӷ��8Ȫ{��M� %��8=�����o�Fo��t�\��EY�%Tf*P������ ���5� �
 �
 �
 �
 �
=�P�[�.�h�H^�(�p7�^l8�/���tC��O�[V-+3ɤ˹Of6�ޯu��[�Ǩ2^C\N����3dcv�'�j��;_�.��o����,�a^%��x>��5�M�˭kWQ��m�!u8�.s�W_N}kT�O�*>O�,6 ��(B|�\`���)/j� a��cuq�X��ILFM:O1J��,�����BW���6�_]I$�	%�l�y�_|U��D��D���U'�d� �p��r*���9�K�
 �
 �
 �]f���R�ͪ�<�|�>���5�Z���Zf\!B�����C����n��~xAe�E��GB�\Ku+1'��������K�ٷ]˳�	�?w��������iT�-��v�$��z�L��ۯ<��C$�����o#���H~-��g���������
09�8��r�Ӧu�q�̚��:S���<��$����'�㰮�����rz��Ծt���K��Dlwq��lT|�G�~����Z��������g�}�@�T7 q���9.��*/l����Mj=��!�>&89_c�A�VK&�z��,~��kM"��E�� �7�a���ejr(�qh�C�Ai�mj��/��]��혫}��d],�P���x��R��.-%Ĉ�Ŗ�/L]��HE�jK��?P=O�������==��[h����ZK��m%�R�$����=?:��d�䷃U�]����`��{�E���ϩI�Y�4�0���%��	'����8�Gj����y){��Fyd��(:��
� �J�����j�Ѓ' c��ް���7�� clN�G�:��צ��.�9����]ܤ����Ͽj�/������5�&���n	eS��q���=��N����O��uҿg.��u�8f���t�d1�0�x5���r�/��c�m���'�d���_¿A_�z��Ѓdn�`g����T��:z���d,�s��Xg]��F�����EH��:tVZ���X"hIo�7r���Rd�"��X;X��\}+2A3�yk񁜡���(�Nܶ;�lz��k}9��a�`�
�8��� njހōطI"�1�?/m�d+��!�?Z/`H�+��hê���$P��O#���~�u��$�,��u�-���\(#�%=���?��`��i��Yuȣv��nN�r~���Q:v(E.��κ�uVg	�_|3ƛpp݇=�_Z7lPi��:���V�5��H.%H?�) ��K�Zl���i�&�Xw5��bP�aˆ'�� �Q���dKW�7S�|�;kYU�ҝ�
{
�����N3�����nF S�@aݜ�Ĝ Np(@9�s�@{�x���9�5P P P P P P�ހ����:2�>��پ%y%���tCy?|bP�s+��N�����٘��YR�uۉ��p�&h�)
C� ��\T7T�Ȓn4�/�����;��A|���?��Up�S.;[�mCK�H���H�s���5��HC��w�X� x�#�0$)�I���k[D�3�H��#�D�Uy~�:�<����������]f��-eX�F	8K��g\g5��� 0�>��6
b���yF%��!"�<��j���!�j (�(�(�q����-��@�7a��d��x@��T�ݾRt�=|Ȗo�� ����dۓI��Y�։F�+�r_�y�Һ-�G5
Q��m� FFI��6Y=� c"p0O�Cq*'i\+x�%��湳G����Gn������F��H!Qs�b���^��.�^�Mjͦ�]���ul�#�Vt�vmm4��'B�g�A��3&�0�s�B��h�N�B��V��%3��[F�O¹�h'fwѳ�<:��⻸�bu���>���/�h��q�>�H��Җ�[���)(�G8���'+�Fn���� �����f��@D��2�o�޴�5ƤW滱�G�C.�ԣK���!0�6�>�y�i\��?��u\��^uՎ��Ac`�����R�g=�|?���\~/�q�o����|'~[��{��E<S�Lu�O����e����@He?ƾ��rH���s�R�߭����>/9jD{�~�zO�׶ڦ�u����˜���e�� v��޻1��e��/gva?��So�������>i�	u������t��-ĉ?/ne�n����|7�~~�J��<O'��8���X�=#�lN�R>�ޕz���ס���.�说χ6���e�R��wӺ��k��~�����5�^�����K������J����3��v����h��!�@�vܾ�|�j�'ƾ%4���V>����E���[J�m~����i/$���6c��w�*p�1�^��>�2^O��������GW����#��� ��ir\h*�F�z��TFN���۞�֊,Yd�̓/N� 2�џ�P V�Xzw�ڴ߹R��5%� F���bOp=8��KTJ!Q� yR���-Y�l?�Օ��|eԐ��o�[if�� �F���9�3!�B�UB���$��J�n@W�n���pp	_j�
�.�dܠ�.�kG���6q���R���$ʗ���,�r���O�<{��H�G9l��*F9>�T�*��#��h�V_�I�K�<%�+8��(��y {s�FV/��,�	�Z<n���ֈ�rX����1�<����� H�9�@`�@e�uu%YNA����˗��99-�dу]@
 �
 �
 �
 �
 �
 �@�tµ΁q�nE°A/�(%HX�~����Ů��I��VT��[�;��w�j�M���t��	s\�X��QA5�L` ��֮��Q�Pӌ6���A
.-�{o\���U*-Zz-/���<�Y-��� �t�#��3�*k���� %G]im8��2��~�u9�#ӟj��{��I墘�.���d� �k�oJ;�� ]~�r��Y���(����������<g�U�̊�m�-���dH�� L�dg�s��|��D�W9p�@@@��-&�^�-���l�(��+��P�/z>��]���V6α7��W��S��m��ܩz�Ԁq1 ��qȭޝ�kf�c
U⏌eH�h�`L&��wg�Nx{� ��f�^�]��iQ��V<���sVrWK������z�K/��� 9V�85�眥7�i&m66V�,:|sLt`���H�"N>��$��76)�[�Qk$|�6�A��kH�����ݦ1�7+:,�0��?1[�p�WN���cdO_���F��	da��w�Uڒ���&�#�:�ĝEA�[�X������s���_R]�rm�����|$��e�=Ie��8Q�MOr�l�|6��S_�j�7���r�>^��y"�Qn:��[���J�,��6k{�8����fG`1���r��0�<�Ru[6�l��	Q!����[i,��N)n��q=Ԍ�}�g
Mq��n�8��ƫ6G�[9���o־i����պ���pJ<P^:"m#��s��Q���RǍ/�f���&p&���=E|o5[��F쀦{��W vbMuF*
���rv݈*����{��-����&��9WC����*����(��{�u+l���\���B��������X~�Ը+.�)*��%[��S�F*A�,y��F��Zt�{X-'���̈́W F�N�|�r6���?�t>����h,�>� �/o�#���#����l�]\-����ph}A'���g;Od�5Y�l*� Bq� 01�@{�|�w9';,	���P���3�����2ry��g�5d�ܮ!���8݁$d�����l�,���Ar�����M4f6`���nY!�j�֨�����j�k���n(Z	C�I����Cg�4���vRע6\Ijܨ#�����)�Y�����\$�ub�Nb�=��Ƕj�*�ō����$g<�'��TRp��r2?� 1eO`��{����:C2H�*�c�s@y00��p��V8 �z����hR��FGqP@@@@@@���� �#��nћ�����a}ѫH~�13�5��G�\��Ü|5��V@����"��9 �_���1����W��J.���w^|�Pyɶ7'1����K��Y렙����ԈDne� ��A<��<֖���Wf�}&���d�0�x�(����'��mӢ�hb��$��Ē[� m��\@wz�ݪ�⾯ע�|.�|�6�&1��o�ǀ2IS�gґW���H��G�dO#��O�����V2�"B��@@@@u��w�Tע����΄�T�#�5�E)4��b�6}��Y#�҄�������ߩ��p|�2�[��zպ%lP�Gl�p�9�N=��h:�3#ە`_i<�8�l
��!,`�%o��w,�!���x[�5n�D�V�-'�zZy��b��_�vpX����|w�{�i���~#�&��I{��&��n?��=+��\S&��/�Ƞ����,.m����uNv���5��i~}YV��:�n�8���76�%��`�gߜ�ҳx�I�H����}I�I��V2��˗KܞQ�ס�Βӵ�<��nN� ��ǖI+0�x��O� �4]4=���L,�H�V��tS���t�� �,�r�c���O�tY5�!>!x�:YX\�P�q�<���8�ފ߷b?�f�cV�v�:;p
(a�����m�mw�����z��;��Bмn�����$g�\КZ4�h�٭iW�{����]ZN�J�0U��9�Y�tL]�T@@�;]I�<�� *�Z�[����T���@�1��2x�ON���$�U��[�5���D��� ~,ƪ��$u�������"�!�X�2`��֫��%$_��E���� :爛X��y!2#&�	��yϥLU�:���>��	�D8�������Wn�DY�k�eAe��m9�r=�9�2M�:��2ϗ8�����ʥ1m���3��"��@ҕ+�'a1��G'�^9�]�_}ob�Eyel�*�4��� '�l�ε}��s�P�����)���,2������d�Q!��#�g�&l�]@!��I:T�bX�� ��� I��ԏ����3�Ph�(�(�(�(�(��	%}3l�t���^L�Y�1$X�� :���c���YD�o�pY��\J� �1����/b�_m<���6�>Яwe'�9p  �w�*�[�_���xn�F�����E�]݆1����{z��,�Q߲4i;4X���U1�aB�=1۽>��*>_��dl�}����!#<��}�U����9x�ե�	m�.N��W=�*��J�e�K}+-��K�Q ��O*Up>,Ǟ~u����z�����0%O"l`9��i�z� �D�W)p�
 �
 �
 �>��������ػe��NO���;/7PGX�9�p�#d^���+��4`�{kC;+����*J�(�ȭ`H�Ў��Z��c2�yN��a0ԟJ�$�lqrtJ"��;>�w��ɺ~��&?�?�p`��M��Ӛ<H����:id���Ȳ�i�` q���W��ҩ.�qI��:���I��do3j!o��~U-�=�H���P��Ǉ�]�:[�Zܟ<�s,��C��W.k���*/Ё�'�/e����)��|�HS�O�W&>h��v���5]�:v}v���K��r��q�#S�of�U9�S��֌w�j�V�� ��G*�n�0k�I�K��׏�Ȥdn��ߚ�K���H�t���e�K�ӳ�)'9�� �U��� ^�컢��\t�M��9�U9�w���tMòe5����)s=����Z��iƾ�3�$�U�"��mE+:�N���:f��G����b]�r>�?c���_�~�x�<�����o�re�-!���^������ֱ�X�d��%I8+#z�@�� �y��!9d{G?��82F0�G*��!O�:3���?��[җ_���t7ɷ�� �@z�x����������^4W)���3��<���t��� �oD�^���W&8�4o2�|���8�7�M�(�pI}��°��&fo��D[��r!ׂ��7�lP2q�S�|����7�V_
�9���������H��1ڿI>b�^ǈT<ѩ$�eFH��֥l�B�m#�̂���%D�(�� 9����f^��۸l,!YeVE��ʐ1a��W��X�z��>���3,Q��6�q�C��Y��%E�31�oAY���4��,�ou�mmM��F\ }�s�Ͽj�}���k=��n.,ͼ����-�\RkeQ,�ߗa��=s��ꅅ��d��D�+�G��'�����C�O<v>�P.�!y�;}��1S���퐏\|�ѻ������n-��e��"�n�r��� zӶ@�,<��Kw!���%���L� Z-?�g^ ��h�$�S|`	<�ٽ�z� Z������oN9ϭ 1� s�9�=C� R�s�9����1@`���$�z@@@@@I'��	&}"�OMj3n�\L���S8䯨5�5�*�1�-��"�)� �¢�����*�ȁ��m���pH���<��N������Eg��*F��ko�۰��\���i+�Ɋb7�l��&�F;�s��2)t����x����V{G/f�1���kע�E���H�n�6�m%0�
��>�ت��|K!�����٤�q7�зJ`����"�oA����V�n�2��H����_��{դ���#?#��51�(A� �
 �
 �>�}�!����%�+?��)#�<���1�r-��t�E1�{onI��ԙ��_~��P%�|%��j�oІn�����S"���P�$}Ӓ�W2��l��D��Ҹs�qGN8���>=^�M�J�q,�;�� d�ռ,i&������2���KN�ס���D���!�z����>V�̤�}��9�\��:(��pA(��؂;
��8+��e���������ݭ��Fw�q�?ϝtFT��ʭYC�V����1,JI�";O�F�&�����?d�P���/�d�8=�=�yYܓ������Kؚ�H�E`nfxe����知u9N�h�*6�3x��=����,WB� т�U���-F�=I��@�zI-mΟkS�?����UnK�Kb���Y��tDr��ͮ����O̜ׅ񯈿�x�4����E�M����}:i��_��%��/p��Prp��z�k�?'�^o�d��ԩW�c�#�����q��9��G���c����8�ƑD��=�Nj~���Y<|���w����׏�r��ፗ�^k]6�𗶑ٝ��d�9?��W�����$��<�R�&ϑ�ޏw����[��J���
���-Qu�-�,�Ƭ��������(�?��Zφ��֍���Z�KFm>@�cX�)�|Cӑ�ξ�b��g���Kzc�'��#�G���Q��>���e,D�}.F��w�~��q�pG���LWq�[]����\��F_Q��F�z�wĿ��2�ȷz�Fg�U�hX��S���T�]���W��wAB�+����������_��a����0Et�aPΫu�1�`��V~͐�V�ըӯV8�D�n�_1Ns���c�\�IzCp���z�!��=}M2��dz����l� 9���?:�U�l=|C���Q�<w1��)�r
n�%H��T��J�4lC���c�� �˚̱�ՄQ3�e$������R����g���P�v���/,���w``���W�d2e��ׯre�ض��X��L@㑸r������]�f��+�7���b���aq����4�dl`�{}����.P�C*1�zm=�x����#�B���[,���q�@y` �}h��+�l�ӓ@z��ϙSG$��{zf��	F�����Y#���
�[��8?���}Y���	c�ZG�[�xP�/�*��a��^IEl�̡%`9 �H�����@@@@@BQ0�{Yn�gTH�r38P�M��q�� ��ЍģKv�ISN�x3��r�����έr�9�9�Y�X�����h$��k��k_ķ���kM:��y�h��������b�T�,6�ZB%Y���w�K�#o���$�
�7sOq�B�)��#�M�B7�~U-���įu#�s$%q����۽v���sY�r�e����o���x��h�͇��H9���
N�X��ag�*ʊ���@Ežx�S�իVT�Ρ%pd ����+��jx'&��
 �
 �
������>�����Xco=�8#��z��ODt��r�o�z��Z��Z)Arb����&рG� kM�6��qv�+Ks$�«��M$�/n�cFҥ�l�� 8C$��8��fܝ�I���Zխ��*}=�_qS�<�Mv��9{��sK�j�N����;�(PD�!R��0y3�I*4�բ)�7��v���Z�j"��$�F,�q�'�L��8�DWrg2��k��׷h��g�H����?�uɥFP^�q�Gz�K��.ѻ�*�^T�����u�ض#qop�+�<;B��'�5�y8���vcW��]����=O���{L�T�O �n��7�)��-�N��X�e����H']�$�$d�ji=�M�f�w�k�-m�8#o�����$z����j�Ȣ���_I��7��_|IWX�s���^����ؖ)J�������/M���ZGE�:�IkxM݃��a�ǀ��_=�>u����/3���>��O�����5�/YxW�^�J�~���݅�7�)vK@Z97m2����|��<��|�jJ��O��#�������雍Bk�Q�[�[ ��:�������^���W��3��J�8����EѼ��P�>�u8��,���U��:��i�\�4.��:����"��eۭ��/P�qy���_�"�/촒��v�WH�J��/+�Z���������sm7��}�'���X���?�� �lS�q\h C���q�Z����|:Q���<G��"*�n��>(Y�Ǚ�����i��Y8z�]1���t���V�!�AIG⾏�>�0ߧD���F�TR��Aa�}*Q>��q�bH!Qn�cY�̍X�9��κ/ՙ�4�ZU�6��g�¨s%����Lz���z��o%u�O�IekQ�~\�J��d"c��I��c��&;��e�[j���ϐ�xw q��y�F�*�Ư����%�������M�cg�#����W�D5��G��9 ���~�B��t� �8
v8>���vN0~y�����)�yĤ*4$${��;�J�{!�=b�;}�[�$�.b>l-&8,�����Z�ޙZ�W�G��0��{���?{c�ʢ��@�k���Z�D�ef\4~\�zn�{�%~�lg ��0j���3����g�ʀQozֻ`G"g�r;q@b��K�>_�ϝ�=�1�9�[�M��eq<fgܻȺ�O�� �z� J�����W�,	 �UPv��	>�[֢{C$β0*�1��O�fX�@@@@@M	D�cF�IS&vL�W#ipֺ!�L��"����M��9��O�� B��O�k����I�A4$�C�ҭ���S�m����%)#���l'��g��P��Y�5=����� y�,AP�Y�{�����BW������4��7�r6����RM��[Іβ��3����ݯ�MW��$j�߮�>��L�f\[�`��@�Z�'��� ��8���S�����.dh�Tȕ�Ҥ1?��c=��֊�mj/'T���b�t��󂾆�d��!T��
 �
 �
���G�>���6$x<̓��?Zcz�3�/�Z[a2�Ҥ��Z�7z(�5�t)��d�՗
���R�&��ܵ��p��-�y��r�r�e��S��6�W��T�af���z��\QuVp� ��M{'_,0�3[����H9�^+��
įG.��� �N����������J�;#�S#n���v��߈���G�s+��6��s� �c�)�����Lj�[wsz��k5��Kg�s���S5ze�hի�k՚��2����##"F��O�_�A%���[ga}��itn��Si%��}3^?����G��}(�x��qu���_5�F1�d�?*��\��>29rc���^��mRG�|Mj��L�$zg� j�MWG:�c	��[��X�`��?���P�^�,��R�]�ah�HB�>.O���*_[&7�tF��ZO�}+���[��� �(ɉ}�خ%&�>��%�q��z��4,��3���.��|����|��x�k�%��Տ�ˋ�e��Ip��%���A�)=�c�>UO��*?��?����ߒ�}���z~ש4K�6��/4���r����9���<��cƟ�|'�T�fG��r,�n��	���VRTD_$?x-���?��C���K�%��u8���?ĸ!��5�y��|� ��[�;��y�j�mh��++��5.����y�lpۼ�y\����y�^,�f<6�Rv�S��Ziѭ���\iS����"��m.g��}�q�{ָ�g�L>d[o�e?�gȪL�Y�{��C�$r�}�9?���R]W�z�� �fE��a�J샡?��H�'�,�{<C�v���]m&C��D:��ygxx�.�5���P>Y8&��V����4�~ Ҁ�@��a.�z	C��d`��T�<v�,���4ޖ��	�����6�r���5�t�U�Fz��n�u	bE_��yl�U��T��,G"Q0eFbva�VC�=��� +��ec��Gw�m��o�{T�#%���c@r���&��D���,�n��P�����{����i��-�ߧ�)��qM��Y�e+ ���vW��q�ip��Io;meT�o*R̓�����*��K#p�%���������Ǡa���DQ�˞�����T��c������Py�pH�	�X�
�ʩ�6����5(
�XLE�4h[���0�'��jܨ	o���&�d� ��6;NO�=�)&u@@@@@@%n�-��|�e�\�x�6�2�?�o�����v�}���ƞ��#������k�*(��I�im��Y1�I�G2�\����!m���f�#���K-<{�,a��}�9��Oo��k˜a�tW�5(�$�?��Q*�V�۲�o=�ݞ����g����Z� �6ƽ7�����2	g��͈�0vA5h��X�c��,P��ς��d�%S�C�{�{�$���#��ک1�g+��� :���*@����w(�ڱ܌���~!\�?x��c ���� �
 �=��*&q����qR���������z���%�6��<�np>u0�vRr�,:�2Jz��#�#����U;�f�-"Ԭ�;��9�j�R�W-�ArgFhzLz.����jsܓ�^}��f핗�]A/O�W�cb4��F��\2���j��G�u�֡����b�!����׻�,ዩ	ck� 4�pJ�p��5� �7c���'�t��+��;��gүt���Z������+��i���}��e����Gl����&�q��V��+_ؿ�1��@K������V�T�ۏO�ު�+LD�
�/.�T�$��NW��+��q�Y��7�͝�Oh&��_��{�z�Y\RdN*N�W�EֺoXX�58�`h$�4���s�ν�2SZ]�|�L�-S�hY'�ef�]W8 s�x��ӭ����yt���t����/uyX$	����G�=�a5<��e'�#,~x��������O}5�2��J��+��T{U�4�Ȏ�챼*�z��C��W�~� enu�a��#o�YK��2߱��69tޣi�;z�������=v���U���#C����3�1�Gh T��M#����j}c��)��%�r���`|��)���Q�K����Π�� �
�1GVS�G�	�-�I^ng��{I����#�H�O�ֺS(7�E���H�E$�7\\/�&p���#��8�5��� ^��E}}
[]I�G�Y$^Ed�:4�# � c�㍧<�4:}����^hB���M��?3��d��*G��T��3I-��c$~[m��x�Ͼ�DjGYwŞ�q�Nk2E�����Q�|C�c��G�}J����ߎ�RIGOY�ϧK5��R#��ʝN2q��m�Q��^�%��o3&cX��*�3��� �R��%�ĭ���D|�W�r�Q�r=��ޘ]ܛ�RŰb�'�3��U,'5Pep>��P�� #@y�
*�� d�jӌ9>���@x�
 �
 �
 �
 �
 �
}�H���rB���k�0���N�xo�޷�n6���s���Q�6Ļ� / �pW�� ���V���z7�B�	�{���C*C~�	In�?by�� (�������趩�J��٩.��9Ϙ>^�JM֥�� �B��0�[x|�0��-�g�5mv�����Q$Q��F�5���[� (�Y�T����G,�#�"��#-l�v��Os��P��ɡ��Ҽ�Љ�7�yS+@M��Γm�?P��uI��W�͈�2AqϿ�Y5�R5ն���Z�d�A�XH_��Q�j��zD*�z�aR@P@b�[���b� ��I�\)�9aP�%v}b�ޛ��N�M�,�4U	ŐEtG%$�f��%��@�6�0��m�N(��!�ȴ�}RhbY��D��<�k�˙��G�Wܷfr�n8�:�ZE�B��OJ�,���e�W�߁�\��m٤�4|��t��C�ⷸ}��α�2�s��C��W�덶q�t���!�A ��)#�F1��\|`��kt�[�֡{5����_�U��F9�WL1�z]3�-7Su/�[=�r���n��{�Ѯ/e�l���r�E�ki�e:����m�����ֹ'7/���F���'g�����U� �G������'>���j:l_�uJY)�ԉ>`a]^<9-���?Q�,��0����:l�>G�7q��W�����JܛxѶ�}Use�D�ZYD�=x9�浔��3H&�Oz��zU5}2ME$��-��QiLp�>x����b�ײ�:�xs�8���p��-�k��L����5�<��cxWՂ7u�r+��?h�/*��.-�Z����#ᙰ�KkԆ�=E>��[XhڜPj�	"_�Ļ��� $f�܌��^Ǘ�O���Μ���a����IF7B�M��=V-KU�+=*��c�s*3��b��gں�忈x��q���>��o�?��R�}(����@��w�'����>	?��jV��u��E�WFkY������$�ٷpUO��QrrQ��~��}C���B	.tΐ�5=%��;{�h�O1Q�� �j�'�x���K"R^�Z��q����ĵEsк�q�hFX��?3�N�DB���o�>�>'�ޅ֠g?wݏ�	��=_5�CÑw������[k���b�F��;�+�5%h����ѓ���8=�>udAx�j� ��(v*��>>��g�*�(���w�D�36蕔�[���x<`�oZ�֛��R��ܨ�� {`�<�,���÷��S��j��T��g�rwh�C�Z&�$���'��1�;\�������淿̫�x�m1�H��<�ۅ��{���F�eu,L���
��]� ���fH����� Sp��J)�#{��^5�*�c BH��n�z��n���}y2۪of�r���*ÿ�k�v�:��X�-�M����~�ܱV�>���i�$���,��I�W��肠�/Σ^�b������47*T7�ps�G�՛T\E���8ǭ@2���`z�q�e���ҳC�*�1�X�)��N�X��H��1��K��S�,�Wj:�WV=��Y4�j����Q�tU
<��=;��@
 �
 �
 �
 �
#��X=	f��=<g�3,����"������~*���d�ծB@@��EK��bA���j�=��M�?x�Ha%�����2��C��;ՕǶ�1�w��"?v~�|�r}�������nD�,13d&�.� rIC�gҭ���CG,1��Y��yS) ���O4N>��@�{*�\B��w� C�!�P޸qQ'o��-b8��(��i-"ip�v�xJm��N����,6��M�e2�a4N�S�d��,k�Bu1F�����8V�a�=�g��F�4[MB����N\���m����8Z����H��l�<m�n��"�g� V0�5�8p�Eӱ��$(�(	���`�<S�R#b��BHp��g��Y�u�1��>��t�S��\F��q�{q�V���9b���ʸ��C��=9�k��[ߣ�*��s�ۜ��u�Ĥن&�������8�}�A�s`�H<�ׅ�zR;�.Ru�I.*�?��ٻZ9S9w�A��m�[��d��������W�rw}��u�����_^[M��X�Hf���߱�i�tp�Zk��Z�X����������ҹg����nʻ_�Eݫ�K,�W˅���aۚ�[�FN��W��D:�WFJ��tQ���8�ǭRO�vZ;t��ЭL6��"�8�a÷����<T��Z�Ko��N���Y�9�WO�>U�jJѼ�IX�jCZ*�� p�6~s]���H痻)��Ԣ�/5�E��+|8^0=���ۑ�Uƭ;�'�;��xE�U��IR-O�Y-�d��#I��������POc׽eg�4�˄[i$�n��NO�~c�C�?⸼\�q� ��o*���W���^q�i�N����kvLq��T���Ľ���+����#�bÖ2��ױ����#ˎ�_��i}S��3�j?����l-���i��R�r9-��}����^W�q�7���~����єq5}�I���sV[}^�;���`v��6xRg
	�s�ֿ_��o�p(bZ��2���w�Sx���N�Ҷ��qKa�I<�!&�RI��9U�^�_;kg3�"�N�ՓP�z��!�c����*��z/�i��� j>�����:����ol�q=��s3�=I��5�_�?e���\��K�w����P�%�N�c�N��3����C]DiZ~��^ %eE�@��s�_�|+?����g5s~���*pKȭ+�N��T�{���i�^�y-�T"�� �{����y�����e��z?�qa��|��K���㝱��!b�˩K�����狼�����7�!�ȣ��j�]�/�Bk�0U-��eq�#Ol�d
�M�e(�뺼�B�OV@%�>r��,�?j]i�\jw&��I�F�xh�`ǧ��	v[�sު[�����r(	�M�Si���s<P���,XW� �����:�US(ƾ��o��+)nB< ���ۑ�׃�����,��qr1w6�r �_�T��lJhR\yV�9C��SF�� � U�R"��1gRC������X�L`K�m[ۋ�RZ;�̐��C���뢞�C����!��`c��[Ό�~y�q��U6I�L�l�-�H�C�Kk&�Q�<��T�`#����fY�>N
�l0x���+6����e�ɒ0	�U*[>�Z��b��w$�o�ٖ]�>��"�@����j��ʭ���d;ׂG v?�ZG]�E��-�ۮ5%F��`���#���O��)Y�o�H���*��ܨ��,��)\����s��x�
 �
 �
 �7%�kg�͌`<�p�>��Tӫ��Gz$��T^�e3��IW�a�� z�N4Q�n{���Vi���\����g;��=~U����P�		ln)#�L�k��_x�#֗����\�41\[ k}�c-��R�|Q��4m���H"����;����ȞD�X���T��`ש��#�0߮ӕ��(��� 07�����n%���o8�����z�n�k��o��5�	����`�b2r��$`��4���i�Iwby\��l\E* ��i���=J���Y�<��O��� �05J�� 咇���.�RIh�S�)%O��j����E}st��C7
��Ѕ����p���r?M���r�@@>tL7uV��YV��H�1 )���*��}�ϫ|A�8tۻ]��X�Iky7��z��:�Î_�4��Y9-3�~���s�u��j��������J{���|��r�Wz��F8�Xֻe��7"�D�cX�F�W��P��ё58��)�5k�t�x�ݴcsz�q�s��j�*�'-�VϬYi���srv�_�yr=���Yq�6�b�_�i`���q�˘�6����qgJ:N��R�G��A�ZX,R�H��[�X���2f��i�p��r׼7�͍�T/o	 D��Ƿ�kxdN5ٌ�(����}:l�nh.lLf8�X�X����W���=�b�:kH��}b3<iq�ef<����H���;Z���^�KP.� @�zW2���;*��Qm��%7K<(�e�`3��W~8�3�!I}�z����=��Wu��������v��̡%٫Ɵ�:���n#&�Kv	2)FX׳�I矕t�
*�a����n:��WF��o5MF��eid��� �s۟z����㰖iV�����<���̲<:𯬺X�n�����(�X�@�x\Fq�����?���x�[M��w~��8G%v�ƾ���Ľo�%���b����\K<W����n3��w�������bX���<�'�͗/'�s���7sӷ"�W�]���o2�I��8B����yX�H5����|d@u�b�S���'
v}���I�����j� �������m4Hỵ̏��>���W��P�tT� �I��VMu�[�)bms�����)�=�+��|�)d�*K��<7�$������� �Kw����s<Ov�i�9%�ʨ���'���O��V��5蟹�!x~���9o�e�5��K+X-Y��+3�1��
���4���&���>�r�N֊��d�ž�y7&�)}{~Y�>"��y�r��<`4����:�]�,M7J�塚fF2��t����P�GںQe���r��.nb\�c�>�x=�z� ���u��#+�H H�`z��d7��!���$���HVB� �s�R��oE�G���U]u|�n�ɿm��)�0���ڨ�d%Ҭ ��KP����3fW��#�{����A�����t�v���v�q_j�p�׷5yi;+�[(��8�8�z���&��B��T��:{�>��O~��kt�E=F�uX%�Fg$Jo,��� �}���H�Ks�_���
���$�{sؑ��?�IBF��[²��*Z����劭5�"�׶6lDsEę�̀�e�?�[h�7���p$�SL��k�a>��ֳ�Iex#k��:���b<d���� ������~6��I]��� c����O��!�Bǭ���<� P P P�$K�xE`�$����*��x�=
���̰P P2������$Jѓu.�Ǻ2�5$7ֺqj&r�ؒ�����Ɩ�(#�џ��l䗧� ŵ�WūE,��/m�fV�#��N*��OӰh���t�wF$�&� *�y3 ��Nj%4�����Ru���73`e�/�0ߞ6����O��O]�Z��J�g��j�LD���O���zD��	�7��'Lݕٱi��=0�����&��O������Y�(-��2$��8q�[�6�^ʏrF�4��%�1�\��68ݵ��sZ2ȍl$I��,X}��oNxP$J�֘<]�k}��i�{Uu y�	3���?�Y��M�:"�֒�Z?��93>�%���e���s\�]27X�
 �
w�l^��=t�r��~R�~_Z��%U��Qҽ���la������l�.�V1�Q�+,�T1������ٚu�B���H��ڃ@�y��+�4��q1�٥���v��<��RQ��vL�qLK�>W���.b���ti���B��C��[���cǁ��*�ꚭѻ��K�,���om�$zb����Rf����(��������zbUl��}�mm舽�?�>�%�\�4q���;��s�=�"���D�za�]!$�棩_��[�����9��f��f}D�c�E��i��-�±�$�2=��uɎ\[�b�qkG����E��f��{}Mt�n�s���"��J��o.��Fmи(F	99�Wv�5s傫�ý';YjZ�ʴ��]���S�q�^��]���K�6�ԭ5̑�Ҭ��^����1�.���*��T�BH�|"��I�{���u.���gi���6�[��#j��־?�?���S�g:U���{�?�^+5�Z0}�z+]�c��[�'�\������aH �f��~���ܰ���sK�hƩ����w[���L�������0�rG֭� �1�8�T���[��o����o�m�o�i��Y@`���#DOq�9oOz�χx1�w��b��}G��^FW�]�+(^y`���ؤ��1���K���w/e4Q��4���Io"�89�� J�}��gRt'�=9�>�t���l�M�p����s��_���~#�������}� �Q�0��Ǌ�n�ޚ���U��C��mN�l�]2��A����$q��w�G�z80c����߿���>%s�ʹ�o|Y��-#Q��U�n�	���OM�K�;J� <��k����O+:��P}��t��|lx�p���>l�z�ο��j7����id���M~�������� q9��9>��>����̱�A3;�}�G+��<gԟJ�Tٓ#w���]��;*�p_(��a��Tտ����Q�j����L(�S��p��_α���f�v�{�Q��d�V��;��P&��)��xmJH�|.�/� L�z����c�E��d��sqoy r��i�J�?F���"G���7����by�!]A��0� ;T�Zb��uqsy��۹V��q��U�-�	���uEݵ�A�3��q�YvX���te����m�Vm�T�q�@��+�^���$YfI��cK�������z�E�iԬ��|=�Ɠ��k� Hq�a�}�uVأg�#�#��%�X�̄��~cޔ7�u��%�$S�$��oF?���8��:��wJ�D�J2�/�yT�;c����S���?W���$d rF�����]��r��?o
�����P1��ޭ����W��1�ߵfXSb-�]4�J�6������^��� P P P�z�[�[��JƊ�Qʇx�ŕ8�؟A[4�l���%����(T�I�I_=�ML�L����Hw !A`��1]�ӣ6�Sk�iG�yE����g��'~u<�mء��k;�(�d�*g@$����^Mf�_D��>�ss�$�H��>"��'�ͻ&��RLP
��㶽�I�U�>Km���Ӱ���|��a�T�P_.@H�Q�>����W���B���`Qn.�ݣ^���؈lcA��:� L�\�;�%��%��e���D@4��o@t�g��A僉��>L� ,�����E��xgƥ��q6��[�g$��=�X�i��ȁ�9�P�1@N|�bԺ�1.1o I�����s����Q�D��}��=�9�#��"�|{��7�M�Q:�~6�n���)c�̀ʿ�7~~���_Qmq7B#��� b�;>9a���v�#'z��!���������<�<�r�>~�W�����ѓ�#� �%ё��v��+�on�i�I��0�c6R%�,(�NI��BQ��'z"�E���8��[h��Nx�tF|^���m�"��[-��ϙ�>Y�q���f�]���f�Ԍ+��F��8�*J�t�rb����?h��t 䜁�4�6�qeg%�C��iae�ݥ��ͅ. a��_&��/$�G͞��R��5�MF��H��䑄r)n@ ���W�����&�%���m��i�䧟{���֪��%�K� /�H�LsZ��<�#�ǭj��*�"��|,�z�L��]�	,:�;��F�錍ˎI�n��K�?����]#u>�ikqy��-�݁v��pA�W��"�M�//�X�6rv�)�2H�Ï~٫ɿVXYan��
�P;rX	�+�a�*���H$>]������4k,�X9ۻ���n*���@Md��W%�U��้<� c���֭���E��� �o{�`l:�� 	��l�g������IV�'?i�������`G���.Y��m�0��\��	T���Gpg����W7���G_ʞ����P%ͼ]I��D-�P�8o���Ҟ��dj�רn΢��GrZB�x�&�x �F?�K�-����.�b7�~~�J�ze��xeX�H�#�s�_��y+�NѸ���$�-���x,e*Dm�!ʱ�A�?z�m$�7p��&C�Q3���͈����z�d?���d�R;��ل�N���۸�IeA�����e,ĳC�6N_��^�:!4�D�,�_��;�{�=�Q}��uwl�in0 ���������w�[_܊�/�]E;J���2	a��G�1���Ce܉��Db����<s�Jɻ$�jo$�λ�嘟:ٜ�o��O"(רj����[ZDRҧ�x���)82�˶�޸${����%���\i�
�$�����$s�;*��%m��:2�n����H��Ԝ(S��ʴ�$����I������:�&7��o|U8��l�ѯc�İ�}��[�sQLE��Ua�8��@5��,�}���0A��1@+����t��������J�7�_ղ��SDm��+!�m�i''�/��+YUSE�K���P	
oЃ$(@P P.�^�H�[ˑ@�L�$���O������$��]����{j�Xٰ1�'���k���Pϧj騽ӥ�D��&�!��2~/Z�2�wD�C��]���ou)�?w�	�=��B�N� �J:��,D��3:��� x��J���9�|��M�� �sP�
 �,�
����f��:�*�E�'������[����w\�U��G�����mdf�	��^Fhp����IS�/$wr����U��9W�C=�P�av��I@���^N-I-Q�%Ĉ��E'Uy��Y� ����xܧmQ��aG��Ki\��pN���<�L��7��4V��c,DCh��}�$�gK�y�D��>�UB���~U��J�gi��9R�F�c�s+ap{� �-�{5���2Y����G�9���erM(�i4[[���)�/��{ץ�Yh��%��ΰ�Q�\^��l�B�*3���q^Ҋ��<���a�k�.�p������"�>����:W�dWm���%����|8Qܡ��jt[l�4cy�i�*L�]�I��4�'��\ze��d�I/%ۗ��F3���ϊ��t��n21��2�����SGsl��z����Ǘ�B���c����3��l�IB��;��S��?B�t��yV�"��v�-�&����b��C�mŴq^9�"��	���s�c�Sm� Q��,q��Q�f[��~@�>�~u7I�JM��.�wWh�;�k�Y�GI��dyl_����ʜw=��7�0yM���:���0?�s�oL�/�3tΠV3.���0�P�Z����$��>L]��{�������3�ECT�4�"�v�K��m�w�I��e^p@�� J�6�h��ݩh�^}N�v��%���~/�������A�i"�Y��&B��.?/��ⲟ�ˡ�	$zp{�	0@�s�PI����Ɉnr΂DrG��pp8��k�E�Ӣ�DYm��:`�vޛ�����Ԫ�&��_��5&�_"EI7	 ������
!�3���� =k0zYDl>t%\w�qN���\�3m���9�=*[�x2;D����~�* <A�`�$�b21���y>�	�K%�<�����<��PT����8�y\�023�O�V�w�W�V����:���<�.� ����[mFѝ��ܷ-pӻ\0 ɞN;AX���2�MA/l�g�ѓ͍ghg�³`p�+i~��y�G�C1�f�FF�4J�r{�;>UV�#~#�<��"4Gz�]jY�>�"�$a�/���@�w��PJ��"Ԝ� T� ��ֲ\kq<h��#�#c��&���}��[M�/)��
�%�cF��dp~���Od�����@b��1�|�U%w�>��P6�mo"��9��(Vٹ9����ϣ��{'��_v�������K�l�T܌�qڪt@�_�g8�w����NrHS�Ǹ�k\��{S�L�1!��F $����YSkH3�U P��ss!��s�(��M*�ѝ3��ӷ�}��4��P�b1���F>���+� њܨ���v��K[����D��O?�͚���d��&�ױ`ݼ�ڿ���N��?J�uFoo]��[�?R�@{x�SJņ��θ�Rv�gJ���Hl4��3I,��(���+��C���c����h�xIfw 3c��s�ދcN�bw�f�m��Y>����j�+:f���F��}���r4ne Ï����*�2�ŏ=2#��ؕ? �Ϧk��Y�j��_�Z����<�Cs�{���Ӄ=�sNt��|A����H��m2��=��Ë���ɖJZ(;�F��P�Z!s���$�||����;� n�T�E#u��j��dG�g.Z{G�Y�Ad�s���Z��'�CuRO�ܧ�~�|�������5_m��%�W�A�c���3�x�q�ߕY?������ g_zw�:[k�R�ܓ���Y��&o���W�5�?���ȖLI��]�A�y^<1FVˣJ�@t3L�x�h�!d����1یg���|+�R�(���t~��+���}M��'����u�Q�l�[ȴ�&GnH�p���?��7$s�p֙X~��B�8��:J^��+�6�)�����ࣶpA둏���pe���Zv|�Ҍ�}�۫U�lF���������%�?ԩ���nm���|��1QZ�~�gp�A�_HkZ6��Cm�跱D�~bL�G3�2pJ�	�_�|O�/�П���۵�[���� �~d㏊����I��I������Ɋe��i
�<��G�~U�|7��͋Q���� _S���N�$���8���oZt���Qtޡk�zd�+@R�0}Z3���~��|s���BU%�g�g�s`tֿ��΍�:�e%J���+�_c���)*����j˰\qj�j�i���*�2�`���r�dWLmt��gO݅���i��d�I�y%e'��O��Uv�G�Z���ϫGz�ĥ|�����Wޫ$��Y�;N�0>,Z�z(Pa���G�������I%s��ܠ�Ƿ���:����z^+��)oe$^C�r�7�\}*�����$�&	+��g��܂��V�%1$h��2r���zsU �����$`�~b�%A�B�A��6+��D/�y�0��f^9Ua�G<��T��;�㏝�bh��8�n ۵���2�9;p>��o���߷��{�ܣes�n�������]\���ZC+�3�s�2=��o_ܫ��V]/к,��6�J�̥��uc@9�H���Gb�1��Jh:%�v��IV2���X���8�Rү�W�d.�N�e�f�c�(��^�c<���4�������X�΍�ɷn�=q�X��h֖���"2,A�����ހ�J�B�Ң[�O�� 2��Ӄ�!�o-Ŵ�X�^��?�Ҫ�4UA2�M=g�����V0';r��=i
�+!W۽��*2�C�\E1޻wz63��զ�E+���(H�]H�"���@8[�s({�&M��;�� �Z��	pLe��ł�x���PZBI8��^;|��IL�s���,G?���A�(� ��OրWb��#-�/*� 2I����բ��H�R�H�d�yl�L���$�^h����T %s�� @#߽�'�(��&״��;Z�0p3�B��Ϣ��0��s�^rm�-a������z�[����"��gf���O+��v��#���Q|vuM��w��.���v�*>,q����)��N�l�M����7E��9�
�6�E�i6Km�k���;;���oU�����5m:n��*�)��8?�q�a��-�Ǒ���v(4D�K
L��g�\矯o�\��ԹRȜ��&�4�������OE8�c�l��[ql7�L�徕%�y�A�'iϠ����2'*TU�!�j� �	u����>r����b�e�1�'���g:x��˭������,3��o�q����5��=��M��t-U�ܢ�l��^G>��Ӛ�U��(���m���e�Ϛ�8��B��3�Gl��w8�x.�"���5o"� �������^�Q
z}�6�L��9
�q�BW9<�s�ڑi��$�B� �c�d	?����1�֋J�_c;I�;2b�9��M�J�=���߷�	{������ΆᤒF2E"yEK&Ӝ���Z�?�u���O�����u�*���a�d�	�_�D�)����#�z�������|�����M/r�Ѵ���J+kEp�~�7'�W�m��;L�qo5���"�
����8?	��(� 2'��5]f��Q�Q�$��w�/����fQ�CN��k�Pr����}c�:���/�tm�{��\7 �ʾ_n>y�_�x_�|o��y#�Oj�_���|L���JZ^����1��[��Ѵ�h��;������8޲�,�&�6ܓ�F\x`�&|z֥�}gP�ݷ[�s+���\�y�_�ǥg�?��N��犷���w��m�c���X�����,	U �8�溮�fM��:dk:8�KtfdQ�\���G�sۜ��?���e���s�մV���֩� 8(H���>��Ri��	l����bU�a���8���cY?
�`�����	�88�e��60�A�K�c�{m�!��n_�v��>��v��:x�e5�NX$�T��CA<pq��d�x��R�8�!K�Ƅz����	�R�ë)��<g�T
����#����<�!2-�ÏO|����>T^BGr� qS@ʢ���%�@<��+�����o�$�u��������@����4]�ʇ�5;���ϺȾK����8� =k�-�G���v��=��e��^&�>l\� 	_J���#ڄ��9,m�����5�~�5�v��.�Km<O�ʪI�����i<�Cod��Tg�N>�(6�s�_�V�GS��n�*��������o���eI
�S��r`z���Ҧj)*+푪ȱj�<pZtzI,�M+�=�Xcw�v��t���y�U�����J5�����q�v����Rc�����3�q�<P>������؜��}�K���du2�/��g�]tQ�� 0F}Ŷ�yr����9�U K=��ȩ*�M��(����T0a`V
��.T��{��iP�8Ϸ��6�d���F�(�݃��(YvA��>���� �
 �2@�� �D�{^��4i^)U�/v��BWgد:�N�M��-/R��i,�0�`
�>~���H���f��R��(�6� �`涂\JJܘ\�$����^�gM�S���ܬ�z��߿U8S���� z����5N��!���k�qo���9@d���{�]���[#`j}So����-�j�9��Ҹ�ݦ��uMQ�zt\��,j -!^N����N9rJ�-%��F�����t����0S���ҳ�xɳ]>�� m�����k��0��u�'���$���Pm�"�&�:��R�c�=2��l?�Č�ʢ՘U��K��gwi�l�+�ͳv;���k�*9?����+{����M���O:R��.����>�v�5Rވ����[���uX��\��?׊�^��p�X�͝�6�	�nx�����i��	PզCsh���� ���s�pݝl����"�wٗ�.������t���j^yA=���@����k�>%�'��~N()/��|�G$�Z��.k��w�/�Ǩ��Z̓Frn܇=�+ێߕx9>?�����ގ��>?o"��ޯ�>���B:��LX���p��@�c�W��?��JoO�vz8����mM~Tq���MZ����@��mq(��5P�p��οb�g����1��[>/���\��+��f�K(ԕ\�md���5������M~�%�ncv�#C�Y��������k�ɚA[H��]��'Jiڴ��]:!ӓͺP�i�2H���~�~� �L��F�K�OУ���`� �+^��B����w� *��d��S�`i������_c���O���Ok�缯��m�zO��r�3������c�.g����*���Pr>����p���GO��V��	`���oԸc<w�{�.��i���%�� ��� A=�J�T���3}�x������h�m,��:& � �󃊫��%!��<B�z�;u�X��,wB0>�r��QےB�T�`���)�o�#��SZ�n���R_1>WH9`}A�ޔE�Z.��t�����&A���pyZ���6>�ψw�Cm�B�nZ�݆T?����-�B"�pK��**3o;��y�'o��B$�pU�m���J�p�?Z�@ͽ��eD��� � ���ԥa�Su���1K��G�|�b1�x5.4��D�j��;_p����P6A+�~z(_,Z6�-ؑ����8edx�܀��?O�K@���$)���f7�9"����w���>���/`��Տ�-�D�v�iq��kH�Z(�'[���y�Oj���)��ޣ9�ǽC�-��H�Y�cx�6�#L^�_,�W���/T�f��_�V�o#A~��T1N�}wv8�r�2��`����E�����p�x��	dey�v)9
p=�U��M���,I4j��
��;U�!�,���}&9����%�S�#����0���nƿYm�y�ʔI��c��q�~�O��(�V˧�l�N��tI� �-�n䑂���]0N��Ob�����P�c�۱� �Rk��,�T��p�6@��ƨ�ܰ
���P�Ѯ�-�F-Qϖ$<+#>\�Yt��I:�:G� �7�����	�|��B���@ 6�hKc����?#��4�<}0h cҀ�a�X*�~%ȧ`�sl��a�t�����jZh	� P P Pm]����;��Ns�>������{��J�!�%k���#�� �����W�=�ΞV��g)�%��9a����q��q㵷����#�η=��S���� �J�:M��|�5��Ļ�Ha�+c&<�\9?��F��W[-MŻ�ŖF���z�ni�����K�SN�_��I䔦�U9���r哖ңx}1d�������9\�,r�}��r�K��齔� ��e�N�5�C�\��ˑǠ�j��ܭ�lW(��Y�]ck�]:o5����F'�����%��>+Dk����Q����R���������z�D�K���a$�_�N�Z�I�Ͼy���� ���=�H�p��q�&�Wb,��ey7\�S�#c߁]��ʈϕݼ)����KV�?Oj�tGB�<ȡ/o�Er�`Ƿ�}��*�����e-��	#W�&1HX�~x=�V�R,���#��R��LҺ�R�4�����Ѫ���T��~6'.R���3�I�Sz�����	:�]	
"k��ʜ��u?#oK�h�ds���\�?���SP���Yfi�����c����������M+��0�� ���I7]�@�wm+[�Ԣ.�3yr�9���T����$k�S|�N�6O�~~����'�=�چ��v�z���ĩC�i<�*�����C0Ʊǉ��K#�7l����=� {ls�{��[L�G:u�sI�j�ę$M����H	�*x&�J�DE��WwS^��<�^i�b0I���>���D�R�m;�������$�a3+y�8+�=����N�&f��yꞵ��S�lt{MA�ې[Q�}��c8B2���%[� �$��9 (^I?*��r_��ws~����U'kC"���a�����=�V�^zT�@]���� �G�E���e���Z8��_��E�i�A\�5�y\�*y�W��g��*���$�,ְ,��K<��݊�rG��C\�IF���H���Y7_���絮<���_�Q-�$W�]��^�t�7u;�1e��˙A?/���[K��ؓE�{�B=���!&c�,;��R(>�V��Z}��� ����<ǂe����GZ�H������I-�V��[�`���@$T>�M�M���̝X�r����W���6xt���d�A� �"��8�	69��ݿ�<��*���s��*)�v��Q�Kw`�B��U�	��s��!�_�l�Kiv�8�#�ϡ����I�gs�Vm���$�id��aA'?��q�� [$RF���2T�.�f�}񃚸Ȇ ˻>_���9�5V��=�,��gҀ�t�U����P�Y,_�[�]@U���ѓzdP��}B��-���&[)�#�����:\S!Y.���G�@O�%kU$����}kU����k�0�7�5��&2ɵ�|�q�
�Uw��]�UV&�@l�F�h�X�+�hF�DJ���n�#)*���R������e�6����?�V�i�������q�T�=���1�k��&�V�2=�˫i���n[8<`�A��1�E��'$�`����U��62!%E����@x;˓���xl�b��$�.���?<��<��b289�<���
ǧ�M/�,\�[=�J��N�472����5��"�V��Q��Q*nH�������څ��^(م��L��Χ��ӢŽ��6��p�%|��Y�q�t_�r�S�4ٷNt�z�2���#�*�jym���G*����l����m-b(��y�9[�5ޣZ9�ݳ����/�,'p�t������
�<���S�N������F��U�$�ʠ�f��j-�%(��̚�V�u%����!�dO啐�����޺�WQO~��z�<�����,��ͲI?�����v�Rq�M'�
�����mƿ���w��oc*2N�-������l��#�z��)}^����dա�J����+�`�pX����������!�iҺ.��Zu��2��'2i�"�Ǧ=�9�C����sd�_J��~������x���R���\'��?J�Zo���O[u�����]�>G+yR���O�� �R���u9.n!)"ɹw�WHF��6���<�_J�il��"��-��	@����$y����c~�ZѾ^�������D��m*����|��O�Ψkc�� r��s$o�E8���7{[��K�s��F�DdIdِ���*�ޟ��Ii���^%���b���3�� #�F��܋�FlJ�H#�G3D�?�� �N�_�&Jz�)��X� @O�[*[<�i��"KWO��u�eU�����\W�;�*^��tޤ�-$E��.a���0}�Si�r�L��ӛI֯-&�ː��r@���\T��N�ꯩ$�C���p�ɱ����2y8�����U��m;\
����ʀ2y���q�5:h��_9���{F����c'��J>3�G�Z�m����۶(H��*�<�ˊzV����kY��^%�$c;�7��g�9�ڋ@���
{�.d��T.$��/+��<c>�E�����4K���pMe;!e�\4R�X�p{~TRM$� �&ɼ>��$�z�:��ɑ�vU9,�x��^呦��4��w;M�2�����9�	�~�Q��_�EG�tm:�k[Kqce* ��3w���w���Ae{��i��F���
�Q=��}�u=� ���ĩ%�l���3��g��r{v�߶j>�Iw<�{�	��Hp�.@�aUrh����_5mˮ�.#޿;0���+i�����I2��t���8���槉Q^�`�v^�0�X<�Vmѿ�;��>������V�f�����b�eۑ�|�Yt%�I��6�3����U1M���{gڀ�#�XԪ>�	e
1����el'�D ���A?P{T0i# ��N?ހ��������G���F�,� SR�/KuV�[�h�Gr��~1�;�[���Y�
/@���G�\F�r����M:�WeU\�@l���Wp��!�k�&w���|P�2	#� '&�	ɠ$0>�ߚC�h���|�IX_8;� Z�Il���w��3YZ���"DU��)\On��C�oE⫳{�A�c��ϞpH#�jm�v[K�W�cl#�X�+ ���o^*^̞�ઐb�(�(�A'Xh�ĀnS����U��Yv}Y���>�阵9o�m ���X�� �,t�Y�Bo܈�>5u��ms�$ze���#s��	'���1`Fs�of�#�ۋׄ�޶�|d���֟&�UJK�im�-�P��[���[n$ �b�ra�qѾ7��߇]=b����K��0����#��"�,�4����<:�穼�X�vp;����S9 �=�_+5A&��F�Xk���)V�K�Z#�� q��M&���{���V����l�{d�h�"@ ��$g5鬑Ϊ[k՜�+EG� ���CHդ��p��.�dp�0����T�Iq���K���D֞�H����]�Y$��HT`�{`�j�x��Ędq�����׺gQ�����S(�\ؖ�6A�<�9�8��㇄���r�eKa������;n��g�s���WTR�t�����U���-����|ׂ�
89�����ʈ��p���R��1
����I�*��4F��V�Ύ7��Y�O-̰�S��/ң��� 	�/z�W�Fҡ�u%��fX��Y�� r+�����Xe�+��px�<��D������Y��K~Wl�pa(�7�������>Tܰx���}$��
JS������B�ӺZ��dե��H4�Ca2F?���|ױ��Ԭ�B��bpO���G��8|�r��'��,�wi%��c�F� O��>��ӏ��x-lKk4��P�Y����ͼ�d$�rT�;�?*�T�~�ױ3�����-d��e�%T{�g+�3�{Ue�'�n�lqR�R��zo��>+���5Ɠ�7����~}��㿾���Rj?M���G�ἶ�D�@��*�\Xj%�ܛ UMA�$� ��8ϥS����a��fR�^��Ň���C�g��zKW��[��B�eBgG��?|������� �ycy���c��|xA�E#��^ZGi�3y,$���e���A���d~��>1o���ORG���FCo$2��P0��Z�j:�����;M`���|��NM��E)�:��HnL���K����J��Z"�KQ�%�ʷs۫���LY{|'�NMtJ��7��c�
���4֟�w8��� ���u�&���0M$��f;UZT�������uGd�$��E��G#��0� j��D���<�WR��9���C�u;��J��		�0Д��<��~{�T�i�F��q"�)q��љIc�#�s�N�^@��\g�)_�V?���3�i�
$���p���e���l�=�{��� w�%ȅ�&2��1s��3�Q`�n@c W����� |Y����YԭLj�?�Ύv=�P�g'��tix&�i.&Y��#�d�>���R�c�m�����a���K��;s�"�֦����ײ�o�@�p�� =���$ԓ�`�U[���UPyWe��W#i�E ;�b�Ic�&���e����!�9q�L���G"�Wlb���\]Z�FI���c���)���Il�UkK��C�͈!_a� ѥ����4��ү�$�k+k��XBܪ����Q�h�t��m���_���v�`%�i�b+�q���v��4�J���������[�=kѺ�N�}/�����7kh#�6=":�?O����䚂B���ю9`9�Ї�℅ P�O�� �%�%�uo4�`Y��+&0A��%Z�~��z��Nn,�h�U�X1R���Q�r�2�M����9�F;2�{�#�Zp���7�F��Z�U�t�+���m���I��ʖ�*Fj3�@b�(��xV
�Λ(�J!-)S��}�T2����+ƾ����:�-^'1R@���}G�x�%��W�f�L��Aۥ쮴����+cv�	��u+�OL��z-nnH��K?����8�3�.��n��O�.���GP��IX2�]��s���8El�o�{W�>!�ǈ�2���nLj���!�{׊�gr���ax��qK�t�F�ûȓ��$}qTΗ������7�}[d�Tn[�V�m%�Ͼ>uƠڪ�����R�b�K1G	�������zW��
<��ɖ|��(�Z��+��D�;%��w� �c�������D��|V�y5�qj�z\Dg�E�wc<n���k�2J6�d�m�ĚՕ��so��P�¥�i�d�f1�� c����JOh���)��Eޫ$W)�n2#[�����Z��&=O)H�I)��bZ8�bތA�"����,e�&h.�$�8�R#h� }nKv��:�W{.$����n��Y��A=��������j�&����힟��R\NUD� ��e�-�;�k�� �L�.xx�ݫG�|:+��������t}F�D��G��vW(�Z+r�#v�$���v�s�� �<x��W�u�<�#�˛�Y1�O��Z��WM���5��o$��7S��E@F�P	G�w�Gμo��(`�l⠯���Gw�3�E�N܊��C�������zK\�m�Bn�H�U;n���k��O��`�ݣ���y�}?Ԩ-��`/c!��>[��8#��}9m6<��7V)3��D��JW��J����ߡ�G��-F��M�2jܾ嶝7I�� a���\����M�~昱�,�1�������|!�R�����(VSp�1�'�(�c�>U�?�>-��ҏ���}'����a�Ƈ��ɑ�<c��Z�It��ӧ�ų
� ����_i�_�b�d~c������x>w��˨�$s�^����v��
>w!��_I�{n���V�ua�ho�E���q/8���ԧk��hńL� YN�9�� ����9-��A |�s@zk�?Vw$I�`}�.~T��,{���΀U9��*�^F7��s�R��=��.S��H��L�����>�SF�l�f�N�?:�����M�I4�`���n~�ǟ�U�J�:���xH�ɶ~����}(M3J�j1��R>Qƹ���R�4��ۤ2�2�$��@<�d�+H�) ���ņ8�SD�u!�f�Z�ZO��R6�;���9	�\��dޱ$�$wzP�C�2[n�) +(ިI���~�)Y-5��uE3,o�G��?���i�
 �
 �
 �
4 	� �<����
�:��B@ٷ A /��Г� P P��UAfc�$�jy���ԡ��%�픩"e+$�����Q�f��e��xk���*\O<�&���Gr~�{U9�J��A��I`.��v^�?�5�$��q�Lh�zxo2�iG��?q��e��M�.��=Rd����
��p=�Z)Z1�W�HP�=(P P�پ�޷�M��h|��2G��R�}tX]X���@3�,�3���]�G��̉Jxۭ�M�h$�[�|�Xc��Y��J���Ν�Iu���SLkP.e�w��FB+6����~F��7���E��M��[ �����p��#<j�kL�m܇��>��d�oRH�D��e_�׽S,�����.����n|N�-�7���"���� ��5Ś�H�V��W��.�dҬc�C2�..�j���<�ӊ�nES��q����*i�n٥c������wz�2��0ʸ4S�z���|���ȃ��'tij�ψ:Ƒw�Qjͨ��Z��\4�ݻ '�J�:��R)96��^�.t���y�JV���L8#�_z�\�{E.ʦ˨I꛻Ϻ�d1F�q�;w9\կܫ��5���+y���.m��+�ʟ���i��J�2���_0����;��%]q�}�^ýF�e�Z�k{Y�yr��m0�Fď� ��GI�;;3읥�� �� �	�/\���s呷��1_��sɖ���k�il��?�Iǲ��~�&C�-�7Z��	���|$�;I�6��ڿE���.JI[>}��'����N�:� �u-C�u>���f�����H$�q�ǥx_�|_ܲ�մw|;��Bu���̛P��N��mpl^�D��p� 	?��o�G� ��S����� �&���9����C;d� ��)�\g�<~u�m�j�2���7{P3��?5b�_\z����F<��;��O	4��z+���z��.׺e�Rx {{������!��|�����x�,|Xs�d�_	�\�SP�K[="�;RA���57�Q$d`O_z���O�|7��.-�߹�y~��I�kEi�}���;��V�U��3���HVT�p?+�#�K�7c�ɺ�ў{�fh�R�褼B�� b��r�u]Zl(�z���� *�y>J�<Ċ���Gڹ�
�
�
Pѷ�ld}*�d2�KJ�'1.HQܕ546�ZʱV�
���`��J&�d��(�GR�iM�v8>ޜ����E��D����={����Z+�Ĳ�pZ&���?ϟ�Ml�1i�i�0�N��N	d����)B�;�-�S;�w-��!���?*�D���iIdt���L�7��w��d�o$��e ar� cު�A��M�y��۰O��	0�ʪ�]�''�ބ�*tW;Xn�89�?*�$w7�
�����gq?� z{�*4�|?tռȚ@� (!;�DI��O^h�׫t��O��F���$zzյ[%��j�7���bTd�{>�������@b�(�(�(��99�@b�(p�Ώnn���hC��BOH��B2(  ����P���{^���B�̞n.A|����^1�_�?ٓN����~�o����>�<�+	e����5�;��"�.��mf�39��W+�<��RU�]k�n���Ԃl!S!;���]Yt��/�R�9v2G�dmXԖn�k������k�g���?/�U.�7��u1���%�b��:J����J�c�� ��ǌc>պ�����9��fx�X�>��r$`����(���������K�d��
�V��	����"D�ŏ�W/6�qt�h�`����������ZO�>�J@�
c �}��I=�S��D���!����)����m`X�weO9P���|zT��o���9h�n��;�����$�h�s _����ו�2T��kVJ:�UtDH�6�p1�ki*�a�Ew���t[��d�r	n09�.@��ɪ-�V4���Ȁ\�&�+,Ư' �|���{�e2�E�p�W�uK�;k����)߷b���}^ɕ�s��a����M�a��y��d󓑅a�sWPKU�HM�-�Z�� �KJ�9㺼_�5��n���=�j���Ы~�:t����`�d�D;�l�y�H�ޡ;]2�l�5k[x��B�MvK%��������P�.j���>��#cp";��&)���x�ǹ殭���o�HRE��`?�nӖ�2{�6��alR�X����_.)ZC��N�������_Ԟ�u7ً���ǥ�X:����ͺ��m�������#�����dz�]������0p�v_��l?��� ����;m������'�����^��gO�f��c%��¹e�Qy�N3�����n�q���!�"q�K!�b1Z��9��c⮭�ťZ}�K����U����ۘ� n�.k���� �v��m��yY����?Ȫ.�R?.R�,�+�� ����s�^�~�K�slh���'VH�����t��H�=�:�odۋ�t�M����Mӭ#��tk��/�m%�H�;��������9[���k���2�uC�m�Z)V8�KG��!eO9ѕr}~=3\����eNz'���U:�w�{s����}'�ؔ�w&'�eRT��n5u�+�BP��;�dK⹥	r}���s�����[L�� x��n9;�?ھ�K�2�C2lb��\����D�(YY���|A��>Uo@`�s� }~�E�T�K.J*c<�w�ވ���d��J����2I��� �:&�� f�f���1�={��@k�������s)��M���d�����G�}@�x�-"KpX2F�?>� �O�)��\�������� z���>!����l��SK9�]ʑ����9���eD^C�4���La�Uz�8�����F����o�k�6��� �E�#U��oB-k�t�%x4�[�Π��D�h$�w=��J����E�-ͥ�B�.�7�}q�*h�A�ȡ(�t�4�q46���E#��X�,=N)E���m5yc@�;��rG�ӎi�v)="Ժc�:��9-�8f��4)-T (�(�(�(�(�(��i��C�7�U�{U�b�pE	�_�5���#ӴM>mB��8Fq�R}M�#�|?��L�o�uT�|��Ȗ�G�'��r�<[��1Ė΄��,�]".��lHͷX�O��#)7�]���H�YX�mj��Ь	Xȏ�n;e��D����Y[��v�{���ky �$Uea�x�I+�k�H���&o9bVP6 >���EoԷ}��u��l�;� ^K{�E���9(�ӭn���T.$'+���`�d"�ٌ斑�]o�\�\]n�����O�v���N�0��9wTUMJ�'�PH��[)��j�젖���
 �,�t�u��db(�����z��:��e�ւ�n���Ҭj��$��w<z�s��Z���a�3��C(/�ds�����_e��[�j�Y�m��y�ۿֱ��Ѳ�5�ge�:��[��YW��ǽx�Ie��z� ����&����,0��Wf��;�B���p\���⧌7�Y�rq��C�n�� ��h�LǥI?�y1��mf��OJ�	������ =W���oBu��̖X�W�w2p�=�k�Y��nΜ�K�8A,R����۩�4�}`���^���� ����<�ӡ$��sR��?�̑Rdbar8
��*98J�]��d�Y�w�وZ[�]�K��N�gfߕra��&��#\��G3�V�Z�ɵ�-$�yj�1���Z0L�j�7H�*Gyp���f]�����V�e��>�s��^������.�8���7h���&g��v;gb'��A#�j���VжI��[��<ܙ��9 ��O���R���],�o2��̌�	� ��|��*�d�R���hxe	�FQǖ=w��m�2��Reh�i���X�}��b��%C�p<�<R#Ċ�V-�|Dw�~�Z�.:��&+���#��"�ܗ�fL�<eO��z�%��+�����$H�F@s��c����N�ػ_[Dc��YXy)˵�9������^��/K�7ͨ�2[���B܁$$c߷c�*�{��Y-��jK}� w�8�|�m��S���?�){�!��L^��=ݴ)s���B��,T��\�[l�]lo��X�>�,h��ˆ�����Aa3��b�c(�K��O?OztE�K_����&����;�ww�UGs�8��������sn�]ıI�G�RNR2>��S����a��cW�e''%{��Q�,��<Af�KkdӘ�׷(b���Fj�ʗ�kR���>�>�:�v�w�m+<R&��� S��>dZ٤�=Q'Ѽ9�N�э�P�3��~4i�.}���c�^��ƕ�O��>!�αm��6�� �F����;VYs�O[5��)m�t7K}��;���m���n%�9 v��\oȜ����������wv��r¬ФN�; �ֺ0��,�͉U��5�.�wG�ҥ����9S��`�v��קT�/kDO�T��� �&] [	��S,�� �Ƕq�*�G����Xf�mɈ ]�x*�NA�~ut�[]m~��Q�KN�mP��m����ޠ��b	�$���2
��h�3�@z�p��2���=��P@��#>�(�(��h�.�a��S�֥u��w�Ay5�&X����`G�����#���m#n���u�mai�K3�b!�8'�2�7$��k�_�����4�В��¾s̘�F�n�y�e9ˋz;�B$�X��W����u�Pšʘ�D��_9[h��>���ȭdW�!
��X��{֜[�ʧ�C�tͭ���,#m*G�$�ufI�4'�5�#O��)/�@���|�+��ʢV:ߊ:Di"i.�7�Bĩ�� 9�׊��E%�J�A��6�]I���X��v�P8�j�<1�RY%-�/�6��m�r�	��N9<�+��*�2���h^��K�R+�]�c.�*�9=��q����d��Eb�8"�X3�Qc�W��R�+�e��X䉀a��]AȆ����i<�� �� ��T���@J<3����m.;7�L�	��W�}Ǹ�-��^��5����3�k��,?�w%�s�����{�B8J?�[����Fv�Lz����h9cj Q���c������.Uٺ��Ԣڣ!"��V&D�>���.nE見���A��R\��U܌|~��OJ����٤b�����%�1 �)QM�.�؁�[�7zeՠ��F�XD�Qv</'<W�;�t�F� ~���omёT�wS��'$��v��g�qc�r��y�E���?5N��0\}����#�����!�|�N*^T۔tUA_vC��t[.��B�&�B�0��j��QqK��{)��m���������h�`�+��?�g�Mɢ�]�8�ī��:��M�L�,����%���zmӤqǢ��rd)��s�����?�>x�G�R��8^��sB�rd��X1-�R>��{s���"<,���=ձV�זVɸiG���8�Hߣ�dQ���7fx�h�d �b`�U��<q�j��d`����+�
�E��{bA��VI�Rm1K�$�KHX�#���10p㑟�Jmi��m6��t��t��o6��y�VJ��
���T��#gۆ�پ5>����]iY)�������d�˃�&6�3��;�,bkD�̐:��FF3�#�T�z`jա68�?����N�?*�B6�j�� J]������ ����FNr�����]~D��jӵkmN��K�}��|F�mB��<}j$�����Գ��}���p.��#n� s��/�us���J\}1��D��"�H����=�~ⱜekF�e,u�t�	�8��M%g�q=��;����U�ѢPQ��#�Q���l�nB�wB����\T���,�۪#�i�MZ�t^���8�[�6J�0We �H�9�B͚֙);C��-�i'S�9#��������zO�����v�O���:]/��[8Z5��L"��R>��8��Y�uQ#9��P��X�[��� �K��8�>�?*�>uF�KM[���w�?��N�~y?^h��*�峯>�Z��q��VH�դ�YH���^W�����Ȟ?ȹ���hGg�}p̓�$F;s\q�����j�K���Kf�HJo]�*}�b��9���^5x'���֐o�D}��9�?Aڽ�eN<��\��b��Aw�\Ϫ�2Y_7���@U=��}k�7�o��a|�Q�ތ�����.��!�l��]A�2g�WZi�G��Wd~��� �/�����F��ۙ3ۿ>�N�H^v�?4����^fa*8=�q�� *��fC�;�5Ĭ�
�0�*@� ֒3�����SU  �|��4�DV��f��̉� �{dw=�j= P�%WuW}�O,Fq�
��FP� ĝ��(�S��6��`eO�g�B�����)d�J�$�o_�O��JuФu��7��d�5��{w��_*bU�9��W>\����+����>+t��om�̓�*�2D��@��\2ݤ�3e�7Dάm�+`�e�;�{Q暗�ec�믵�Lt�%-��P�b�i�� ���r�1�i�R�_m_��](���m�,�ʜq�߸�]P�^�g+j��r����y�=���5�%g�!�`sZ�}QN:ؒ��N���[�jI&O���rN�����n����=wa�M%���yA����S���6���i&5�><iZt�'��!	#Ff�q���Mz�R�h�C���]w�k���,�݁\��ۚ䛶h�sx���"$�b�1���Z�������Q^Z/][i6V�J�-�ǐ��lj�wϧ�]	��*���g��]���s$J�#�}@�XKn��}LO��ll푐���LHF;�j�D�?5=?C��K��tX�Q�ː�g�����½H}#��1�խؖ�b�L1���ݲ~^��i�g>�I�n�u����6�aW޻r�rpj�4������!�m��Hv,݇�s_e��n�c�Q�+�&H�d#Ere����j�$}W�I0r�0�QN�w�)��i�b�8t�f����F����2�*a'��C�v��z~���\.��T�y��9X8�c5���Ks�,^3�]���RZ��,(C�ȿ	F	�~U�(��r�u��^�gHX��F[ܽ��*��3˖<x�g������Q�&˓���O��D�e�e��ݻ���g���z�O��+8��<�o�-ZKy\��"���c�#�]�J,�[J�9��gPG�,A^C��Lw���Wd��"�'�H��!�	*�^�ԙ"�<���h��CtK-m�Ɖ�,��qĖNU�?���g�Q��+m��j՜W���[�5�� a�z���H�e����f2FDI�XL� ���~�F��'_�$���ܴ*�N��$~Y�[$��S�C"4.a�h� {&D3�������e�k4�H�L 0���ʕ}yS�O��D�.",<²ϵdX�T�q��i���(�.]$�	�xLc�_DH�1 ���N�ܲ��S\=�����n�+�lXS������N��Gj���H��y-Y���֩'[K�H|.�[{���H�����n��	���������%��T�I��X_�+��� y/I����ڢr��D�f�:�I
*�G��w��S�j��4m#Qյ���mE��.�w%sؐGʲ��|q�����js�Ԣ��G���a�$���N�U�ކ�n��[c�P�У+�pH���K��v*�Y5	�}BY�;�8�cŃ�H<z����;�Eۈ����#��ʳA`U@ߟZ��PO%���v���)��c�:}ƏK!k�
I�ch�o��p��;!%GG��4�F����6G�<�4mǻ��W��B�g����o��:�I�mJ��O�6j�VET���΄���q�C���>�d�e�pH�O��nt�I2+�i��j�L��eG\����ԟ�b~�լ�S�uR�e�"yZW��������,�#���C�?X���o���Z�r��~�W��J����m���	JI�i�IC	`܀�~/�A��s�Z���!_:"�����)�� J�^�ꈞ�s��hUG��M���#��Q"ڨ
 �7Z�&t��:ß��� �����ت��*P���\2*A��8�w��@�1y8;���,m�����(��dq{o�O��߸��I'�hI#�n��zr����xb�pK�P����S��h������JyP�K`�F�?�\���Q�8��"��+��ݨu���(�t��H�n����!��GϿ5~	죓T��G�5�6�t�&��I+#�ʄz��|�֬�b��ꩧ����gi��$L�9���j��-ҡ�Z���}���Y|Ŏ����?F�?�j%kL� ���{J��+ �b���*��/�ks��rڡ�
g���__�ZՕj�B��-��g&C$�Iy����O[D�#*�vߝ��7|�$�(���
v&62g��%�R�N�+t&�bB'��I�yS�8��[�Q��dK��-�L���	�Ɂ�+���X�C&�40�K��C�eX��3�������� Y�{]�Vy�(1��EZ���;o��n�������8��E�O��G��VS�YN/��~�}S�hP$�ذ�F&���A��� J������&�̠�
7nf�#�=Ꜣ�I���z����8�1N���S$Sݑ�6E�V�Ѧ�{���yq��V#�|�W'I�k���2��/'��C�����ڹ��-Y���A�}	����f���Y����{�Pޛ!Ȯ�-5L�<yI6�6���=;����Ϋ
�d���̹S�w�{⺖L� ^�ڜt"�<A�����h�g5��<�.�E*`G�5/.��5��o:Ϫ���캻G�Y�Y���y`(P �������M˱V��Ntv���Ko<�Np�28���niz�������Oo�u�}ok�̲��8Y�SǮk�r���)������%�D���{ ���q�}}�=��jꈒD�m�$�N��1��S��_sZ���(�:��G��t�p�`�O��r�0�?��6�n�2�^���8��r�7.	x�dLs����Y�$�I��M>�+�^x3��,��{���#&��W��L��̞cV��Q�<q�z��z� P+v��I��
��yR���T�i��B[HZ8o]`Yd"(�r�G�=�V��_�4(���O-��F�|/��=�J~�� Ш��qv��m�0 ��\�;��.*>�}��S���1yҮ��}�;=y�K}�����E������*�L,��s�`p{��qY�U�e��g1�l�]k�-� �1#�����InL�=tGKï���Mw�=g�0���"� ���Yɵ����a�Ϡ���8����w��S�v�v����k�c*U�h��y<_���^��y�N�������\�'�գΟJ>�xy�b�n���Z����"��v �����9:=h�4��{�L�N�[������܀�cr��~*�4��ߏ����_ت>��y�^��������;����~B�����J�G$>��q��Oky��2�ps��D�H����O�ѺYb�1E;�4F�Y�#��y\���L|~V�/�-��&�d��V�3H�b��Ch������V�j��`�{�����DIj�(����w�j�tUv�>�8!]�=)�<� -}'�c^��A���2q�f���l`��ahѻH�����$���T��t'����i<�%��n�E�}޹����8Ӳ5�
WS=�cV�q�9�|��*6[B.'X��A���}qR����FAǨ�F �� �rT˄m�  �
J>_�ѳ�l�8 0��Pكq����� �ހ� P ���KQ�n$@�T� �	���b�om�%@�rGqȠ4P#��Y�I2H g��=�4�"2�co��g���(�iW֥S�0(�d�dG8�{U��>��D^ꚥŤ��m,p��U�)�m;p~�QTU���+�}Fɚ��%�G�׀3� �;Q�T��4s.ee�A�2� ��}2)p8t�6�"�`{����8�'��?<U�hY�=?̿k��I ��������թ�+�S�]�ߗip�v�K�~����;��N��B9t&��]Hm�R�ZE�8��ǡ��]�Zh�7��=��� �HؠMR������^��$w��~�k&=7!�Z���������;f")&�=�cy.��G�֣�Y$���ڟ}�̮B�ow�猜0!��e�'��˯�x��q�I���M�O��Okg$��&�.����3���b!��Ǒqp�5���q(N�Lw+����It)��ї�6�tJ�@�$��c�՛I�M�w����!��k�R��^�����Miq&��8*O�UIcz�J��Q>��N�K�F�&��Ӿ�ݻ��J�<�߃��n[lͶ�@�uΥ�:�\���X�E��4����L���4� � ��E6�ett����M��cW�m���T�co&PF���y�q�i�#��]����&�F��i����V����������n��+Xc�gqz2�S[CO��K�Wz��Qi:��6/8�X>�Z&+�(�+�r?�t�ȭ�fQr��6Ҽd��޵mV��k��!o3r�'h�c֩,/�L���ȼ=]y���$�S�X���Omq�'vPpq���Ҝi���F���zЦ�Ժ�\yS�ׂa#G0g��	��On+��J�h�*9�+!Ln ����F\º��x#��y�CO�֯�d��u����He���z�{�	�o���FHa��K��n�{M6T(f��&>�=�֩��Bj�E4+p��a�V��1��	�@��m�4}u�B{��G,2�l��e9�.�ʯ&�
$.�:����+=KȸI@�-��n�v��Z3m�!��u^�[��2>wn]����Ƕj���C)���&�{ۘV(|��+yГ�Ōdd�V6�'�A�Hڎ�c K�A�mu
x�|V�V�E��F��-�)���+�0͂��8��n�ܔD$�]^H3r��f�mՋ��f��s=쁮net����[o�C!�`*�bC�����T_�`���TCdOu�;��⯠L&ӭ?�]S[��<�t��d��9��qT�֒�,/�vgŁ$AіĬ˷[?��W��(��-NU�}0��C&$F�v�I/j𥧳Ӫz6_ʉĀ��6�+O��+mvAz��/���K�")�dnxa�qZb�.,�,yA�>L����h�O�CSf��E	�LJ����3�������؊]$q�ʑ?������j
����h::�����t->�Vis mR۷�<����L��z����'uxw��С�\F���w�s�+�x�tz���Qyn�� �'�u��2�["��sM�#���ںc]��d;�^�^�����a�<M��[ ���a�+%��~��	/��G���E����J۶J?�ν(MMvx�����)�b�N9�2&�=���ۇhe�]ʹ����=�Է�YvH%��x^	�pa�F\�}~/n� ڜ�{ �Uht�AbÄ�6om�o�Cє�ĺ,�g;\����H `���{���G��M�ܻ#�"��S�ơ��A'�A���6�T6pݍ���'���@� �� �3�1@b�(ZXݩ���0q��=�CӲG�'N����[H�H$ �L�S�'x�ր�m�jz�[V�u��$�˙Yx s��j�X[&�zN�q`��]����?&���
�>y��Q�]]vM�_n�״.��.E��WlJ6�ǿ劉F���PvƟ�WGyn�L2�Q̫,!��2y�����U�)IYW�N�ʬ�ʗ+��I���܍�~�~����9�Z���Z���졌R ��摍>��6��gV_ڋ���ް�Ȥ����R�b���F�Ȓ�  ��"J�?��L�(Ė����n���ȹ�K�'�q$?g�Vi?BP������;`�K	-&��!�1�U�b���m؍b��S�m#�m��[����z]�3ic��v�ZD�Lb�J��q��Q��Ǜ�u��H���������*�8���)�/Y�1jeK9� �D���Hn�ǥU�B�L}�\���c��@0�O~s��ErV�e{{�j��,��2?�>���~Y'���SX�,h�?�m��T������D�K�i%��o�"���N�o�]/�][&����En��9?��f��-�΢��[��FԯuO�d_���V��CgB}��	m�I�`0�&�i�
w�?�q\���͠�4\-x}'��s�ã[Z����J/pV��9�H�wg��Ѷ��aʝ�m�H�WS��S���mZ�f�E��.�ˆ�/����<�Q�Th���в4��H�#�5���D�kY"Ĥ�~B�yE�Q�j�\�m_W׼{�{L�z4����ndݴ`�>��Q�դ��R"E�7�7�gZu����E��y%d��3{�|�ɦ�U-"���c�~}(I��{�Do��<ǀG�|�V	zj�G��n���o-�?�!=��v�z�U�Le�e��T��Dh��ܦ�$`s���qU�i"���%�H��w�c��ϧ�g~�X��i$�K����+�e�s��g�K��)���xԭ�ӑ��จ�ܝ���I�5udw��}�0�f[HK5�y���2T���Uv��A/P�0r���"<-ŗ�2G�o��s�[�o:�I�DX�c�����_� �������{���1�\��2�m����yI��t"��L�	�}�Κ[t
�I�8e����X��0Z@A$ی�Gl������O���FL���L�����'�⮐6k�v�Z���m����O�C�ʡ�Ŵt��@�W�5E-�) -�@�#&��*|R=�T%3�-�Ht�f��y�%��ɯ*SoTv��bK�n$��7m �c��Dt�K��n�Ғ�LtL�#!Iȭ`�-��6���������#�5MB����ָf�w�+o9�py��~3�T��d���Tus ��=���*�LH%�lL�E�r=�Y�rj�;1j'^��<P�-����BV����Z�/�z���*/���:���%�ռ��a�j�-Y��>'�{� O>�dX� �f�~u1���L��Z-��{�ǻQ�{�v�6�J���\�g� [��Q��>8��##  1^�������)�>�U��C�q^��(��}>�9�Q�v��?*R��=1N@� �d]@Z,�fX��z�r����u���o�(�QF^}jw�b��ݥZ����/��Ċ�a@��xx�f�f�C"�3�0�$Ya1������S$�T$��̬UI
2���@z�h��� ���1 �ݐwۏ��@g@����F���P���
 �
F�X_�85q�ȡ�=��їV��.&V£�b|c$�ҷ�E&B\���=�y����h���=?�ZI4��[�oi�u0�w3Cmv�n���d�ۊ�$RI������O=3���j�$s�I�@�8
�'kvϮ=�i��}YG�eaq�2K,�n'��\��:H��(O<�ճ�mv�����Z�\�[���Bʳ��r����Ⳕu�&�:E�-"�̬�9&�(Fv.{g���'��rIY�}���#�
H�ї�qǥ_�o�c�&��Y`[���1����J�n�!�CҖs_4�0y{T�HbH��?J�}2ɍ�i�^#l�J��<�d��c�� �tV���&nn�#+,'·��n�R��� R�dǦ|2����؄λ��뚋Q��n/�I���tF�u$�B�e_5%H�~^��=��#Hh��� O���BR�8�}9�{Ԭq�Ħ��mI��@�q�7{��W�]��%;z"��F��Kn��&']˸��J�'������Εi��x�E1��'n8>¹����_�wDԬ^	b�;�`Z�4�O�q�U�}��_4� p��ylpq����+E.Fn)"q�����S.Ua�ܱ$���[E)�O@u�P���SK9m������8����J*J���\�����ynta{&f�	ϣn	�Vo���}=�D�� �W�w��gV
� 
���D��c�T�i�E�P����t�����.�M��_c�9�Gɇ�ޅ:/ڧV�,��&�͑���H>�/~�v����Nu�sԚ���x��o&i�'ݎj�ZD�C��@�� ���� (HP��
�R�R��K%e�Fv��sS@��e��I�[Y�g�8Zܔ��'9� Q�~���؃�_�y�(�X�ȝZP�0�֩�Z}�M?�c~�#L� [����#�S~�i�V�v*��M{t�om 1C7� d�'Ӂ�g9\�Q� �yH����������dD���%쮧$�u���r���g��=J'eu7Q]iY��ݴ�U7J#�\��^\`��Ω7�Bw֯m/�A
���'��~_ʪ���f�v��V��O�i���~#�>��ʋ��L�_��XZ��6�e�S�6s9�h�$�5���o-I�����������2��:��fc���4ѥ][��e������7��f'���o��RP�?��^�]H�go0B|������r�|<��.����z�����y1-$�*g9�����B>�R�+���_}���4hΙ�mq�T>]�����j���w�Vp������Md5�>[{�L���I ��zg��=8SQnG6����ש�T�m�up,S�Q����0޺�h�bI���Ԥ�9��Mha��@��b��~�*�f-R�;�Y,�"��o֔A���F�xhN��y\�pil��rٟ<$I���T��1�4j�hȒ�YV�V���1�wJ�蚱OTٶ��g�7E��ž"?*�EQ�.��mjSH�G&�!,������?:���Տ�O�z��a5ʘ��v�BVI#/����O�쟗/Q� �������Qm
���w>�ά��J��?OI�k|&Wy�h>��F���V��+�vQ�Km셃�-�q����z�4�յ�k(�W���˜p{��蔭���t���M=�B��`U�K3��q�F貍�uގ��a���[���Q;�����i�E���� �5%P �I�l�fd�����}	(IxxM�ާ�xws�Ge-ńwOv�rs���^�G���f�]7�'�����1�	������o%��A;$�y+�	H���I!G�C�U��BV��.%-/:���	Qf�U��r;�k7X��4IsqeK�7JC�~%��%�uy<��[`
}y���:�k���:b��֡�H�Ws���%q؃�����f�/��K�{x-�Yd*P�RB��s���� �v��Yt������[sņq�[.�tQ��5k�v�s��u��$��.e��>��TT\R�xuw���ơ}r-�����J����M9�̈Z���xtؠ{�cl��A�����j_ҷ��#J�@��E�+a&�"�*�o�G�q�$��6�h��#����QVHBJ����;T$� ��%����igGi�Ē�w�=ط����"���V�E��d��(��w1�r��Zw��7�v��b�[y
�2��Ì�������e��D�{��&1:K���rU�x���-�,��H!�87�ª�$��Q�q�z�~��e���`�I ������Ϸj��t]��	+!�����ld��*�e)+66���E�C%�P��f���)Vٷ��k�-���E�Mo���A����9��98�Iz��ռ2��%t�	�ҩ'�?#'%tc�(����Җ�]Ckv`�H���'���#o��K�Bo-�1}���2�p�l�� ��j��(��`;N��@�E$l�D�G��т��S�j�f��aoL78��<m�wdc8�� ��* ��1@�Bݱ�j!p�8�89��Ԡ*������X���� ��~u4��5�?�]@��"Lg�W�j���J�1���p�O�M�O����WIe���QZ�w:��V3���VC�C{�t��gDJH��n�->��]����$c�� ;�U8�h�z��aӭ-^U�%�Ŵ0`=��Ҵi�c�S��fᡰ�G�*�	�Y��1�s�kZ�{5ۻ�E���+֖�z<�Il���Fs��Vr��L%�\�;ף5�/:R�MZ�;mVh�Hq��x�U{**IH����i2�t��	c]��~ = &��oVJ�A�^���n�~�����f�ʩ������~�/�7���c_��W��ļ��[c;�-���#��*��׼��	��6�i�7����{��PD�M��ʧ���#ɘ��0@ߵ^)X�'&�J�%��v�J��^� �ڲv�͑x��4Թ�KNi"�+�뜂21\y�P=r�>�i��A�\ 
=?�xr�l铵^��F�n�ʜ�~�;��T]��A�����W��i�H�����Q�w�5��!cq}#�S&P�}$t��=R�]"ct$�%��7��dp}��s�ջ�6�?42y{v�#�I`l���s��*H{����<�\O��Q�m��v��5�7k0�/�7��T!�8هpq���V���	h���	d��8`%PCc��Pʞ/�~�{4�U7�v�p?Z�I:�m�_P����uw
���}@�P��L��{��=�z��ך��;#�H�sN)�f�o�cߋF�-��.���b�V2����QfNG]z���/����U�$�O��W�N�w�~�hS�4�bV�h�p��=}I���cG-i��,,��D(;��*�j�%�hSZ^�6��<����]�+�%�=y54�aM��\�w������W�>�z�����#Ė9'$���C@+ҕ_T�@C2d�l�Q�$�%�῏���}sӶ���f�k��g*�Hn=�S)�l����O��^}�������xX����Z���U*1���o����������e=�ǶZ�t8Zs�?j=F=?G�m"	_N��Vi�,��d~����Z�v��ŏ��ǉz�����إ����r'>�T�+�R��dwA���B����"�X�P�!e�=ERSmh�E��}�/�8~�N�ik�8X���y�d��▚W�CM�'�k�Unu--���9���U�T�qD�����hɧ}�B�ͳF�K$��'<`U\ӵ�/m�3}��/.n.�4���b�� ��݌⬲q�V�i�ȿ��0Yt奖$/�'���2��~�:��Hn���$�`��=85e�/B�M�ږ�C�� �Hn���W��U^F�[��R�N��M$�H�F�ؙ���}�i�z�������[N�8#;��q��,�WB��� �6�����p�0"]�[؏cVy/�8�s��.�u��NV,���RcԏOʋ"��Q�$���ԣ�1t֞�-��bT��~+7+,�0�~ַz�Gq��<�	���pI���'��ʟh�����ΔH�23�P8�9�j��R-~�Z�wS�>����N��g�q�x��tV��{�u]Q����9W���O�j�����3�$j��s�4��dC��"�n98���hQ:�Ԉca	������T�^�Ro������l�#�r����-���*ɿDC<Iku�Gh�F��ə��֥�������K8�0Vhd$+u���ʫU�&Ʃ`1��e$�
��ǩ�S�zk��X��~�~ �3��@ў1���$�
 �
 �28����W��_�#�=H=��S�&�e��Qn.�[2�LR� 9�֚� �m���T}9$�[}�<7	�D��0��{�e^�-�E��n���5�puJ~΁��.�~��=�?O�X䛊��n�"	�h+uquoi
*��F��*~�����fiZt)��#�E��;G.]�\ �#���7w�D��U�g�&�av��� �H� ��R��E��K��GV���u�m)�[|oĘ�u=���(�>͜%�]�q�x{�c���)���J0د/��]�Ӌ|���k4)�I��F8����9O�~]W��'�O�F@bJ�9=��ƛ�Eg������ږ�w�^Ig}o%��Gk�*�"���5Zdˣ�Eзy(���ͻv � .>�[4WC큂��..d�K�����m!~�vnn<��,1�1�w.�~=ϥN�����0L^YJˌJ�x �O'kG��?��_j�\��׿���(t9 �p	�U�TQm�ǌ�����޽|α��}��c��1E��o�G���bn�ff2�#<�1_@��:8T0�|�S`�K�,%��o�*[)^���n�����m�<UT�4�2Mv�ʛG���s�z}j��:"zո��
���$q,� ެ�ۊ��2��k��\D+ª�p�׎=*Z��9��T�q��C�s��g��/���Mc�n4�=?h�|۫E�.}w�O�f��Zz��o"�:�Xj����V����!_���3n�����|�Ўiǉ��f}+_�DA �k�`�8�<g����g���+��RA��<`��ޭ&gԓF΍3���� ��;� O����V��5%cn�)�����o�\r&]��oKei���^����kM��� I�-ߒc>aN?�Քr)z��)ò P�8=��jeg� �zqN��BDf�0�7
���hX( y�@b�(��2��2��|@��4 ���΀�@G��%q�{�'4 h�6�X�>��>a�l�� ���v�����@ �9�Ƞ6�crى��q� s���=Ci$����	�1')X���N�D��#�VO���ⵊ*e-�N�2H<�y�B���m��>�L�6��w{u0.
l�d[��
�@���6@[��t0��]�Z>�Lgq��;�A�&��cx���[? 0�I�8��խ�S��+�[�"́�*�nޢ���X�:s�5��
�Uud����� ��Uuto�9�ݳ�N�>7�X0ǧ5/G:4�@@o����_..�$��VJ�!��i��RDM@��Tvhe_��;q�8��e[��仔��HIU��uA�@���So���;t۶�$��nr�����'<;��ҹ�v�KƏ��_Z�kI,D��# YI����T��Ѽ�i����'{�S�If��m�yb�&9R�N;v#��]qnH��Zh=��|��o0JA@�FH?����$�M���T^�xy��u�3ߓ{q(���a������,z�����+�m���i�`�u�){��0\�ˋ����� R�6����;7QD�B��#��Ȭ����n�,��k"c(˂b1Z�^�{9wǿ�%���&��-B0U&�0��׷�z�|�Fq��T�G�~j�_�e����eh���r3�Ú� �Wg���}+,	Q�]2Z8�1�9 �֊�F�N���������`�u�Jͦ��"�v]>ji�Mo"�b%RHNr3޹���:=���D�[�2	���=�+���m5Rv*��@r[�{U�?C4�s�C�WO��ګ��`����5�x��Yϙ.T|��X���b�Y�6{�=���9m	E�@�\yx�!Rq����=vN�o��\ݏ6�G�E.s��®�tQm�Aԓ��ci�����X�88�}�j 쉽��[��q��;>����B�G�]?E�����-n��H�l�)B����֡��O-��|�U�m�%屖8�O1KC��������ѧ�t����=�GZ��1,z�Ix�>O#���W�>[='�<6s�Gޝ��M$L�$֓H������v4��8!jM!H�Z7Y[y�ӥ�W8Y6| ���Ƕ}}*��˒T<��Bk��U��I�k1q#� �e�=��Oj�d�T��1K��ex]��������-rY���6�b<��>�e<�ZGN\l�.�瘺�
�dB
/!A����hݿC��g�K"��P�Ӗ��m�`��ַ�4�NЭ�IWA��>3-���Ҩ�q�(��ˡ= T~D���z�j��n���q�22}+g�ki�.��>�uxZXm������j�᜕��d�K��N��OP��-�_��B�1�gx�f�Z,��ʹ����U�����>�kh��d
S����j���y�,pÖ? �ݮ˚�@P P ��\e� {���pT�=� '͡X�0;I |�@xp�{b����`�@��FOZtV�;��h�ae����'�$�e�$�,Bv�Ò�=}�h������5�E|��b�g���Z��<�T���9il�t ��ϧҪ��F��F�).�#�ǝ�Y,O	�� ��J]�,zb�D��;�K�Q�������YC�6gH%�\o��)37p����Tǂ��l������Cq<���g
Z69���ϑܷ�H�%������c�����{���$���;_Ӊ_����C�Nј�e�_/��ǥj�8P����
 d�Y���I���>��b}�R��1J�q�<|�d�X�4�
�N��7M	�3@!�O�	�$0�֩<���k.{D�N�0��ym5居��˙W�鑟�Ux�[5��H�zw�l�+C�Ӵ��̐<�2�����I9M�h�`��;�F'��� 	���Nɒ+��f�GY�iq-��<`�3�~c5�>�L�$*�)��.������Ұ�D�vF;g۞Ն\��gV,m���#��-���,��-���e���I��-[H#��.=W��\�M�z$v�Ja�o��Մ��[�Hb8Ԥ����Ex�M+�c��Eq��.J���,����*c�h[{e���k�=���LX �����CiG�a<*}����RZMWA�[gS�<q9n=2{�ֽ<~K}�������]�]o���$��{�� �u�tq��t�_��Y��eTo��d�ڹ�-:;|wR>��{~u.�Ӥ���ϰ�|��ݝٿ�tLq��3�QH�S���6��i�� �'����s�W��+_�pM�6r����m��G��d�^��e�z,�����k�+gd���Ls1�r>_��g�1f� ���x��}�/,m�%����'�<1dDH�O�ަD2:Dd���童����m���$���~_J�z8��ի�G�|�{>���	V��^sEd:dw\�)�2�_;Z=���~_�R��!����#��95 �@[�	i:v���K�<�,۷+�p�n}9���QӉ'o�cu���宁$�Y\4!��d���P�� #Yp�$u���d�|0�v�i��N��9�o�پgް���I(�KC�:.�m�)l�;f9e_@~]�r��ƺl�C3��4m�ذ���j���/]�I������]��-�d"����w� Z�m���'b{����ag}��ّd$6H�*�~㊮ʣ�S����W���%A$
0O�GϷ��+�V�\�|4�n���1@*ҋ�N��m�yɵ��G4"]	hH�I��ֵ+kP�ss"���fc�3�4�d�n�y�e^����j���K{P&�X�f��~Uۏ_Ԥ��<�_FzY�:�X�WM��Zۼ�,�HS��O��9ʖ�4��dj?�t�n�Xcy�y��
0c��9�����>����eayh]U��d�w�	�����(쳎�Y����:5��M|׺d��n��� �?�Wv�%/B}�i�/�I��kht�A�0!ۼn<�Tzs޺j#mnV��W�=OF��[��y�|I���sK�kcEf �P�
$�ʩc�ɠ��@'��@����@{XY���7(�4�m�y�_0�$��`w�<g�*�`�ŴѾѻk��I����}�7�a"��K��<�.S*�d�q�2*�7���;4�]O?ܭv�0�D�8Q���+x��կ�Q�-,zgOҠy�w(�?qbC1�>� *ұ�ݕ�M��o���I���>G�*����T���b�O�4ǩ]�BR}V>8�1<(=�2J�rj�
 ��Ԍ%,�e(:�1��+�*���� 0,]'�>'��`� ��V[h����n*/n���6�Z�Lɳ�T
�,_$d� >�Ñ�z4��u��B�N���ԕ[|o¹q�Ye#�?�H�k�v
傝�x�������&�@�[w���Լ��UT�I�跠X~��_]���+$�`ۆ�~g5�;6�l�uֈ�-�W�#�G���D�S���� ��Ԡ��1�jT_^��K�g
�J�����^~y����K/Rص�x!c��{?:�rIh�-�b=f���i��}i��i4�f�����~%$ȫ*_IGMv5_h/sp����7.;g�*餭����yt��~�k
"��3�+��;l�ih�AmJ��c9�R��d�Ol�_uM���&�(7p7�֋�M"ܣ��a�$�+*������Qk�3H���cټ��0��Q�!U�Sj1A��d^2KU"��%�Ǳ�uk]FFKy�w\�
��.*�e�R]ř�����Aݜ�f��G�o֬"����v]ݿ�k��I��_i>��N�x��:�0W�6q��}�m���MLc�t�N�c�vE#�=�L�������� �f���]ǘ�B3����f��S*ME��>#m��ێj"b��g�ϴ�P~��'V�1B�Z�����WW�*ݕ�H�,�奼�G3�f (Q�s�:�ɥf�RrI�A4��.��k;/ږ��F
���f�<��ގǖ�ް�G�.�gq��#�(�poLsZ�����.x�H�����=i�_QjZT�ɥ�
&F�����RI�F�&��x�C�yf �C!�|7�{���9�@��r��	��[�����!�3�b���ү%]B���9�;6����������������tV��Y����R��̥���� M����\����ȣEt�_M���;�Z����n�1���V��OD�����Bi^�؁$_��� =�9c��в���!�� �� W����:/d,z|�#]����J��u-2�麃%���_�bF5O�{E�>,w��%鎜���m?Ι�)�������Ty�Qv���l�>�]7}�}-jfDKmZM��It�w`��ՂJk�8����'0Wa� �H��ޫeq�L���!�{z��7!*�CS��#_��m5���VK��i��dq�6��Ub�]��kc�Ht毭%��ݥ�FVB��� ���*x��\1�Zl�˃M��<�uu	[�ł3���p=k��|}�))"��+�o�3��4��.�I@�#���W.h8J�	��+"'�ʰ4$}	�_���{x&&u���m��8��O���Y+�y�mo=�F�_�k��Oc��5޶f�E��q����PKZH6�=T���\���n�Ɖ֊���`A}+�֋�
 �3�(P
�%X�?��g���o;zlRN>����[��R�@���I�Քe���@�'�O���`�Lx9��g���[��쭳{Iggm�օ���H.��O 0�gޯ���=��7�k��;e-�2��x�y�T��t��h72K:�\^4�P�7��7B�ʬ�����"�1���}�@Y^�·ӹ�x��Z�����v�O����.
�]���~/��s�����U�m��]Jᣃ�t��d��<�8)� ���No�Q*?rq�� g�:�i�.<�ݤI.����⢦�)Q4��:'�wҺ��wZ�XԤ`�Z�JD�{���#4\a�9w���мv�t�.����(��ߏ-r0�>�޹r?����$N�r�~����F>�l[�f1�w����V�I��;��癮UDbJ�v��d�֬�5T �
U��O�E�)�����(<�4�y�?�v�8�'ڬ��]�Ih]!��jP�ږ��k{����A8C��\����������+�-��\�M���Hޙ� �=;WN*��������k+@���P�>�ʸr�M���Q�X	�?Č�B��<W;I���3k��=� ������9� ?�m^�%!GO]�h�<���G��/��Yʯ�4�[$�3f56{�C�S��Q9zE%�Z�F���#�0Lr+�x����4��Zx�k��CVm"��6U��Y�$Wg���^���fm�4sg��e��z�h��}n�`�k�����઩���G?��e؂�z��}F_om���\X�<#��x�ڬ���>yp��/��;�u�oms���}Yq�g�-Y���n^={��c/Ң�.L��S�׃�2���+�u��y� d��E��ᑎ��ִOi�_�Yc�.��ᇎ�ꩭ�y�żd �b���
�Q�9{VY,�vu߄�h�;�KT�����vz��
�߃�xټg������vY�_�+	
1 c�Oʹ����E��?k%������J6p��E{^5����?�eY�S/�(��7nL� _�tM}:-����f^�/��Y�l��ʼ��JZ=95<e�Ԛ��ѯ.|� �&|����7-y3�Uj� �5�ٛ��������ڽ��� ST��v��
�w0�A��|�i5Fo�]��ԷF�U$�=cl�S���nvC��P�[8Yv��H��޷��F3n�G]��j���;,�8	?�s�ݏ'�^QG<;g���`�����"n�c�]��?�O]�+"Z����#T}ʀ�+��8�>��V3�h@�+4�5)q�k���`P;r{��*�HY|xca����+ۛ��[+ko�Dr0��s��a\�:0�2ۻ��ִx�u����̐�aY���o�6ׯ�=ǹk��r���v�Jゟ�i��ɶ��K�����l*d�klPc��.�Y�E[e��Sz:g�u:kS]TК����m$���H��pgjr����z�X��ZҺcF�{MI����lܢHo`{Ua1y%��y��z;�"�|�k��<��q���9=�s��k�v^rQG/}��i�������kM04�.�����k��ԯg��7��5�(����4����w�e�0ÑB%�D$�y%|D�}=�@N���(��$s�~8��F�H��نٜ�rtB�:��2y2h�o��,ǩ�k��[��I��t_k׉m�����J#��*'��T�z^��ůS��>�[������3 p7,��?�ZIeT�\:9R�\_J�#���v����^K{:z�m`s۞���|B��ZG-ٞ+s��0[�a��ֿ6M$�DR.���k]g����� �x�����v�NQ�L$W�}�U��,mB��BK!����Ye����+C޸�LP��@k0� !Ƞ6��&<�_��X��>F��%��6ݡԕ#��D��$���#:��'�%7m��t��>I��g�F/-=e�s��,N0�|�津i6T𺆓m�yn�eM��l@H����Z��=X��_�t�x�E'ϳ]��1���~o%B��u��W��%�á	ol�d�8��9����O�w_���uuf��T�5u���0s��7�#WE� ���ä�7/��j��+jl!���i�GiY-�_}+�t�h�;k1>�
�$��z>R�*��ޠ�����Ӵ�Y?�d��⮣�e�3��^���w�啦`w5i-4J~���-�?ji"���7����n9 ��-`�";�μ/z������*�/��~��+�5��?�R�s�y�{~Uffx�@�T\d3�#�$P��;�+��:WBӭ�P���|�s��<w&�B^��x��&�6�F�Q�gG��|�x��M+I4c�[�K�	�����G�Yy�q�Yd]�H4�����'��R����uɤ�2�P5�4�1-�>gҴM&��U���NI<�$P25b�S�9����h�/�\}"�U��Ǖ�`8�Y?s[&q�,v{N2��{ދ��Gt���uI}�5�P8Q�~���%TT.E�}d�Yƫ�&�PM��e'��Ҵ�W��e��=��suWS/��k�p�G>u5dg��ѽ�� u%�Eޮ���!i�������=H�ɔ�V[��QӖ��ea��\x���n��R�B��߸���Dg}�w[xYmo�1u]��=� 	s��2����d��őF3�K2�s��;��xS��>7#yOtr�ژ�=݁�nI�b�oU�^U��O�X�h���~U�^�Aӣ�>�:��k�n�X� �޼���=,n��zx��6�Ꮅ:��hLI��`V8������):o�6�g��m�r�׏��Q*�M�Jn,e��=#N�o&"�c���=�O�W�O�f�J���`��X� ��t��� *�q��d�?By��om/+<@��M�y��ֵ2�2�3�\;2���]r�&�A���nY��'��$����@
�+�K[eH�ܰ�{�������+EIh�,_fi]J�7Љ�{����R�^G���2��GN	(ɲ��]*�U���)_G�d���2���/�.���ܭ��!7��H�O�{FJ������E9�߹k����G���5!2�oQY�5L��*ga蚮�֚E�����Y �^+����֟g.x�սW���$��%�Ay���9�X����1��3ɜ�|�Jnz���������~ļh�Aj7��0���"�a�ze��Y:%~9t~���gn��I���P�<�}�(JRȔ��Q�:��x��T�LP4x֯e1E�tR��,9�Yt#�c�hҺ�.�s�G�=�P;S���}cI�i�X��J4q�)�^�>�+0����'�Gyyq<X�>�T
�8�Ҍ��I�~Y�ֺU��2[̇rJs���n{����T��6���hZ=E�ڌ葬Gi����!ݜ�nq��z�N�!�4�]@��6����}�����I�.���I�*�<R2:�u$�#��bǊH�'�&��D�����,����Z��]^�J6tM娿�-+�@��?=��w��h���9�zht��\�$Λ�k)�J�ָrAE���.��ܛ7|��~.��K�����V�6��J���+�Vh�i{� ��[i-qle���~�G��{ո�ˮ�o*�4�Q�AG[���:]�?��Y%�{o#�$��J�Z����b'r���*[hU$Ǵ1s�1�g�b�t(������Z\���	/úT;Ury���^8� t���c�%n���g|��{`hǫ��]1�Kdr��^�i��<i�m���������f�N����b�DW+���ܯ�����C}�M�3,��j��$��sSn��%�I.T�J������EH�R�e".�,l�2��=���F�cn���v�˵�J��Wm2u�p���-'�I{uy�Goyn��ʀ>:�ue�:��Ѷ�S�O���QIź�t`������e�gS�w/s�5TT�p�.��O��8��W}��"�@�>Ib��x3+��FNs�BV�쾛�ola-�M!#h'�ⱪg���<u6�&�Ӓ ��hJΣ�|�#/��2�J��J5������a�J)��j��V�L��o�V���v���#�8�`�84�RMԅ7�r��*�J#>ב����� ֫�M#v�Hh���ү䱊)b�p��&=� ��VqmQ���YZ�rV�K���G#cg��eD^�d��V�7����[M�� !����>D�O��������I;I�� l�
���Z~��矑:���]m��f9�8 )�늕��~�>���3������4�E.���!��Ye9�Mu��4��s�f�5}���鞪�MK���!��k������Wʏ-�x�$�ّIĊ��<zW�h��J��HD%�����0H��$�j� q���V�����r"�)[�^��h+{�F�������LW~Z<��Օƅ#Gpy?�n���u���q����L�:`YW�	���ɕZ;�� ��]�k=tZxm�quq�㜀3Y�[��o�>zu�SA��J�vX��ym����<~��G}��'����-��nLo2�b���Q� �w8�>X�{���n�7��\I"c�K��8�����D����:���e��ю޽�	��HEf�3���W��|��d�'���i8�@zY]C �a��ڀ�|�H��H�@D�ĉp��`~UL��l?��F���A��kz��H�����Q���K$�Z!׏os����"�G�>#�H�����{1m4�Io�Z���&H�7�L� �i(�lz���Җ�Chp^oш����W>��';��NN-�׌�������"-�l��6��A�~x8�Ww���6y�ieI&���0�ak4JC�$�2/n~u�y����&s��;N��K+;˨��Q[�1h�����w���y�M%H�z�8P��]ӆ������CօeЂ����{8�X^���6L���8�ퟝ^�d3�<�s��X��Y��<�
1{��8��ۓ-�4f���-����0�K�O�˷���j��KEI���WoL4VW^I�.��1��>���ьg�:#m�t��^��4�SW��yu-h�,Iy.�fۜdw�Ԕq��d�@��zGA��+��fWrr0p0��ګx��J���#�M�Y��^w�T~�G��O|���LI/R�VW��X���h`dr�h�莨��>����qk��Xm`ûdv�5%f3ӡ_h�:��5��"�L����v���q�^�9���m.�Kk�,m�;��~����ʙ�zMJKYĶ�Z8I��7�4�����͆�1.q��Ql�H�<�r>U �B@��=?�z�Vݥ�����ˀ�.q� �g��Jn�:W�_���h������O��+�U#����]�����E���qZ�����h�dq. � Z���ߩ2��ʷ��>f{1�����h&J��r�#8S�?9��;��aG|�o�Ī�-�8��~�٪~�&Z�[���nB]<�3��2�9'8?����l�$�P�v�#b)�x��h�Z��:N�gˍ]T��9��H�@ϕ�7꭯x��Wor�A�e?*��c�Ռ�r�x~��D�L�]���ґ1B�� ����j��es� ��+N�<�'	���U4d5� P������F�Բy���� J��\J���-��UG@ۏZ�Fz����[�֮���b���N��j��t� �D�S��c�]	'�!�.c��n��9�Թ:���KlSwv��Ѡ������E)m�� �~��W��u�΍�bx�D�TZL��$\<~Yn�r;U;%�:9��˟�u>�,a�	���#�Z�⛂��xӾZ ��ʰ���, o�q꧸�ƻ��th�Xr��+7ǌD�[��B�8�:���G�ȯ�������{����k�v*�܏��������7�+ך����fk�W���Nx9����[5��z;;H�7�2���o��\|��f������:d���N�6�YI��J?1ڱ��-�R�7Ꚃ\�<RG:�� ��r(���]
m�I,��S���zVwF�M�(��`��w�)ȍ��|��]x$�Sg&x��-&Pd�����N{�o|W�%G]O�kb��n`���c�w�a(�I�u���U���N(zs��F3H���I�A�5��|���}G�q�^�{���k��ڱ\���*ݳ�Ͻz)'���=���3J�N�CGt�b��8����&��
ɸFr�DѨa��q�CpV#(rF���-�{����c���3��������ҁq m�{����}O����X�0F8m�pG�U`�P�8�/�J[k}_�|��mc��4����� �x�?:���Q����Q�M�Ww�zv�u$���#�%^y��pPn��y�<<�Q�m�k�|.��9���I+'�&ڲ�xAy`�Ea �YdP�.N��9[�TS�$����:GP��ZEp��m�+��mu�Tr[��Lq\�u����ޛe[C&�G_�1�+�MŻ:$�$�=gӚ^�֗�щ�,p֭�rZDO�v��u\iRj�>t�ƔM��E.�1��<O5��S���'�q�����#޺�Q�];Am{�;u#^<Si��� ���I9V��妛�}}�o'�j����7�]ә��2��YK����4΢�u�`���q��1���]xRnߡY:EǤk��_Ė��L�*�mc��{W_̧qK��&Z��k��m��{n���>`V�7�V���G���z��_)cx�3I� Z��܅��)O:.�W�5۝N�g�yZfg�.X���}*eO�"�iD�:k�t�>��-��)�)��0k�GqF�F���1i#U9{C�l����ȵ��쩺��/\�:�[g����|��ʼ٤���4U����S�nR��u�R
9!Xv$z�Icz*�-����e�\��<��
�rG�E{��_�*~���ͻ_�mqn�n�O�%}� �r��I#H��r�n\�q�N}�q�Kd�{rG"������#8#��<M%莉��E"�tV[��p�F3�=Mi9�q�]=�t���f��D�`�ǎMw��ы�貭����$A7c$ʫM����Ƃ�Ir��p��O½��ڦ��	�Bs���pl�s���=���e~��G����G��Vr�N�I��F�fC�� 9VV-���X\��FT�T�zR���o�ˆ�c^�2�� �V�/�K��y��0�[��\�7}�m�|V���EӴ�o+̘4��F��*�ԊK�|�똁�GYG�P�rݮ�ۿ�|�\��f���,��y�U0�2P�?3�U;tΆ�Sڵ��ܘ�-�������{T�@
 �,��֒5,Q�8�\z���Y�t��^C�-��K�Sy�{���2n����m
~\g���-c���@Pw�_n��F�Q
�=�`Tllr>y���C[Z�g!T�rG�o_rRV"辦}[���]w>�}��U�yE6k	j�>�����ݴk��A䟠��>�f�m�Ʊ-�X�ĂI�2a~W=�~+ւ���N���z1:ys���$>T�{���OFbtԕ&���E�Qa��f3��ߏ�V�?ԁU]Ie��]L4���MT�#��i���!�mc��9�i"�@\�-�)'�>��_&i:,��W]?�,YgB�S�~"�������ON��L|>&�x��n��"m���s�c��㰛,.��WQ��2�ߍ��̀�xڧ���.8�t�Ml��O���k	h.@��n}=��ɊK��k� �=�|Z'J^���LH̹�<V�!r�F�>4rOM�;�:� '����d�}�l�F�,F�!�~rj�&��Z[)���P�	��[��*���$�6�@� Z�QQ��9r;d�{m��ܔ�RH���Sl�P/`���y2#�h$%�����`H��F��I���0���{Ɠ��DX"�� #f9Cn���u�}��:��H�(�*�����=3�h��6]�_-���~%�|���8>��P��� q���T(���\�\��34H�����4,���]~�L����e�
VY7,��s��>��oRH�w|����<�３'�	���V.Omub�*��R���\ 4.Ns��~�gҳHG��v7���WO�5��x�$����#�#Ҽ���'q=EpH��4x��+{h8(���s6۹��Ǭڶ���0DrT"��\`淄��Fm9���~�fn��
��r��Eud��72�>ӓ�����$�N<�!�vp�z'�~�'���ϸ&ۈ���|B�eЂ�,�tz��TӢ�>s yc�l�G�������Y���R%ܰ6���y� ���?Z�x��E��n�ґ��^d�L���pO�+v�B���l���u�j��� �X�H�xQ܃��E�2�k���/�o:�{yLs� �w1$�Ǯ*Ӷb�TRvWK���&�6�j�[��O�z�U迡��Ѩ���Ք\��s��1�ǹ��z[*���i☴��	7,}�ø�^t�gBCdHm�K���➴K�Ρm=��i�'Q�f��-��{��k��e8�C��k����'X��lz�[�)*�� �U���hz��?7���T���⸲c�/��X�ј��a�ȱ�Ҁt��������(�#�2���^stCtt��\[[An�"B�>%���ߚ�QIR2m�֓!�v@|�d g��Y���'���hQ�������?:���h]�HM�H�2Nv��z�Uz-D�KH��
wmn[�\zqSb�/���)*�E*� �j�q�RI��_���'�pq�ްzE��|�B�"D� E!�{%�V��k�B��������v�Ӎ-��2�8 �*%/F�TʓƝQ%�4��EZǴ�;1<� �k�}7Fv���c� Q�v���mA�gm�Ş� �򬤚��X���$B��qk1�V�-�OJ�;�v���_˱#�NX_r�CGْUA�AB��e��oor�D��G����~��_[g_[�&�����n�ڴ4k���K��w1-� �'8�kx���Jk��n��J_Y�G�1����ȩx&��tJ��� �V�������~}*�&q�yb5�u���V���$LP���y�9�+�DrŰ�ȼ��fC(6��l`W�����D��J}�z��㴹��NYom�b>9b;������e6��m�ٵMn�I�\L�e�b�sz�~��w�p�M��tCf��TQ)K�����:�վ��� [ٵ�������Arґq�Px<TҊ���2�;�yk9�D�E��]>Lǂyބ���r��b~���-�@�������A��s�Eg��,}Y���ԡ��{��$��K�@;����֍GT�IݍP�9����K@�S7��U�'*�� <�N�}��w�^Ek�L���3'���!���L��։�9�V�����̲�A��bl���\3�Gd&�+�ї�<1�����i"�G*�/�c������9�O����	�1u*Gl�~���V����L;,�`dn���XZ��6kV�3�4�n�����?��d~bl�1����~��l��l�|��p���-*�pF=�ԙٷH�Q��f�6�&M�����Q^��GN�@�q��Uf_*A����*���n���$š�����|���?Lԋ!Z���1�(N�dޣ<�'ۚ�����4(0���g;�����`����䢫!��؜���x�΀z�{��ͪM#�s�w�zS��]�41!�X� x�eﴑ�>�Q�h�wB�[M��I7q[`�>���G�ǽd��F�Y���y6�j���+��>�9��0���U�f+]�τ�(2G=�z���zyOC��s���l�3��T����1]�]���A��;s�mq��"���)����߼�����v�r9\���Z�J3�O"\��>b��I�n��f�`��0}~!B%Њ�[�gI����w��]�9�����t��'��V���m6������dWnFֽ�cH��6�����Ǧ\}�4��r�����*�L�4��|>𙅯Q�W��~se��`�&��l��X����/T�m��^[V3��o��%~�j�� �i�F�������d����~ʳiv�٫W�� VyIW�1\|Y�ﺥ��K�"%)�6���Uh�bҢo޼���yyN�Ԙ�Y�	G��-q�C24y�9Wr���c�Һ0�$�ȳ.������!�q�p»]�M��e�����ޅumu��1��%F2�����Vy ����TU��f�@[~hb�C��Hc3JY��*�0>��vc�K��L��r9���Ƿ��͞��i����ӫ�np��C�p9�j�Mt	$���s�*�ş�։�R6It�-m�����}3��W�,I�rK
d��;�.�~T�lW�'Ӥ�{8�x� vg99>�:�ԫ�I�q�C�}��y+���}���#�I�%�r3�� '?�c�H�����ǞJ����W��N^��WPm#J�P�,e��.ja&D��.��]��V�Ϳ�N5ܗ�-��s�+fB��BP���9>���\�{m���?��WR3�V��G&�)\�߽,�Pu���ḃP�.b1J1���j��h�t6�.�yi��� ���35�fA"��{�9�keջ�A��-�<6�h,�B���n9���l8�+w��B����ij��[�@Cw 1���J�;q:Z:v��d�/�w1?	��sս�wKEO���{����8�3Jk1\�`��=��t�8��6�-�-b��WΞ8�vRI�3���+�gg��Ii�i2�����-�� I�O ���jϛ��V���+�v�� ���]ľv�7���S��8��h������X^��:�7�t�%����-�#
�8��Mŵ:1FN<�Pl��8��
&9����=��y���6@:��-3X��I�[���.�dÎ ~� �ԵG,�#r�L���Z(r�\���U��+C�]iw�x㵞<Hn�$	@#����1R�e��}����4),r��e��ɖE'���9^�)�7ԷmֱY�1��u/݃�,RC8$?�J���B�+��,u�o6��]3������Vd�?}��W�>�7����J8�Q䲔}�8�M�"D�g�_!L�@�;�ߒ�G$s��O���}Q&�+^	k�đ�R",�OP{�jr'=���
���K��AnnLRI�����8����ǌ�:-8��SL�-��]a=�r9 ����e��﵉��5R��&����:[\H�g{yesF���Hܭ��'�V�I���O��:a��;�3�_��TN�EJv��Pq�i�/���Q淔߻��g��޼c�\��G6�47HQ���E�2{����=0m�ŝ��Ǿ�۔F�X�@��?:��^�2�ĳ�"!�������sf�:�@C�E>���0#��Ia�>`���A���6��w����ǌ�:��� �����$@V�p���<���.�9n��Ծ ��:Ah�n�0v�C����*�YO��_c�y��u���оo���\C}#�Q��썉#�L����+���m~�t
��B�}jk��w*I��
�p{���b��O�"x+�Ҩh�ؖS���+����<�#��{'�b�s际�Q�r��]F�1��C�zЬ��l�b��>�h�sJ��ر���q��J[+.����Ym,&� ��8����q^���G3{E�> ����Yi�j7��D����mڊE!$�F���U�z���C�%�mX����7�����E6�f��I$�q�/��4��K;�m��;�dJ�k���&��l�ѫ����Y��somn71R۰���*�-�5�o�K-ܩ�2���~8��<z}+X?U���3诼D�w{xn෍� C�n����������k�VV��p��&>���o&�����GnGoZ����+#��.���{�f����x}��8�������m2Y���c-�Г<��$�'���.Fq^�նv�߉�f�#�%���cq�:�r$��x��������s�-�����3
�]7/ q��k��)3��HznM�T��u2V����MV��2��ȹR�pY9�����$���.��N������OĨ�%6:���������LSe�����֝e�i�8<}=j�I1Il[��+.�I#Ў՜�;/KѮ헀�=����*�u��Өt�BE����s��O�*��}$*�#U�Uq� �>��r{d�ou�t���@i&"5��޷�Rz2��EO�k�N�ȍW����5���N:�M>9��:�6�8nn�}���,����z�uiu�,{|�^�����v�.��_h� �����Դ�7̲��F���� ����$��(K�h����\t]Ρ��BVi<ĉ�!�g���3�|Qۊ	bv�ȧ�d-g����=2�%���=÷��r����V�D���W�+���	�J��I�u-s_EɥĢ28�͒~��q{1pkKc��v�Q����K�\F�Wf�RN����*F�s���C�$�Kԩ��g-�������>���g��茹:z.�<�5�>�ZG| ��H�e�.�)��O�^t�F��ƣem����8$��s��]p�):g,�Ei�>������K[C�F
�g;NNG�\�t� B~_���U:���޿��kk-�˽g�3���OcW�T�<m�^��î��z*�,5 R�h��/�I�X��ZɫizѬ9/��9^Ŭk]?}�i(��	|��~A�#�*Wӧ�n_��z��Hf�K�f��HRCl|���ܽ��������4�2��L��¦P���\�y�Fh��As$2�EX��~���*���y��l����O�3<Z�r����H6�[Eo2�m=�UR�?�@Y�9�Y�c���8�yM%��be�%<�U"�!��<��6$3ܔ/��>$#�UJ�����Ԝ���9;?�%��9�i��F�F�^�l��q�Ї�Fq�j6�B����}���V���10ܬ	㟟�{V\�n�$�{�m(IU�@ҩ-}��oa:=�$9���=9�J��u��ghU���~�$�kF��� %�ж�8&��J�E����=��
�r�Y�;)q�$:�ȑKm�*�62z>�t>����P�{��l�̅�"����FK����� �Y�"�����#�q�#ڝ�I<C��њ�@[�"S.I��s��G�'��e�(���*.J�#>��ך�%$�'>٠0A'ך�]=��W�(�H���� �n����G��Q�S���Q���̰G#*9��3�ℳ@$�w��
����� ��4.�տiY�iԂHh�C($g�� �p�*����C��z��Ԩ�H98��6I-�G�8f܊Z<��(���	n&/B����Y*f�~��>ԁ�֤��6���ȭ�~3�:�gʊ��((��?o�Qa'�c�T���v4+.��i��6�k}n�9��Y�����T�Ŧ��w��^��^4h�Q2�Rv���k�Ru�&�E{�=��wT���k��|��i˴~����6�q�m82%���ޝ;�����\��|�P{���V
�k���<v�Rh���s!72�n�S5�y�@�*��{V2�'�~�ӤL:wB[7[k�C��m�O�<|�1ഊvβ�c��:S��A�G���9�`i	��&�,��E�i�Kw��X��m��oC���y]%�#�(min��E���7	\q�c�W�+��wb1U�Njo��v�))�VEޛ	�?,U�'ZtGr���:N��v�]���H���{Ws������P�um�o�-/ݔ$?��<m���x����CIl��+X����%���͉o�;v��VMZ�ˢ	��ͣM��BP�]ˌ�\KR5-mc��3JY-t�3t������t<�:���"��7PZ���ذ�)�c����/�P���5]�h�;�I>��唻#�$}7���2�6�ek�ǌdf7�#�>d�l��]����w�.೚c��q�����V�Ⱥ#����P�XD��?𓁊ӊ���s��E��x�2�%������eTM;%�r%�JL�*��2N*���׹�cmE���h�2pEV�}I�^�a�E.�k��v���Ѹ�Q$3�[��P�	��N�9� J�
�Q������X ��3ϯ�S%ǢY��!8��Ou$��(�q��q�c�� �Ǘ��GK\_�:��ȥWg�>�:�J��X���D��+����3Wr�o�I����t��Z�{m2I� e��\��Vk&���D���2~��Wq)�����Q�#G������G��N��'��S�z�X���F�*�N..��
v�?Z��j�
Z[�(�u�:O��rx�7��yr�����}��iK�YƥRt]]5�Ԭ�%�.8$r���x����{��]�\��6�*>>�:�n��Z�Eٙ<'����sݭ�c����a���2��컂���QY^t�1XY��"��V�g�����d>Ҋ+������֡���ȁ���~�i�A*l��ȯZ��Oי�~�����ymfVO��Ԋ����h��%���[ȷW�ͤ�e���~ߟgh�n�L�R2AΝ�Pm�9�A�h�-��:[����K�C�� �?���bh��T%�pFdD��ń� 1��N)��� �oBe�M�kq�8��)�17��dc)�Xɸ�~�����ꮞ��M6dKd��J�[j�BN)Q�$h�߼Z���|�J��[�{�k��� ��;"��3m�/��q�]�>$�UBȯ�ӭdf�d'���p����x��m�*�N���4�,@�	D�����1�@\w�9<�n��Y7�/�MFv<�r��������Z�W쎬Nɝ�o0]۷|;�=�j��M�rj3Gr��ت�|��֭ޙ/qU�ԗ4,�G*[��?ʪ��[�2��t�:kR}��WڞL�Tǩ1�Һ},�ō�������'ٝ�h�T�`c*ޝ�T?r,��#�9iO�;`�������f�F�IkN������H&��T�����Q�� ��s;|J�n1�ڀ�-�E�*��Č'Ў⡪fX�wz���[j�-�
��Ō�S�&�χ,4��k�Y4X��h]�v��Ѥ��2g��jwr[�ZK{*d��C'����PUo��������c��F�f���P+�#�Eg9T-�Κ>��6����p�Uq�F �&[���S��)��� ��Ut� �5$���	:�I���4�ߨ�=�6$b�*�[e�>�W�|�8��_��ݎ9a����V%SMfu���P�P� ʝW�3�`���ݱ�P�~4���BC��{}�������o㳉�i"-�sݔ�?�u�ȓ�tRqMY|u7H�W�<f��w|o���x�I���拊d�uMB��Oӭ�I��Hêv'��\▴�ܥ^�cK�&w�;t��ߋ�r�?�z�������烉�jv��� {��{]�r=Y��KI"���k����ī���ѭ'V��@�@��ڲ��G3����/�w����Z�u+��0��N��&�$�ۦuE$�g�@�j�p���2�to����3~#X�?O�s� 2q�@tw�E�з?��쁆5l����^��UMP�ֺ�zO�v�-*��8w��K(@A�a�H��T����R_�~¹WW���P���q���<*.��[iB��.�� t�O�� g#�޹�Ɲ�3H���K P����lP�^A54��Z�Q��e8 ��w'�W�n:ۤ��S�������̤|!�c�WT$�fmV��Q��e�s"��#�K(���S����w3��1O��;�B��/O��|30 �c�X:Ӣ�ܕ�lt9��q"e�8�Ᵹ'����kZ��N�?���'�*춑U�JuHm:gC�o/� p{�qT�a����4�G_�f��dq#��h�ysO��rI+GF��뛣���� y�
����k��Z:j�6�xA-�͹�Y�6� ļ�G�ZF��L�?�vl�d��Q'�I'�� ҡd��%Ƃ?
�d�H5��1�Ǳ� >Uo��hqD�|1�GHѵ�1U8'�ֱS��iG�#�i���K�8�bf'?έ�"�j/h�-[�ۋ?����)I۾9�)����_O#�Es�l�+���X������<G'q�8&�nZJΚ^����������<�1����t[�H�t�'��"i��#Ǚ�a�ӵe�AK���t�P�}q�ܴ���`�~���*Q�i�B��[��9n!���l��"�f����޷��l����qmΨo�ghcI��H��3d����Og�ݍ�eyW��y�Xa�ջd='`���1q�^�"��8�uw��� ?�E� HUUd��[1�6���� �-�WE��s��Nh$�` �*j+�ocY��R��b�3y{��s��-3|;�Xt�)`İfl.���u�ɦ��%Ŕ^����2�j�YY
x��|��--Y�4Qw[��sson2ۣ"�#�������G?����a�GƲ�0(7�tg�=j�kԦ���5"9�a�y26}��Q��$�={��f�Y�4�H^!)�^G�������!���S�B�-�������?,�wN���_D�����y-���q b?�z��_�����d��1k�Prrx������WH�u��	�Id�]\��t����V�O�c���As<��$R�����K��q��Zi���WEn�Ҭw��{a[���Q���$Y!D
��lL�݅>����!4^T��{H�thd��fR>�T��'i����Yً6O����K:���`�p���2�~}*��e�ian��mˬf=ϖރ>��[��_س���^��Ik�7:U�W|@�o$��l�e�܋�N�GUxU}��K-��ܴ��BA9��7$v�팥�q4��l@A��>��&l��#o=6�T�F��R�=6
]`�N_=�J�}	���1���S9
�B��K���^�c�W�!#�����܃�V�w%F���^�映zRATiJ��q��~!ޅe��X(��2�O�H�MGC���P��w:�q���^�ϴ����w+��WT2ޛ2⯢����뾲��,6��-�H@�|������[)�:C��;�|5�D�mﵩp�;�"01���Է?�˓�(c�~��,n����c�U&|#���jI.�5��UM�_�Iqr�g�PB�Ԧ��EZCo�K����0�ؒʛ�q�}�6�TG�s����{@bh�1�����_C�j�2�ٴH�s�6A!�T�� �8�,�o�P���y�K8SS.��	�W^�FrWE��� I�tL��Q��O�xn%�d1+r�~��/�q1O�i�]J��U�[�	0w0�J�U��_i�C��R�T��\����HE(a�9��ǽD�ȸ��ԕ�eYwi5�Ė��SFv�7pk��L�;��PHP#���$�B�AS�����K�u^��V�M�Ϻ��rHW<��գZ%���^��x)�~ʗT�]RR���� �z����F.V˷N���{#<X��)&qǽb����z��=���$������֮��֋sG��LX� �;�콫�Q��]:x��"{?#�E�O��I�T�<Hi�)Ӑ��e�s�=���y=׹��^�Kuc )�f�?:c]����οb�-o�D��D����7l�c��pem�߅�N�ꞗ��5ey!����DӍ�o����,�n�*�}}��F�r����HZ��$r6㓷�{�����kӺ~�բ�@��9,yo�h⚴G�I��zu���Vy��@�5�Ǣ^t�ѵ����n��Of+����t�o��N0�J��	����J��T�\� ݈�cN	#���Do�]^����$O�ԏ/ >/S��1����g&�n�����"��W��1�З��|���Z�ee����:����ao}�l�R�r+��x���ti�$��};��E�WK����}�c������X�ך���^jZ���\��Q&0D����ҧ��Yκ8kQ�Z��Q�2+>Zѱ�+��8������]� �H�6�Z-N?2���^� ���oeh�X~�,y�`�Eh�
ӢU!��ݤ�a���y�2mq�u5�K�.���I)d�+�2�|��[��(��&ɇA���԰��\I��-� +�Rk�xK��˭>�����+[x�c+���K�&q��Z�cH��6D��A�54����>6��dww�c�q�G�O�+�[(x��8����ӟk���f3�*�{3���*Qi#n6�����U;	�{۲�!��{ ��['�#�����F���+��8Ĉ�'"H�i�����6�}�ۮ�n�H�6��F��>u�MvtŪ=�ȟq�@ʠ`Dy�x��a�f��&�8~x-��>_1S��&�g�U⿵1J���E����~uX���V�E��O�5�o����Ǎ��S�V���oR4ۢ �h�v9��O_���U$�_݂``�Ns�?:��>��p�����gz� ����4�8n0>�ç��&���0Q$z2vb�y�i�.����}m��m#Ǽ��d�[h���*"��.֮�ZU��N����o��$�P��ՓoI��+�[+��l�5g[d���B7F����L�-VΜT��θ������aϷ�\N-vn�E�o��t���;ŎQ�F<�����V�@Bȭ���UQ}�T���w� R|ݤ����Tii/�LZ]x3��G&_�%�8'�\��jTs�k�g��>,���zG�y��jq�Zdd�s;�G�ǭ
ˣ���� �   ��tdta���� JFIF     �� C 


�� C		�� XX ��              	�� E  	 !1AQ"aq2��#B������	$3Rb�r�%CS�46���            �� :   !1AQ"a2q�B�������#R�3$r%b���   ? ��CP�7޵�ϛT�!ڿ��c��zg8�P(�(�(�(�(�(�(�(�(�(xج?��*NF><�(�ʀXd�z� 8��zb�� P P P P P�_ha�[p��;|�΀�@@@@@@@@@@@@@@@@@@@@@@@@q�� �
 �
 �
 �
9�� �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �=*��B��ր�4(������NU����@y�
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �6A�U�J�n�������`��c��4䝅� ��ր�-[�$���I�`z�K@��	_�x� c��{���K¨�Z�� ����\B#'�>a$03ǭU��j֎�����$����]ˋ�̞�]S�S�5/�U��r���rB����jRW�*TW�]�uMC��,u�5�Y� ���j�y:��oԹ|� �ͧ�^�=M�uuޕs�Fe�Z+��8 �9'�r|��j�dӉ1�� �&�mo4��W�QI
l���v5�<��������%xwoНMw�Z�gU��"�]ƀ��q��<��o(qtDe�X�k�R�5��(�\0Wx�V<��<��UM�~��+�:�T���Z	�-����#�$���I���ս-���Q����D,�w��O�~U5�*�D3]�}�.����&�l'S�؜V�AJ���;�mYǛ!�I
���k���[�SxBS�`2֪&2\�;��1�ʀ��۲� �`�PhY �
� Gph��ճ'�m�(�ʀޚ<�ZKr����d���@%XY6E�̐r{q@tٷ�x|w�o��:��6�!Kq#}['�}+)d�H�j�\���s`���ɰ^��j����������'��1��W�9��P�&��?/7��'�1m# ������{�z�����*��+����SA�2knb�kw�����>�� ���G-P�P���q���fW�����h�j�T>�� ��қ&���w2�=��ʒx?B)L(�
�����1@@@@@@@@@@@@@@@@@@���A=�a@{m�&70}����7��5��FC�n�A'�Ԡx�+P��U���ߕKZ ��ଡ�l�k�R}�F�]�������d�IcX&S�f# ����J��]�F|+���M=n�t�/P���{9<Ո�$�9�Υ$�4�n�~��\toOn���r�O���4cЍݻ��)�d[S����X&�Y��1�u����� J�~�e=D��Sѝj�����}2Ǘ����'�Kr�BGZ����۫�8�l��ӘZ��� ��ּ��6��qjQR,����ۑ�=�5d�qd4��p�S��?��Ph6�}+�M�>bƼ�b1�n>x�N�Eɣ��/��v0�P��k��uk8ٮ�,�`#9B�����
������g���]k#���<�i8��1�8(ñ9�g']�E[t?��:�Z�:>��;d/~��*v���[*Q�9[8{S׵md����dg�#?a��@^��^M��4Hz���[��Nҧ�de����H3��s��VNE齗� Z}�/�� �.,��1�urە���ǚ^�+N�M���z��&�Kۋ�}F͊�I*���{|�ԫ����T�\O �)ϽAa��J�m*[�f��'Ē�7�����+f��Iv��h��$��� %�g�MY譫[��y�[M�3n	;������Ѻ%����Ք�S����vX��/ ���T:AP|�̓�:��R#�rE(�
G&?	RFI��<�ڂ��ƾ�}�|�)�~��l��!�c�ʡ&�Hl� g��������� Dc�z�lq�J����o�ڒ���0MIC@�m����c2*P7K:4q���W��V>��'�%�K�3���g�b��c�K;�$Mu*ガ0EM�@
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
 �
�D$� |8��l��K�0[��A c��ދ�{2��ФQ�  ��8���Ձ���ܙ�����>�`��c�Ӎ������ῗ@r�&�M�4��Ib1N&]���|�bj��M�Z>��&���l�����H����<9沅��5�^�m�}-��_��=��\_4��)
[9'h㿽o&�9>̢��Fߴ�Biw��h�L6ztE�k�!�G�ڭ�uBZ�V�'@��34:����~�#�� �A��O���t�:��cay�t���y�si�@�������\W����^�T�h�	��n#�5+����:�QhWzu�+%��f'��G8�����Z)8�*g�� ��?�	�Ň�'Q,�o4���^���u�-�G*m:d��k�%�Y�z∬�l>�F5,�G�9�1�����TMS�O���*����[Gw|����n,~D� J�/�Z)?�[9[�X/z�@��I����M��x%k9j.�%l�kb�V�a���a\�Y�I��j��3M��oN�	^mER�f�j��9�]]Ր�)n��zg���OO��-�Y�b�7�8��z��t�^�x^�i��F��m����T}�B��J��Jv��d���>�(��^\]3��� �e'���~*Hh}3�uV��aj.o�˷���3ܚ�t���� ��s��L��Rimv�R��:;��In��銉I�;t_S}@t˦zz�Kӡ0XڠH�p�zy��6�ozB���=�z�_vR�cba��?1�Ki��5MB;?#|�6L&G�����[&ڶQ��9���}o�}�ng��[�?i�����dV��NW�R~���jJ�3ڀ����>��2�d�B밪+,"E���V@[qcf�U]&f��l�`�$�۷�Wim�t�6�nL�9XD���� {���Q"MkI�J�����U6�0�����4�`j��ܖb�ܜ����}(P P P P P P P P P P P P P P P P P��2��� �Jo�Z5ʦPmp�$��ަ���G��u''w�u �$� ���z�� �ʭ`�[Vo�Ĥ�'*�g?�,c���,xYo� |��,���Iwy׺�w7���-%Q�n~�8�Iܤ�l��h��%�:W��텪�_�D �Jb� ǝ��=O~դ��L�qEe�M�TiW�k��5��LV�7?y�F?	a���J����s��:���L�\&�$��92�0HS�q\����Ѯ8�ϫ�?�zoFi	�i6���> ��}�<�"���:��*�sؐ��WQe[jw��|�CG��'`�f�ĭ��H�o�[�U�˥u�a=�R̋��yή2�
�*��ֻ�Pm#�}T�~���r��{{��혾��H �����W<�f��o�B��}]���Xۥ��[�y#sd{�W����&�<�Z�x����Q1e.v�B�AYM:4]�U�_��S�
9���5rc�T�3�>,��WJk���8;�M�g���B�D�������B���#�韕eJW�IE*�9�f7��O�Z��ă?u������P�܉F��~$ZEi�Z�0�-��	�s��Ҧ]�V*���RT&���Oֈ�������d��#�]˳��w�,��Zk�1��v���������'L�'p�=��7�6V*���'���[	|<�:(o�s4�DY������W�&�J����H�5���ᢺ/mc��#��wl�kH�բ�����)��,v�\f��BۣQ��l)�m�?J��A��"\ζN�����:�cr� 1��u��E�a.�r� �:�h~~ô2Kj��J�"�K��i>� Χ�������(���6B�#���I���>��	�y�.�Y�N0jn���啶�Kl��Gʣ� �Iqĳ�����1����35������dlI??ʤ*�@b�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(J2Ì�ڀ�d�cQ�c�T�r{T�����:A�Ol <�A��j5L�si,ȅ�B�F�����4�p�v���qP��PI���x5 ����?�~1�Y[���K$��l �:�ɍ���u��R�Ϩ���+1���[�(�tW����������c��ı�Xd3G���'��K�ʖ��;K�}_]�1
������g�F;*3\>G�K�Xi'�}�r�B��6��.֋7�9p�{��������(ߵV��t�I�k�v��mc!��d�3c�'�޻pԢ��rerL�r�~��� ��w�y� ��0��$�;Oe���j�%��Z �ZU擪<�k�Rbd�rX�QTj�%J��zg���\�.��dV_(�'�8��U��"{��������{}�V�������~��e�E�{;���t>��1s}?�f�����+X�)s�r�V�&��ֺ4vv��Jb�O|��:��B{��>U*�y$U��'�~�}�5����:�e����?�� ����*�Od��e!�V���\jS��q;ػ�Ϊ�`]Ⱦc��R	�������D�t�*�Q���v�Y�U��O 3��
:Kc~�z}�~κ֓�6���$In�lB�A�
���W.Y6��lq_��?�C6�q�r+������Ƴ��n�j�Mm2�ؙ-��y�#�e F[��=���*ר�� U�H�i�C
,��0G��-�S�#�����|p�&\�\�A�յrt��՜���������7�u8ZFpߋnsߌU�]"�tq%T��
&�t�4��w-,�I�d����1��^*����X>��Gp 2A(��sI*a�BOq;E"Ȝ2���w��F1m��m&6HX�	S���5��!���H�ȥ$S�V ��kL�� P P P�(P P P P P P P�7���X�X�=sN���weqc(�� ��p�)RA�B*�Th� (�(�(�(�(�(H��Wp\�e�� �Nե���J��<R�zw�E�.u/6O6(V��@1)�~qǵ%+�	���2���� {�zUl�hZ�Q��>���Ň��-����=i~��i^�v������ Gޜ~�<U�}��� cN���9�MI'K�OR�D3�s\�3��.d�S^��ZRi�����x�Ӛ�Z�~ʿ(dY���3�=+He�����m#��e�GV)y�_[ɦ�0��ϙ���??zޒm]њN���}q�v=;��������o��*뷱c�Y�s�T�S�MvJ�I?c�|$�lt?^i6p�c@֤�D���13�7���p8N,����4�wI�Q_M����s��e|~��6�DŮ�^���W�h�I1���� һ0IBU�e�rV|��O�|?�KI���9g��"&+"d����WD����o�τ�{iѽQs�v��)�Y���������=-����?z#M�G�M��WK�ep�lh? � v��h��쇦QA���Vd�d-�OΨ�h�u�#�.���QXno-@��d���#��A�MQ-6+꯳��x�8l-e,^h��?�LT�ZN�F��J�|=K]:'��y"cg�q�'<�� z�}2�7�ʚ��\j�SL|��0�Ԗ9���w�\]��z]�q��� r��q,~lQ��=9�",����s�^)X\������d��y
�ᶞ�ON���I�^� ��8�3�'Ot��K�ζq%Ğl�=X���U)I���ER��!]۸�'�P���c��c��JdQ��� �� s����;Gp�	IP�G��n�V���\%Ӌ���v�A�%���޺S|�^�oq��i�.�Oe�R'�ɯ��VLd�f���䛤D�'�@�
 ��4��M�����%Rx�8' ����TUY�n4�[�d�om��|ؕq��w�Uj�C<�yr2�	6� �?�Q��9&}�+;{/4:il����e�$7S�z��:ű���RtE��đ���� �D�Cq9'j�&(�(�s��u�&����E{d��e5�]B$�W�����ttL1os�>f��Ϊd,�QO��J��y��rKG|�c��U�My� ����H�c��� �� ?#޻�t��ȣ�T�5�KJ�tۻގ�&��$-�����vR{���rΓ�X�(�l����:6�scy���H�K�`pA�Ú�� (�(��~���Y����Z�V��FE�!b8L���\��a	ph�(�!◆/��\rܻ�w4��(Y`u l9�Ek�nvc8�����υ�g�k�]"�Xv��I�T��F���h���@���W_&䱮���r.� �?U��M��k��`�ڶ��f@��H9������e���+��"�E�����ŕ���o2G2��4��x����գ��N�K��P�z��}��j����Ǫ��5��ң���d\�����Q\^T�ak����ɞ>��Zf��`�K�8#[|ň�]� m��c�S�JR��S5s�Q�Y�P P P P P P��l���<Ԡ(�a$�f!�_���zQ�����r;�T��$Űc\p�{�}>ue�I~t� ��%�v��������p6��
;�ߜ��벷�i��m�P[2����" z @��v�3\���bFr?
��-��$~2�̫�lr��"�����<}~U��G��Ke�?�΂�Ix��#�� �������w]̣";r�c�_7͑�|�����6�S-εs���G�ߏ��I ��`��v�����7���y��<D��ZIBa�M������?:�j��crmox�E ��v)�� �'�;v?��Iz��I�C��G�.�N���u��l�a�����ޥ��N�Ѿ}�z�H��mR���y|�����A��j�*/��m:c_�"�|p��\�m����aY����ǰ�j�q��Q��h�g�5}�P��l���[Er����j���i�Lt�g�i a��!����Y���c�X����[�l��y�ߥ��� 5�젷��\0���a8VC�Ծ�v�� ��I�Z�M�w�c���B�܆ۙq��sUK��e�:��;Ď���ƳDX�����8<���R��=_O���w��R������4���YIn8#���9{�W����ml��W������3�x����x�d�z�-T՞m+L��C�l�i#�(�bT�<����M+�P~�]#�^tDtՕ���%�u�H2�,Tz}pq�)�3�N	(��MJ��As��85/��4��PF��2>�	�d�xb'Bv���Z4�Q�3��0�~�6É��ƨ\|D|��J�J��.�u���ѡ14�8l��>�vR�{1Em���f�2j���Z${�����������K�8 �ʘ�
�n�Ȏ�܌ddd��m�;�ޟy�VBA��N�{�Ҭ�芡L ����b2���D��on���W.߾u��+������^��g��q�yMov<�1� ��{zґZcŽ�	<�t`��K*� r;b�����m!�En�Y�o�@���T�>�-De�F�C��c�Nưze�8��
 �-��+'�����̙��\~_� K������7菦�;�����H�����3����n��\<���|�!�n�qM�GJX��Z�ޯmm�ʙK�d��Z>T�q����W���[î����E�2��d�|��W,�I%(4�18E�|��Kjj�6u=���N�����'�^�X�gMM��nf@dw�gzxC��Fxm�D]���$h�lX$Ys�os��W�<ye9�F�z20�b���}?��������{���3��m�s�v��� N*Jkh��R�h�����͕�_u=���}"7��\ȿ�O�淔�-vB\#�$%��@��E�����f�����oQB|(q���x�F<ՈBY[h�5џe�����m��C��Y����	#Lr���x��jj4���x��9��!�\������H�C_�-#���N�8�/�`}��q]�/EQ�?s��N�G�~��|V���Eh+�Al� w�2�x�n��@�cz�:��_Ȟߧ܉����[xk�^hچ�qay5�����d�o+9ې�����Ȕ�O܈��\\Iw<�J�$�1fgbē�Oz�$�"����@@@@@�&ky�T%]ea�hlZ��
�-�P���X����l��XK��PHlv9u��� B�d�q7M��(�%�<c8� ;Ԥ��=J�,�i��*��|�+����«B��$�{���Z.��?�kb�
��ؾ#h�o/��Xa��0F>ι�q��F�Z�-���Tiז��wK���i�r̒T��o�T#<�Rn�� C��ms�R��x�7b�C�p�o�;����Wj�Zo�G�E{��d��P�$�XK>q�G�=�F�̞�����֓��ꉧ�XC�nm���~�$�O��|�>RH�?����_f+�/,�X�ƫ���%p�M����>��q��;Zeeԉ�`e�|�+�x�Xs������zOi�oS�^uF�g�ͅ�KqOt?v���s���Iqz�R$}e�N�{�ֽ-}fڍ�Z���E$��}I g5U��l��AzW����$ў���Z+䀂r2��#�oa�g��k�����v/g��yC�,�N n����*ͦ�2���d�����c�/�����ūɷ̉�x�#��9$��9-tk�.�&=}�o:���혐��w���=�� 1Z<�+L��5�4Oz
�R�U[����F@f�P{`��TB_1�q�-T�kɝfI��t����ĒT����Z5�fK�C�3A>��g�����vJo��}?:�JZHe���s���ga�I9�q��� 3R���2K�~(�h���Mq���;��q�q��g�������YG�=e�<ّЫ�A�����H�R��0�h�B�b�F	'�Y*�Ic�!�����bU�f�->��1��p���ʾ�X�N�����!��Ճ�������+���՘�ފ��X���=B� v�r^Z7�8U
�F9��� Jʒ�"�Z8$Պ��
&����W�� ��CR��R���H�]�v��o�9q���*ޠ[w;\���#̩|����ă��K7ŲH���aHo5�[<�dUh1��'������d�.NWa�2o�\��p�ʒA��v�������`�R���;V�~���)�D-)�R�d�T�\{�>�d#���
 �:��-�]C�r_\úH�ke��Z1��#���G��E;r:{�/�u�}a;M����Z��G�*�� Ǐ�vGɌq��^8�%2G�o�RN��=h�k�4r�\+�Өf`=9�;|X��k�o�͒�}"���s\h��u�����6¡�g�{|�&_�L�1�|�W�A�-���}]uwq2�R��PF|�y2ʼܓ����se[r���t Pר:�m5;�>��+�:MB�qi�C�u�S��>�ǉ��A?��qi'%����uN����8-5+�#�_��1v��� ֐qNr�M��.\b�G��� �Mt��:D�]��iƢ��Iʩ�l*�Ë�^iv��%d��e� �ǥ힦�)$ڊ�A��s��#�c�k����})Q�Y�>�"�;W�4�ǟ�!�ߪ�k-;W������	.�@9�ʻ|l����I���� x���}��~�'Lu :~�m(8*�ϯ8��L5�c��o
��o�:j>I�G���J��9q�zK�\\YE�35�`��$W��5�ʲ�H�pq��������.���[)l#�x �e�E���^3�o	sVg$ӦG+B�@@@@@@�~�����.ΑK��4�ȥx u-*�BN}=� :�*KE^�%�MV-[��<��y3:3ڝ�r8��sJ��	
������b�ᙶ�aR[#�#ӏ�Q^�d]=�x�v��A�[���֒��˻L��:̚���H��i�ý�`�{⭶�_�B]�]K'X�1��;��B�����J���W�uA�|+����i�[U2��?;��j�$�2^���-��5���O��qb�H	��px���Gn�����Լ ����k�m�?t�5yp� ������*��Z2q�%�{����5���A���������1��oo|f���m	;I����%�r];�4���#�0 ��3Z'ez��R�}��kh�]��m?�?�R�r�鯴PjRi-id�rU���$7Ƞ)���՗�!�}�?��M���]�|�g����Fk��P�Q�u
���2� �����5{mM|'����;VO�Ko8�O�����YN*J��)qvw�NkֽIl��������Aؘ�{�� ʹ�4��mi[9��g�{�����E�c4�;�f�(��Ͼ�tbJ*�1��r�鰻��x��%�) l�0�����-��B�Xl.���a�It�����y�|�荖^��Q��(.E�Wd(2(���NO��o�JJ=-wԀī2�\���r��XBx'��D�g����C�z|�v� ������l�ú�޾�v��^�t;[���WOmq�^?�3$�Ѻ�1��M]$;D���sIsZ���!��ᶫz�[�����~Mi���[��9I��v�(�9�1ީ�ⶴYI�q�x������kt��[[^"��A�i�����/rSI��LyR}�5���>�,����
d8��I9H��Q�����P P���U�/1�o�����d�V�@Wanm��K��0�u}�� !��Ւ!���X��w��l���$ q�sϭMY(�o��\b@H2��`�p'���P����X<�R�m4��x�&wyC�ڤ
q�u�C�
]��Tے>!��� � O��{a�\�rg)r�מr~��@b�� P�_b�Ӻ{R��e�jS^%���DX�o�����G�.�z$�Tu_��h�Mn.��u�>����yvW73c *��8ϽsC�=�i�<��~�~"�7SZ��u��k	e���3FE�u�o����WNR���twH��ƿ�W���T�/�	�|�����Y>Zv�_��(FiIvp��X�n|.��k�k^ն�b�4����ǧ�_A�77�qf�x�19Z��@�
 ��3�/<�|D�0�}ޛ�N���4��@�@x;O�9�}�^^�|������q�B-Kе<;�<�N��z���ޭ�o4��$��I�nЃ� �Ҹ�Y�=U��:����}#�|g�3�?.:cA�m���Մw:뿝<�aB�숸<���������8�̴���Q��C��n���6�*/,&[[H����3ܞ+�(g6t��8�EB)�k�_Au�>Kc�Z��kb�*�%r�����,?��Cy��c�r�� ���[�5MB>�Һ�;�N.�;�2�~Nv��z�'����H��R��O���Rh�Bm������M�k�Պ���ʦ�}�oto����`C�i6.Y4*���g*��E?]'��MZ��5�u�Yu������n�$��߂Ny�W��.h✹��t� P P P P P��ڀQ"	/gp����d���,-|:ӭ��$�ۏ��Fx_A�o�h�����ᔖ�j����[]l�M�Q��> x>�|���,H�.Q.!�$�F�>���C�o��vcU�~� P�aQ�H������__�$C��;Y�@I��eS$|{�R�{����N��-�*y�W��|�`�`�j��W}aw����ti��WcYO��YG~�f���N��,\(ۇĊ��� >���z�d�]M�IԲi���>��W��!h��d`�C��sS&���0�'Q+���z��o�t-j;�)�ȊKY$,��F9�=F(�AS�צ��gr������ � ����Z�a@?��<ۧAck��=���v��C��գ��y���B0����� J=�,	�UKK_�����DR�8>����N�!�����B;	����Id2�X�j��9��k����a�ݾ��ܬR�f��C�o^*�ĩM����P�Z��J���e$���Qi�-B+�ۋ���<�`4�X��hM�Wq�va��4`3m*	�܌�@csďN�g�m۷�������V��S��߭M�V{k���ck�Y�T� �lP}��x��LG��*~���`^L������ c�[�]{R��y���`��k<r�,=�k�)z�]^�;�����v��U�A���"��MZ�
 �
Sh�>���3ٙ�w�� ��9����E=Ov�M�	��b�����|�)�*v�v����cD$��X�)-���Uu�x�hԬ!Ӥ�C�#���7�*$v�pGz>ʈ�/y,b��K0r^�cl灼|�S�l��F�G/���w�`��nI� �+�������h�y�>\|;��	��r��w9C�x��Y��(��x_�/ѽu���c�#�pֱ��\R�;>���Hh.�M��Ņ���o��FA���~���˓G�3ۜc*��oS�ae�:�BU��EbTz0 �k�y<�*��S��(�ƱӾ��V���Cz���r0���?�N��<���t�t|��V�Fw;��b}�95�a�(��k�i^�м5�����M����y��'
}8�O�a�>ol��n<N��:�����WWb�]�]R&� ��O��J�渱B/�j=#�3��Sg*�U�_�ω:�#ec�O1���8'��z9q��(?Ts�|&���k�֍�t�3H�%�@�[��H�p�|��|Yd�q�=\����T�� i��o�o��ڎ�#k�ry��1���oɌ���`�5$�1��Mj/�C�����*��6�o��ʆ�#ڱ�r���/5:}�<~��gk��2-����9ݖb+����;&�]� ���t�t��	Ķ3�n��K��>ǚ��_���~gV��n'"�����x��7*KK�0?M�!�?*�qϜS8Z�� ��@@@@@@d�M �K�{�ءE����<��ߏZ�Aau��s�V���#��eR��s9���kGm%eQ��}Fí.!��D��U�E��#�ݸ��VoMr%�u���'0ȡ�(x�w��V�տ�!{���g���2�|�
�#8��nԋ~���۵�����5*�t�a���^��>�CR���_4�ۏ@J��Ҳ����F�Hd�z�D�ˁ����X��� oZ�ߩ�e:e���-���6����9�*޿^��|W�����s��X�M��<��+�8���ދ&G��u��ՓS�.c���������ԷdF<Q䓴�f�XSc�\jK���>Ԥn���I���%r�@3���s���i ��N��X��H�'�7�|��9��~Ukih��m3N�u$��_#�-f�$;s�����}���t��ֱ���!��;��eݴ�V�x���@�$|�12
�sK��s� Q�*����+����@a�9�1@{M���m�Oʀ�&�Q��oÐ[�h�W��QJǅ��c�#�KvQ�U�J�� m��}E@$)��G9ӊU P�B���Bz�K�K4��B��#�P��D�Ы1�)�v��('�S�L�d�!
	R�-����x9[��#�C�����t4��L���2�=�5�u���
z��iV�E��H��c���5*ԩ�}!���ӎ�|�YϘc���^���t@��.m�g�.!�ɲ�ж���' �Y&�V�̧�b����&A��7ˏҞ��#F�}��c���H�� ��T��hi��=���1Eؤ�.s��”����(x��t�c77
�"��U �Xf����ta��'^�;���돲����j=�w1�Ae@=~�*��x0Δ�}�6�V�����ՖgO�5�}�V(�'V�N5y{�M�l�<e���^���G��Ky>妩��	�y���x�'�����M��]g(P P �Н5/Xu~��»��uR?�����?�?c\P�5�~�z[i;�6Ų��yg 6�ן�J�Ο)n�D�q�9$pI�5�=��:g�����w@i��6��^��Mg{,�n2A�?־a�<���i��J/c_Oh��Y=�R�����G5�֭rD��Ɗ��}?ҽ�C�����f�/�I�_�����z����iy-l..^X-l��g�\�yˌ"��*:V8�[�8'�#�i�׋��Ґ-��KPW���S�ʽ�-cVyY��/��Y����-o�ʸe�{��?:��²�wٿ��gGE� �Kø�}��G���;�E�s�����&��?B�L8���u�A@@@@@@dw‰<�S^�.)c�E�b�(�Q��ߞ9���C��ǉz�Z��RO$O;�����k��|s[��� �N���������+�#E#�d�"��i�q�Y9֬�-y��l�D�(�0\�I��W]r0����s
� �X��c�?�B�o[ ��wܙ�&BD{���lgi?��ަ��� [��hE��n/9�� ��H 8����E����?���=�m=�?y����������J��6�x�r�]�����H%BX6��l*���[E����oĲ��[�s�mܞG�VJ����-y7�n�rT3�l
�폭d���Ės<7^^��M��=�� �J�A=���A�4ߺ[[�n%��TMs�	�<Փ�R,�j�<��ҨO��1���ڪ��:O�k�>����yb�@/.��J���|��=jb�k`��\�?�r5��wv��h.2m��]Ï�<��ehO���g4�6W��kf<�,��A#���rp=j��ۿ�5�+y��_!G�x^W��Ve�@l(�� dc<���~T�m/�����4�m�6�Q���� ಘ�v�A'p�M�F�7�u �ϥ�f[h��4�`�îӌ��P��(��ѼaK#(a�$c#�{Б�݂�v�q���&H�)*���Jڕi��Mֳ�ys|HŮE*��o_oΛ�<tմz_Si�4rڤ���m�n���%�u$8�2Mm�+H��U%�?�I�$qڴWQ_�ΖQ4��$��[n
��n��9��Iz�b��0Drwf{I<�N���x��j=I4j�$��βN#>��6�@ 0���ML�����PI�2v��3����Jɯbl@�1�;F=�UD��/��C( ^�у��T�[%Y<��?��>�HQ� {xS�n�F�K�I3�)6cڸ<�B?��g��ʽ���0��tM���%��'��/2E�,|ZcrmE�;G7��gK7�z��hsN�0����+� N<����Y&�e�/�tw�(�ɭ�_ڢ-7��ΝfI��΁@�c�W��ڝ�G�9M+�>!�o%̩��1
��K�0+]tK�5���څ���� '�E)�Lk� �H
���=
z���u��f���v8����^W����{�����z�B$�"��xƟ*:��}*<O��CSM�W^��c�V�Y辚�d�ń3�q�,v�����*��e������>4u֏����-���񆑰y��^tqf�j��sm����~��m.m?��#�G�����X��8Ғ��f������	r�e�Б���I|���yUh�[� f���Uֵk��[B�6��$�߁ǵq�S���Ǎ�g�ރ�?g��n��t��C"򏌡�8�������Δ�h�M���]=�^�w���Y���/������璄4@@@@@�8`{�����C��R�5����΃;�$���+H��@�⹱�P�+��Єx�e\�`�>���F}�����N��,��e�ǟ�q���:�}�n/���X��c��6�݌��;}��K����j�J�ܦ�!q$w<�՟ָ�A���M~�JJ�s)�E4[�*ÿ�Q�
�K��4�	����8c�'��$B�� B?�kQ�'is&���w.Ud��%�9�H݆��JH�=�_����,+<ܓ�8�ѰFB�>�
��&�S[��ci�Ў5Q�E�T8 �ÿ֡��o[բ-�A/�I���5[݁n�i�Bn{w`� h�{��e�&�t�Ok��@�4q�f���� �sS^�swow��3D�9;c¾1��>�K��V��A�z}z^��u�������Ob7� \|��)��ˮ�2��ŵ��.�mpYǵ# �|����$���ѪF5�]s�Y�cT|v�x4 F(�"TB�X�Ĭ0T���m��p=����>����(����)�o(!G<2�_��%���Ny�F�s�`�Ź�������)@�䓒��<��x�b��q��1@@m�I�bY]�"m�1�U�8�$ДH-V&��ymXyL3�cf �� �[���1M��E���=��*^'�	��*�S�� ���p�L��2�6���U[�*������9I��Nq���~jR� k��γ(�&�����.N��8K���$��<��(��|�\�'�s���'�.-����	RdQ��0���G}�ݤ�钄I��<#��͉�9ϸ�5H�L��$��WC�Xz̱�g2��U9'*��hy��R��`ޣN���AY���3"�Q��H��py�o~�ο� ����,ً�~�p�<�k\�q-��bK�Хk(#T����9� Z�7��SL��C�97�'�r�����-έz��_i���c��^Ǐ��r�G�����l埰���t�Ɵב�C%ԑ�mww p�����qy+2��-����Y#8�;����B��Ů�gj���.#����	��yr���d���$�G�_�/�d�+���DizkV�ق�k)9��<�u8�\�q���9R��P��؛�� �?nu��LwZ���� ��[�������a���!8��k=#��o�I.gf]�Ĩ0;zq]�\T�sd\��;�zKZ�Դ�����݂�&8'���zm���	OQE��u�uMKX��GL��k\���0VOE��<|���e�ﳻ�8�ϛ��R��<qn��v�U����Ĵ�:��]Sh{w��ڠ��5�<��vn�V1x�� �:��mOBԎ���K̒��]�9�r>x�_v��*<��v��ϳ�Z�f����L^n纷O26Ry���3Zg�=œ���/�n_����N!��U��'��|���k�u��4r_�F�� ��T���-�ZWP��YF �^�5��g�)�,�	8���` (�(�(�(�(H��Tc$㓁@_�ݝ�/������H�h�#>涋�nʲ�t^����}�@�Q�K&�����.[�B�C@,�d��%�x� � #����I�4�l�u=6��d����p�0N?�=�޴��:�X����U�Ŵ�$Xa�p���T&���%�� t� 7R��U�!k32�$NÏ���T"�l��]SW��(qDL�u����r�ҴU-���k���/b�(�#�lAl,s�#�ұ��j<�(U���ۜa�3�5Rh���]���y�]wXw�(	#�A
3����$�l�HLXy8�� Z���cU�Ԯ!K�2F��~Sr}}�ڦR�@l���V^;r�v>�@e���G�N�0@K�o�m��H�� V]>�ˁ�%Y8,�}M^�^��ݯݯ�ȓylP��=EU��5�ƈʸ\�B�y�>� ׻�΀��c%�*1��ʂO��J�� $ � sR��t��D$�p�����8����7�<�:��E�	S�g��Ԁ�t��j%h����&�����T(��IF��^�6Gp�m�l��YOӰ��o�� "�����[�c�Q:��13yR���G�Q�ظ��J�vܼ�Ҩt@w��P>A���tF���E�[�s��w������yӝ����s+Ie(�2I�A�����H��u�`�����I1�
��p}k?TY-o����;d�7��y	$�P�0W��Z�R^�ho����h��i3>]�n|獎 8����d���Q���ݸ��9�����a��jw0<�k����F�|\6x��M��څ��b�֒wc�vvn;�*SR���#HndE,Ȍ@޻IǸ��2�bg+�S�o8�f��ax%��O��ҷ�Z=B0̬Y6����ʹc���u4ϻ:M��4�Y�����x��xb���r4�W1�j��AQ�8�?:�K��ʩTf|�� ��_��V?����F�+� ��~��mG�8����M�~_��ޠ�$=;�Qt��Wz&�y�\ł�A)ݑ��J��Y6��d������ �:��^�X.<��w���$�8�+XJP�&Ss�+�����-�Q�v:e�3�w2G��U�E6^1r�H�;��
�~h];gv��X$E��nی����ŊY$����_$����;�eN���mo�~ �5�T���Z�xI�9�挵aҞtwD�}D��,�G''߽['��O�֐ïxaq�Iqkqy�g�1�${�xIU0��%���InP�J�?/�rIO�e����N���[ۄq�q��Â�R��͝�Q$����T�zk�����kH�c��� U��2?E��\�̶���`�j�mT�>d�����O���K�[K���(�i�N�G>E�Y�W�/:���������{K�X�r>\����qh���BB� P P PS��f��)����Ci���4fGkl�q�pO5�����?fF<K���H�����y�r�1��5Y;�z!�K�Q3�R���H�=�;�F�-�����Q���K{�5�4�� c5���mZ�+�b6�,����}*��#�H�ƙ�L��[�JR�Io�l��+(����ZCP���6�7��o������T��.��<s�M��W�f�_aΰ��!���X�w�>�38�k�${z�E'ۢ�YL� ����y�:sT� ��0z��sڡŧL����UΟj�r�P���q�{��ug�X�ҳ懠�kV�$+n#�³��7�� �3ǯү�`Y�j/�E��J�K4WqbU*p a�|� *�+�+�i���ԙ�;�m��Kh��F-���#�A���&�SCr��o�;K�2�ުI�e*��*Ð�q��O�[�kF�P�{y�a[�ώ�܎{ՒOd6�c���5RO4@{�'��M��� =q�=N"��@Y���d 6>x�=¥$(BT����ڥh�o�7�NB������O���.�J!\��n��q����Sb���F���<�uh���)8���|b��N�Y���.o�NdY�aT�B=*��,�Z��Ј��7�D��w��7|~ur�5Oz�1@@�O:b�o"�z������o���WLџ�7�y�Ƒˀ7=�}�ps� �܋�s�ܟ2��\���<����w�ͤM�&�4fD�7��*�Tg#��ǭQ?DH��ŏ��8f̌ q��F��n��2�^D�Mf������ޣ��y!��t)v&���a��s�?�-$�\r�oK*f �Q$���nڡ=���6��D��#a��N}y�`н�}j m'8ǵ �J�^����:>˔!�}g ��D�i��u$ϼ��k�t�v9��6,���3�\_�=!\�{��j�-?O��V�fBI�&�(��L���ų෎=m/��,�N�,�`����A������\��/C���by����
�Q4Ҥh7;��=��@}T����n���;����/���5�����`�>�:��6���qXc���;z$
�i��5���=�r���1��� ���,���0E�(�9��ԉO���n�o�BH_��`^��?N����
�@ �����s�ѮA�Fs�*&~��{�o�q�N<n���Ӭ,-�]G@s�C,���z�������q�_fS�Zg�zЃd0�īJ^F죹��6Z\A���n��R�Lz��Ԁ�@@@m�_2x�,� ��'�(�K���K{|x�A�m ���k���!�L�z�Lu��P��#$����\q�;Oj�/}2=D�mz�Y.7�-#b|G�.+5�b}�]g$p߇}?ba�C�0�G��;V��Z�����[U�?*�K�{�� n*x'՛�����T49kom��JD[{KYf, ���Krl��g�7��gBԺ�j���{*Jb��Ш�C8���z�iM>&�:/.��H�i�5��Z�ב,��h[����R��}�=9�:έ��zOQ�Z]��tn;�L�j�}��(�k�7wc����ڌc�7;g��1���G5-s�����;{).a�Ik$b1���88���1G��f:J��[}��#n��oc�0lz~�|蚡D:���$L.G�� �׸��	�+��l�K0�N=9�v�<ѴFR������#׏�Q@��dpĳs���mߵ@>4�"1K�I ̊�T�[?όsۚ����s��[\"��lBcj��]�~���G��H�P�)��9m��^*�`.�҅ӂ���	hU�H= �'�Y-�j�u��+J���� �*����� z���b;8%��%�#�\871�=>/ATI�'�R�X�V���g��3��֬m���UD;��j�X�?.i��M�p���fP���>�����TU���G�i�B�B�`*"�B�=��'ʧKM�nݑ(�����Q�@ H/O������J˥cm��wW>dp� �M���J���`�N8 � P P-�A�@�����'1N	bF�s]1�vS����^��\><���yR!�A�5�1�2K2ٷ�����UR8�����ɡ�J�'��
�i;[���`�J�rI�1��1@y���y^P��)"%$Q�7�"������'��Ҫ�h�B]T�<#?�z���`�0s����2L�121f'$����ϰ�W������ ���W���z���#$}�zS|��F� ���ï z�[{���Q;v$3�'���z�����S���I�Mv��4���,� =�>� �A����WIj�(ym�A��>�����-4��������ޓ���e��Hb��_Č=Q��#�ncp��X�;��}�� ���gď	-�n�D��@� ��������J�k_�zJxS]�ί�)�s�O�v+9���XӾ>Ur�����*�OA��Ϧ})�!�����jsZ��<���⹹q�8>6�0ʜ�0���{�q�;ԅ�Z���?�՞U'�)�5�ǚ��{-Uʉ��I�Zu�{�^F�Z�D�H�2e��&�+�IG��|���I�#�_��^ep�w,ag�P����R��.�� @⠓q�� �
 �
 ��bsԚTDd=�JFq��T��ng� ��&����s���q��V�P#�6�WM����#���H��(s���kHz��t�t��^]�#�v�TGn� ��)�а��)o����,Fxa� �!)!>�cWJӲ�>�-��%�����~��y7 g;p� ��N�d���Y]�U��k5��e��/EpSo3P�%�?h��׵8���rEڡ�!,`��1�})��*�ѷC����I��a{Éo�� 9����ڬ�Z:7�u��M*��+���~q|��ϱ�UZT�K��i}/C��H?d2ú�4����y�l��*_I��-���f�����yq�>�VX���O4��uS�c���Q`�M$���P#�s�P	Ct6�����t��{�V���u��/|�~C4�wV� :O@�n5N���57�m��	�r�vⴭ]�cW��
�xW��r�ku��U��I#,�G Lѥ��H�b���s�7d��`P�#o ��9㚮�a}�Ha����D���(�2�䏕_�E�o#{��b�C��o����{/�ӢY��f���z��~�k�S�5t�@����Io�����A�#���]6��cU���� O5�e�� }���Ȭ�Ѳl[e���cQ9A�,�|� �S��6��/VE�ݩ[	%e2�� 9I�ɔ�2;f��g�#vxZU.�x�v�=��۟z�{&6��48ZI$��3��\C��Aa�9���;)��4mb�0@Wn�Kf#�����+7V�k�)#��_
�F ��X��V%���;�m�s�� �@@f��K4�AӶ/!�Xď7�s	U`��H9��]Q(��_y�Ipkec#1�|�b\d=����K l��e�������l.��� NGps��6�C}�"=@E(��1 �?�QU�Z���-
� �H�G�B)���~u�^���Cu����"Ir.>m�#w�{UR$Y,�M���1D�f��G�ɫR@K�9���F �9KFǸ zU��\�V^���&BNx$��d����
�� �1���^���++�^���G���NJ���WՂ��?�R��Im�zr�K%̊U ���S�v��2i��>{�YQ�z��;�l5����䳔J��k�6#�
��$�)�vu%��L�E6&��Dд�hx�f��X,/�d�J]��:��u��mK_ե�Z��qq"���{�zWIT�iU,p;�[� �.�#�8�o9�X7V��^g���Yc�_�:�y&�7ꏰ�̳8
����j���H�M-�6c��/N��� 6�o�A`U���>��h��$�2]�;��}�v_�6�����=��A�+�>^�b(��!�� sT�O-"ƛ�8��IҰ���JԛR�̪�%Gœ��W,�5���8|�C��c�8����|�� �g����$YF �����	��a���RR��z���qΗ�f��^��6�Mg#&�a� �d��z�YTr|��9D���ɘ�BG}=tX�ė�]�Ny� P�>E���*:]�u�+��t�6X��\��A��T�
 �%���S�F���Y����v�ר:sR�
�����IQ\��s]+J�ez)_,�F8��\"�9�L�q�8"���@��?S��kjC�qo YVx�-#s���TJ��G��N�s�fܤ�Ѯ� `=��q���;n�'H���a���t�&�nfo4�:H �5V��hl��Sle��@rP¢A��,���"�%;�����2��%Xg��� ���lC�dE����{|�h�]W���Lp^����%H#�ww����K���w{w4�',d��������J�U7F
�*��r��=�}*����]B�V,dV���&,��e�R������ɧ�t�f���e��׶��c?:�"G��~���ho5K�.�݃E�o�v��?J���"��N�X�i�&�yX� ����'�dRf���7�YA����*|�S�F[�H�Zi�a4��#*�c�܏~ÿ����\�.��\����ګb�Pk7�V)
��������U��z�֮,�/l�݌�ʡ�g��Qmt(���;��G1i�l��SSlQ��X��E3���M�B�\�c�Xz��B��mNi�����0ݴza�5[b������#ka�#�,n���d�E�,ZI`|��g!�#���a*��(�Z��ͥ�O�3��d
ba� e���t씬kfi�Y�0Ĝlo�p���Ω��af��v��*\�$�X�u��Q�U�Av3� P P-:u����2�I$���HY7s�{���D3M���H#r��i��ݐq�3�Edm!/{��G�7E���R1��㹨��Pi�-�������9\0ノj�'L����P.&��V�A\gd��{���Hu�ڊb�X����豏����V����H����ko"�$�Xq�c=��Zd�����`����G�Y=챦���NA��1@��� ��T��R�m d��9���1��^�V�/�z^+�I��קּU��ug���h�G<?� Q^����	�Sm�]E���� �
�z��:�O���\�N�.F23T�T���K'�������=��}��q��$�0+;#��s�k� �NW�O'�. ����s^��G��P#���}j;,�vlR{���'���W=��'>=��}	.u8m�p_sm���\�Β�mR}��b##����ղȜyz8n�cm�T閰�$�Hx5�� �4X�tC�G�
�O��@�:���FS��i��TG'<�^���m�gι���D���IRKp��n�c��U�9c�����u(&�h������]�$+�/,|S��Z��CC}n��Q���qZc����2ȯ�&��=c{����Ek�����enʇ�l��g��)G�m��������Lt�O����� ��~������?�pOroΧƔ���jR�F�a�P P P2����I!�팮���ޥ�nmVi�ª�?�O���Sw�U�7�.�zŔ�)n|�-l�k�' �����l�7i��+G%ˇx� �	W9�����*����f��.��y�m�2�k0�"
������*:V?�-��i��J�I4�8�q�)���J�ب�mq4OhӀ��Øfs�T$�0"���%��͎P7���� 쥻:%�"m}�#`�Y�Ao`}��Td�bF�#c��w�q��o�Jg'��F�ۿ��O��#b[��p*�X��@=a�¿����ڥ3���$>o=�=�qPq��J� 8��^{�;-O��紻Ӗ���q�Z�UU1�T���Sa�G��]�U���,�@G��<�#�8 sǽ+��������J뮻��Ғ�e�
 c��N]QE~�_�������Ă\�is�� 6��S;��(f��i@r�cS��� ���Y�bI���c���6�Y5�_6�@� ?���z��W���G�AFgW!��x���Ɖ"��2��8�UH5��I��@,�殺��f6�\Ԯ�&׶�Xo��s�t<�U���s����K��j�Q[t���T���2�e'l�T)գ֮��+�Bi�,��-�i��Q�@' Q�[�$�e��@��9��9m�,����[?ƪH9e=����S��2	5�
"���I���4�/�aږA��7�p�������R@�@�p9>�+�`{�=EV�\��y�;����m��-��̎i�$XC�ʫ�
'����*E���$���<���iR�[wbcnGά�;d����o�(�w(��q�O��%��d�4U	
 �3��u
H8��Iz�����J�:y��{)2}F�>3\>^%�F	�l���d�.��5�Y���n2�'���b�"�)�X�Xܵ�]y����a����&�����@u���]_���4+7?xx��M�c���9�;��T�;|y7qg����7U�hY�8$�9�q��8>i���⾒x:�����e'��>�W�mQ4l�#h��8�>B�?4{�0���9�O���&��m� PiW�r·���xls���y�Iq�c&T]w����h���xH!6��γ�V��7m�� �7�N�E4`/�� �3�ժ�I�&�����¾��o����+��'�Z���Eцd���@��Lvz�Ǉ����+�v�/�2��ֺ��jY��`����w	%0>���U_I�O�f`H`�Sدs���N|=!׺7��lE#ԘAvPm:�d{�G�^�9s��C��d��> x�����t���2�TN�PG�Y��ǧ 
�(�N^�ғ�Y�� P P P� 	�0���7��m��έJ~�{�d�ƬIa������M�*�g<���/R�x��K���^=����t	���5}gP�[�O���&o���d�l�RS���:��.�:l�D	o�<3�a��h�N,r�Oq:�,���>L��轿*�{��Mf}:�'��8�dPn��!�p����2�r۬�kj�n h����������F�b�h���G4&���� �?�ҩd�]P�7Bާ8��b�r��U@�E 0]���Q`���re��'q.pI�;�m��I;�]��(]��*�<d��E�T֏e;	1��)�~���P4�$\���v��a����Pj�Ul���b>���R��I�#���� 2�m���2�=��@��4�ωO����4���' z��2(� RL�>Y%�ݰ�}�v�BOV���Y�fo)���S�����J�R�{oޔ��3 '����PJ��9$��P�
 �3����]A�h�,��� ���b*	��'���eD̯<��(��X�ˎ˪��q`�,��RH�@AC��[��*oTȭ��U$(�(	R��=���3G,��:�*����U��m��g�M�O?�d9g�%o��|՛t�$,�u&,�<�+
�3�e��b��8�A�d=�8"��[ГC
7��>tA��q�*�ɱ5���nV[q,�=�; �Lf�dm$2�9"�Y?v�a�#��	����E�#�b�]a�@%�b� �<b�K��ȰP�F
�X�E4�(��R��d��c@y'#�BM�W�:t�[Y��R���l�0��A�C\�УE��O����J��u���L�!V��D$�bA�\�R�����V G�>��>\��\Z%~}������N��C�R$��x�;�d��X���1�M��>���q�~�г��������I�;��=��q���5���%<l�� �� u^�����!{w'>d$�'>���]���A(��x{�StOZ�����w!�{��~��Xs��xK��>�h�V� �W�M���aVp����s_3���/C�O�D�Gѵkn'�h���]��5�97f��;���ݪGs�ɸ������R���x�����&&�I��W�^���[�Wњv$>4CdwR4ιm��ڜS�w4����>Z�h��in ��8���U��V̛�����+�:����4�2�*��'���Ҵ��V��v�G�K�k]ᆣ�cٍ#���0f�y�����I�Y����
�����H�,�D�	�_s�o�v�����Lo�����oYA�=�k1��s����~F��ON/�ue[��Lar9$�zs[� ڇ�X�`�g�z}����2ڒ�+2�ɏ�WF	T���&՟�l�ӯ'��C��H�������j��vh�@@@��� �4b $M�A<��Q$���P�c�(�H`��R�}g9����q"4b 6�Ѿ�w�}ʳ�7�B�t]"+�k{��K���������jWԩ���/[�ZT0��U)����l������D�Btm;6�F��YAܮT�<�������mfh纇ȗN*��&S4L}G#<� :�KM!���y� y�E��U;�G'�|'�>U���%p¥���?��j��� FU��o#v����4n���p�aܜ��T�C6��0��0��nY�|߄n@o�嚔io
�*�U>WA������\]4�T+7d]��Ǡ�@h�$����� J�1PAb�ؑ�4�3(B���N��'>��o;U�� ����P��ʭn�t;5�:bH&��uSm����
���Z4��+c%܊�.3�CnL�²��J�@@=Y�F�%Vo�r�(A9�S����k4HT��
 �
U�s�<q�V�%�4F����&cm�HUo���涋UL�!�l#(�y�݉h\:ٷ�ێW�ަK[�� [o����!y&$I=��28 7Ğ��VQ���ݯk	j�hq��
�D둏�Os���*$�'��0i�2j��ȐܕT[�C ������j���_~ �򦔦�T�����,�������:�%�ی����كdcp�T�+avC��1\Ȅ�H?� )�/�}�X�U��
W�~� �� }x��i�jVVp���R�"C cדP�m��ri#�O�e����[k����o���[��9r�w'Ҹ�{�u�1M$���|?�}w�K�,l&ih-�� Ue�rԘk��!F(>���N2��=����]W�D�ic�^�A#�ϓ>$X�{0N=*�O%�_���,����]�:_\Z���)<J��ʥ{�w�j��w�k��px��g���]���u��J�c
)V��zz׸��4y� ��9t�(lb�1��>����������-�ƿ�P�B��9���|����h�qI|�t�Ek��C��7VXZE_��n ��s�p�^��Eȱ[I�U��ު9��C�s��;�\Z<�u.���8��Ȋv����;��O$d8u82A��4��jUb]n�#�ȉbWv��߽_\j$FM�dN�K�u`�U(pO���5�\�����p��M��})cL�er���{��ױ�ET����p��4�jV�	o8�5�>�u����9�W�:m�M]�<�a[���*{2�=�Ӑ�iq;؆@~X����Fy�7�@9\z�*���=�>.���+}�u�����cQ�D�n�c� ������*G,}Q�uT\*@P P P�~.��иE�m��p=�tQ����m3��$\���g�<��R�Vs�:�:�T�\�%�ʳ*���=�	��V2q�2mto�.tx��Th-����?_��մ�-�?n��o��Օ�Ho|n�HPs�R���d���孪K��]�cHF��ϯ�T']5��(�v�Զ�/?{z�-�����DF2� o.O���c��U���V�Q*��!�s늩&^T� �F��c p�X4�2,���2 >�ߝ@2˵��s�&��&R�q��b�};P��1؞q�M�(�l�����@��g0���<���@k+�� 8'=���zn�aհT��`;��[�^<��-͈n�s+�x9�y?ʬ�*/�/�E�D�CyF3�e�
���W��\��l۩��uu$�y�a��. (���rjӟ'a"#v�K�X�,O���W;�4� �
 �
 �
 d@����1@@(�QE[�+Ŀ|v| ���K�G޷��!��9.�-V(CM�i��F���ާM��Ԑ�Ip�T}ټ���ݔn�>�o�D�7��,�����c�,��\����oT��b��[����\��jw�=���id�V��EH�P(���n䷹Z�W��f��5. Y"����o�cێFݿJ.�}��f�!qŜ���1�����ⱒ��q����2}��Y�0�����d�`c ���PG�CÝg�_�y��9n-�˄��
�Q{�Ԛ�#J.��gF�r�>���^��E�떗+��$�LC'��^L��`�n*K�l�dn�?�3���
�@����@f�^d��|�iպ�M��Y����70&�C� ���e75�
��q�Sբ��G\Լ!���Yk�K[���!GO��"�zd~u��#R����+)Ϗ���?o.���m4^��a��.�mҞ?
�(�u�� ��-�)��۩j�������S^��ۤ��B��ܓ]ޔs����� T>�Zv}0� ���]xZ&��́T�VRs�'����K��g��V+:ϥG��W+wk�r䈆�qߏҸ�j3Vko���k��圌��Wrt�����ԀM⮑�j���n.4���'�"�P@�I����(�RT��m	�W�Κ�BK]6�R�6��̊Or��+�+�~����j/D�4�L���*�J�fm��f>��y��c�V�͕U�\}N^�txq⇄W��[����Jom�?;�� �s�w��q���9s'*��gC��z���-�k�8��(Kn�1�W|�ZfQNOGׯ�� �Z�M�Qk�A���18�U?���y2�\�Eό8�Hp��8�s�r���Ϙۀ!Nq��s��h�0�ϛ_�b���BjATH��@�;�����ᚔ&�r4|��I
 �
 �
 ��wU�E����q(<���t>�ҟ�,��~�W���� S�{��ȕ����>B���h��K���|���S���k;Xud�{��}y�??�V��JFOoDg��w��1���k���ŵ�ǧ��vJtA���!~��ǟ9vK��}9�wA�d��hm�a2+���=��̰�Y���9Y%NH����� Wױ�U%D�����+HӪ�����ɴ~�����'d�5�-�T(���)�r}�BD�����/gyY��
	�ُ��?Z��*�4���y-m���2��~��X~�Y6�,7g�(@*7^��U$�]�T�<�7�@	��-��NW=�
 ��D㌌�Þ;}(r���Wk H-�|����y��y���C�q���qK���(�e���Ϧ=�@���Sn{{s�z|Ⱦ`�ʯȭ	.���T���Þ���F�JIk��d�Dxbe��L��U�VH�{�`� P P P P P P�]�P�t�41I�JSδ�(=�'b?�t�6��ŗZ4�䅣xn$0��`�6g�/�gެ��GF�3E�ӡ��Y�6����g#��?Z�"z������K�\Fe9�z`��XN2Oeӳ։J������� �c� Fr=Gl�c��d�W��ۥ�!���s�嘂Jz�Wdҫ�4�z����53D�[<�M�22�z�AZ�]]���.IY%�Ye]跩�̤m�>/M웢qo%��C*�3��A�����g�V&V1F��G�*��H��Xő��}ր���&�>��a6��-�W�,9��ذ����>l1��[7�>>�i�&ZˣYC�:|Cr��v�y��q�q�����Ǹ��d�Bm)-��u�����Ewӷ�25����o� p�ʺ!���5�Q�Òԙ�7���o :�����k��0�:��U���ȩ���O�bmK�vU�_����Ӫ<F�֭l �tR%�]=~2 �Xo����)��rFR�޽
*����(��gm-��p���UMM^�7�}��!�M7J�-�[j,V��t��F{^�ϖN]���]�����t��(R�I%�~/��Q��R}�\J�ϵ2�sb�3B��S)"���`�4n;ε�	M?��d~�>Uu�Yu\�y{�7����J.^��r�9�x��n+�⫏��9?	�� `���<T�#S�u���P�H�K�#wP ]�+��Ҍcz^#_S>�[L�B����U��e�k[p&iW�r0	��Y�Wd�\�zr]���5���ʶ����H��:��K�:��N�MR�o9Q���$|EW�'&���Ji$N<J�R-�{A��ګj=��D�z�ӧl����TP@���+�S����i���㮑��9}�Z���t�m�,���N6���c�s�R����c��7>�_i(~нY���g5�����j�?�df?���p8��Í�y��&Pu�@@@�F�kV��|�]��DҾ3�2j>ğ@��i���N�2i�
�֊?ȇ-�����y�u=��Ks߭�4��rp� N�f�H�Df+M"���E�#+�l����1P�E��j�����umq�C�j�Y��F��5f��"�y4�0_x�_��(�"�@�>D����U��OG�SFVK���1ߩF%�w���j�B��e6 �f$>lGi��³,8h�ž��s[�wF�X<c'���7Dvx�_��5�o�ذ�$��=��T�1�{��m�o�B�U}x�e'q|Yn�z� �1����0��C񵳌P�F�A�7��/z�P�x?�Ԡa��@�?���� g�M�G�f[d�2��C�>��ږm#Ʀ!!1�Vʚ�����2��w����9��-�O�جm�4�˴�4d���B��DUR�B�(�(�(�(�(��ޙ�Kh��)�ʨ��ϒ8�޵��FoC̷J��O2
��գ*Fŉ�������L�7]Nְ��.�����@`2*Ԗ�� `2ut0�iv�<&9)Z�%����}W�³ȣJ�.�'�m�/<�*ֲ��G����UcVCd��}���H"���c���?/Z�N����"��k+;1@V�1�b���}i� FOc��>��a��*J��bl?��t��]�YQkP���2"ĩ����Lzc�+�]� ���;Q�Nԭ�,�C"ʾ`�,FJU��l���Uϫ�~c�u�8F.4��������+Ɨ��E�юE$�.���m���x�;vL����o�^/'Ѥ���j�'�'��.��ԯ�X���y5��ƒg�9)J��
�In9P������	B�Ae�G$�'T�/����G�e��gb?Ŀ\�:��x?'��-����+G�b00;��ι�˄w�t��˓�>��:|:u�Pā4
�=�^|1�)h���&2x�.�����rֺ�[9�X�3x��V(��&r�n1>.���uZj�}]=֩��h���p^��B�G��u�8��:���G7XXt�zΩfc0��Y�w+����YM�;n��jK���A�xQ�ך}���Gk����A�/�p{���\���$� :qJ]Y�s�O����aX.��H��;c� w W��Ph��R'�q]���*����QMݘ�l�^�}5a�0{lnb����\H�J܊��r�~�h#�� �f�9��U�����;:�ƶ������+|*=9��d����*)T���P,����2�%T��^>���\U��VR�E���Ѻ�E����^[J�҈ˣ P��u,����\\��8��׫�n~�Lj�܄�Ke&ྦྷ�j�%�b[sG�?D3j�M�}%��i5��X��u���>���H�U���	*�EZ^�q��V���]]J�Ą�s�����'%�7��-�IE.�~��u��Ԓ,},�RS	���,89���w��ryU��;�� �ө}��Y�q����I�qc$�p�/�+X|c���ʙ�����F���0x���=ƫ���վ�fW�Ybu
9$mbN=�|�2�GD��)?.;���+�9����᧌����~^9�_.)�]�s�Ǹ��kk�E:� �l�H�Xy�>���]��Ppr$s��'�!ꨨ�V)��*���@G�Ul�h��%e�GR�a����j�D��4"� K�I zn��(ɿsh Wt��>[ �=@��(�޵�2,`��S��3ꦖI�K�Eg8�a�I_�@�hk��n�Y�7�l8�$�<U�"�E��(ڇj�*e�z�a�}h�<�� .Z2I\��q�?:��ŕt�{(�!dh]\�>���c�n*�CbO�JZs��c.Pch>�I�	+��>�5 ��-��M#ª<���&�8#�{՞�%���ݐ֪D~_�n3�sϡ?* ܾq/���v��PF��hm�)TFcG+�Q�� :���3���[��72�>ܔ�};������ZeP P P P P Pٔ���0�[=�(=�bѦ�y���&����F��֐z!�i5ޘ�ym�e��?y�|�y�>��m�Q�h�ۼ��+�W�>t_�Z3�T��С�S��6�c%����b�D��џ\�e$�7�Ηv�Gwp��op��$7�U�����fw14� ����`�� �T�����͕�[�$hr�ܡ����� }hۍ/�o��I���.`�-XK�d�O zҭ���� �G�2F���A��O�5�.�7U	
$�F3� gҀ��(HP���c��H��l209�>��H��ʹF�I�UF���>�<H.O���W~(u'ݶD,B��\:�b�{�Uu��iK�>�xU��9�]�.��A��s{��{�z�*rx�%\�sq�E�'�7j0��d�O^D<�z	�n��].vx�f(HB	�c�i���T|���YԬzϫ즳�N��m�x�M���'*�?׽T��캴�h�������L�/��ro�ܑ�pG�o8G$i���{뎻��C�9��fq5쾪0zHAB<Q���u��k�k�E��G�[@e�!,����<W.|1�Ԏ�d���:J��-��ts�D�5d�cY�Ɗq�~[sϸ�q~�&��_�Y��"��ϴ�\��=�P�D��Xbg�'�w �� J�>,{��.�=)�e�Z:]\O���4f@Ɯ�۽kQs��:[u5+�-y�Oq�DJ�e�a�6��5ҼU->�,��Kao����K	X-��p�`Ƿ�+��������%{=/�ō5�;�/�=mB&��亽¥ʢ*�o�� l�_+���~?���x����3� �ţ�4M�_�]^�m�4׷��\yn����ߊ�ˏ��x�[���tvb�(�9?��}�x���������n#�	L��'�~��~/��_��|���9��Q鲥�\�$��yӃ�9�m�����\�W� FE� �����u�Ϩ}m��Ox_g����W������Cs,Ʊ��y� z��;�? ~w7�����s��A��c�-�&�� O��6��'{�C"��
yD�K�ϯ#���~�����j'�?�����f���Lx�Ꮏy��-�v��*jl$�a,A��� N�>�<K��w�c����)��h��ʪHF܃�lc#����ŠP�p��B~0cl���zzhW3i�]A�u9cl89� ���U�Z�E�({��J�pU�3�ۊ���;������ $5@6<Q��+,ᱰ�R�G�@b9 'j�6w��zÂɻrNI�O��(Vz{�G�Onc� G9���O�JV�6�pj�t#��FI�/¡���8��:�iQQ���X"�"A_�w���T�%�y��l����]�a�*��������OVTH�M�s��IV�L�.b���[�;�D��7�V�T�O��b��$גyn�� y�{���[�e�x#*�.)V��PU��~��z�q�k�|�w���K4���F�]�'�52[�ӷ��8Ȫ{��M� %��8=�����o�Fo��t�\��EY�%Tf*P������ ���5� �
 �
 �
 �
 �
=�P�[�.�h�H^�(�p7�^l8�/���tC��O�[V-+3ɤ˹Of6�ޯu��[�Ǩ2^C\N����3dcv�'�j��;_�.��o����,�a^%��x>��5�M�˭kWQ��m�!u8�.s�W_N}kT�O�*>O�,6 ��(B|�\`���)/j� a��cuq�X��ILFM:O1J��,�����BW���6�_]I$�	%�l�y�_|U��D��D���U'�d� �p��r*���9�K�
 �
 �
 �]f���R�ͪ�<�|�>���5�Z���Zf\!B�����C����n��~xAe�E��GB�\Ku+1'��������K�ٷ]˳�	�?w��������iT�-��v�$��z�L��ۯ<��C$�����o#���H~-��g���������
09�8��r�Ӧu�q�̚��:S���<��$����'�㰮�����rz��Ծt���K��Dlwq��lT|�G�~����Z��������g�}�@�T7 q���9.��*/l����Mj=��!�>&89_c�A�VK&�z��,~��kM"��E�� �7�a���ejr(�qh�C�Ai�mj��/��]��혫}��d],�P���x��R��.-%Ĉ�Ŗ�/L]��HE�jK��?P=O�������==��[h����ZK��m%�R�$����=?:��d�䷃U�]����`��{�E���ϩI�Y�4�0���%��	'����8�Gj����y){��Fyd��(:��
� �J�����j�Ѓ' c��ް���7�� clN�G�:��צ��.�9����]ܤ����Ͽj�/������5�&���n	eS��q���=��N����O��uҿg.��u�8f���t�d1�0�x5���r�/��c�m���'�d���_¿A_�z��Ѓdn�`g����T��:z���d,�s��Xg]��F�����EH��:tVZ���X"hIo�7r���Rd�"��X;X��\}+2A3�yk񁜡���(�Nܶ;�lz��k}9��a�`�
�8��� njހōطI"�1�?/m�d+��!�?Z/`H�+��hê���$P��O#���~�u��$�,��u�-���\(#�%=���?��`��i��Yuȣv��nN�r~���Q:v(E.��κ�uVg	�_|3ƛpp݇=�_Z7lPi��:���V�5��H.%H?�) ��K�Zl���i�&�Xw5��bP�aˆ'�� �Q���dKW�7S�|�;kYU�ҝ�
{
�����N3�����nF S�@aݜ�Ĝ Np(@9�s�@{�x���9�5P P P P P P�ހ����:2�>��پ%y%���tCy?|bP�s+��N�����٘��YR�uۉ��p�&h�)
C� ��\T7T�Ȓn4�/�����;��A|���?��Up�S.;[�mCK�H���H�s���5��HC��w�X� x�#�0$)�I���k[D�3�H��#�D�Uy~�:�<����������]f��-eX�F	8K��g\g5��� 0�>��6
b���yF%��!"�<��j���!�j (�(�(�q����-��@�7a��d��x@��T�ݾRt�=|Ȗo�� ����dۓI��Y�։F�+�r_�y�Һ-�G5
Q��m� FFI��6Y=� c"p0O�Cq*'i\+x�%��湳G����Gn������F��H!Qs�b���^��.�^�Mjͦ�]���ul�#�Vt�vmm4��'B�g�A��3&�0�s�B��h�N�B��V��%3��[F�O¹�h'fwѳ�<:��⻸�bu���>���/�h��q�>�H��Җ�[���)(�G8���'+�Fn���� �����f��@D��2�o�޴�5ƤW滱�G�C.�ԣK���!0�6�>�y�i\��?��u\��^uՎ��Ac`�����R�g=�|?���\~/�q�o����|'~[��{��E<S�Lu�O����e����@He?ƾ��rH���s�R�߭����>/9jD{�~�zO�׶ڦ�u����˜���e�� v��޻1��e��/gva?��So�������>i�	u������t��-ĉ?/ne�n����|7�~~�J��<O'��8���X�=#�lN�R>�ޕz���ס���.�说χ6���e�R��wӺ��k��~�����5�^�����K������J����3��v����h��!�@�vܾ�|�j�'ƾ%4���V>����E���[J�m~����i/$���6c��w�*p�1�^��>�2^O��������GW����#��� ��ir\h*�F�z��TFN���۞�֊,Yd�̓/N� 2�џ�P V�Xzw�ڴ߹R��5%� F���bOp=8��KTJ!Q� yR���-Y�l?�Օ��|eԐ��o�[if�� �F���9�3!�B�UB���$��J�n@W�n���pp	_j�
�.�dܠ�.�kG���6q���R���$ʗ���,�r���O�<{��H�G9l��*F9>�T�*��#��h�V_�I�K�<%�+8��(��y {s�FV/��,�	�Z<n���ֈ�rX����1�<����� H�9�@`�@e�uu%YNA����˗��99-�dу]@
 �
 �
 �
 �
 �
 �@�tµ΁q�nE°A/�(%HX�~����Ů��I��VT��[�;��w�j�M���t��	s\�X��QA5�L` ��֮��Q�Pӌ6���A
.-�{o\���U*-Zz-/���<�Y-��� �t�#��3�*k���� %G]im8��2��~�u9�#ӟj��{��I墘�.���d� �k�oJ;�� ]~�r��Y���(����������<g�U�̊�m�-���dH�� L�dg�s��|��D�W9p�@@@��-&�^�-���l�(��+��P�/z>��]���V6α7��W��S��m��ܩz�Ԁq1 ��qȭޝ�kf�c
U⏌eH�h�`L&��wg�Nx{� ��f�^�]��iQ��V<���sVrWK������z�K/��� 9V�85�眥7�i&m66V�,:|sLt`���H�"N>��$��76)�[�Qk$|�6�A��kH�����ݦ1�7+:,�0��?1[�p�WN���cdO_���F��	da��w�Uڒ���&�#�:�ĝEA�[�X������s���_R]�rm�����|$��e�=Ie��8Q�MOr�l�|6��S_�j�7���r�>^��y"�Qn:��[���J�,��6k{�8����fG`1���r��0�<�Ru[6�l��	Q!����[i,��N)n��q=Ԍ�}�g
Mq��n�8��ƫ6G�[9���o־i����պ���pJ<P^:"m#��s��Q���RǍ/�f���&p&���=E|o5[��F쀦{��W vbMuF*
���rv݈*����{��-����&��9WC����*����(��{�u+l���\���B��������X~�Ը+.�)*��%[��S�F*A�,y��F��Zt�{X-'���̈́W F�N�|�r6���?�t>����h,�>� �/o�#���#����l�]\-����ph}A'���g;Od�5Y�l*� Bq� 01�@{�|�w9';,	���P���3�����2ry��g�5d�ܮ!���8݁$d�����l�,���Ar�����M4f6`���nY!�j�֨�����j�k���n(Z	C�I����Cg�4���vRע6\Ijܨ#�����)�Y�����\$�ub�Nb�=��Ƕj�*�ō����$g<�'��TRp��r2?� 1eO`��{����:C2H�*�c�s@y00��p��V8 �z����hR��FGqP@@@@@@���� �#��nћ�����a}ѫH~�13�5��G�\��Ü|5��V@����"��9 �_���1����W��J.���w^|�Pyɶ7'1����K��Y렙����ԈDne� ��A<��<֖���Wf�}&���d�0�x�(����'��mӢ�hb��$��Ē[� m��\@wz�ݪ�⾯ע�|.�|�6�&1��o�ǀ2IS�gґW���H��G�dO#��O�����V2�"B��@@@@u��w�Tע����΄�T�#�5�E)4��b�6}��Y#�҄�������ߩ��p|�2�[��zպ%lP�Gl�p�9�N=��h:�3#ە`_i<�8�l
��!,`�%o��w,�!���x[�5n�D�V�-'�zZy��b��_�vpX����|w�{�i���~#�&��I{��&��n?��=+��\S&��/�Ƞ����,.m����uNv���5��i~}YV��:�n�8���76�%��`�gߜ�ҳx�I�H����}I�I��V2��˗KܞQ�ס�Βӵ�<��nN� ��ǖI+0�x��O� �4]4=���L,�H�V��tS���t�� �,�r�c���O�tY5�!>!x�:YX\�P�q�<���8�ފ߷b?�f�cV�v�:;p
(a�����m�mw�����z��;��Bмn�����$g�\КZ4�h�٭iW�{����]ZN�J�0U��9�Y�tL]�T@@�;]I�<�� *�Z�[����T���@�1��2x�ON���$�U��[�5���D��� ~,ƪ��$u�������"�!�X�2`��֫��%$_��E���� :爛X��y!2#&�	��yϥLU�:���>��	�D8�������Wn�DY�k�eAe��m9�r=�9�2M�:��2ϗ8�����ʥ1m���3��"��@ҕ+�'a1��G'�^9�]�_}ob�Eyel�*�4��� '�l�ε}��s�P�����)���,2������d�Q!��#�g�&l�]@!��I:T�bX�� ��� I��ԏ����3�Ph�(�(�(�(�(��	%}3l�t���^L�Y�1$X�� :���c���YD�o�pY��\J� �1����/b�_m<���6�>Яwe'�9p  �w�*�[�_���xn�F�����E�]݆1����{z��,�Q߲4i;4X���U1�aB�=1۽>��*>_��dl�}����!#<��}�U����9x�ե�	m�.N��W=�*��J�e�K}+-��K�Q ��O*Up>,Ǟ~u����z�����0%O"l`9��i�z� �D�W)p�
 �
 �
 �>��������ػe��NO���;/7PGX�9�p�#d^���+��4`�{kC;+����*J�(�ȭ`H�Ў��Z��c2�yN��a0ԟJ�$�lqrtJ"��;>�w��ɺ~��&?�?�p`��M��Ӛ<H����:id���Ȳ�i�` q���W��ҩ.�qI��:���I��do3j!o��~U-�=�H���P��Ǉ�]�:[�Zܟ<�s,��C��W.k���*/Ё�'�/e����)��|�HS�O�W&>h��v���5]�:v}v���K��r��q�#S�of�U9�S��֌w�j�V�� ��G*�n�0k�I�K��׏�Ȥdn��ߚ�K���H�t���e�K�ӳ�)'9�� �U��� ^�컢��\t�M��9�U9�w���tMòe5����)s=����Z��iƾ�3�$�U�"��mE+:�N���:f��G����b]�r>�?c���_�~�x�<�����o�re�-!���^������ֱ�X�d��%I8+#z�@�� �y��!9d{G?��82F0�G*��!O�:3���?��[җ_���t7ɷ�� �@z�x����������^4W)���3��<���t��� �oD�^���W&8�4o2�|���8�7�M�(�pI}��°��&fo��D[��r!ׂ��7�lP2q�S�|����7�V_
�9���������H��1ڿI>b�^ǈT<ѩ$�eFH��֥l�B�m#�̂���%D�(�� 9����f^��۸l,!YeVE��ʐ1a��W��X�z��>���3,Q��6�q�C��Y��%E�31�oAY���4��,�ou�mmM��F\ }�s�Ͽj�}���k=��n.,ͼ����-�\RkeQ,�ߗa��=s��ꅅ��d��D�+�G��'�����C�O<v>�P.�!y�;}��1S���퐏\|�ѻ������n-��e��"�n�r��� zӶ@�,<��Kw!���%���L� Z-?�g^ ��h�$�S|`	<�ٽ�z� Z������oN9ϭ 1� s�9�=C� R�s�9����1@`���$�z@@@@@I'��	&}"�OMj3n�\L���S8䯨5�5�*�1�-��"�)� �¢�����*�ȁ��m���pH���<��N������Eg��*F��ko�۰��\���i+�Ɋb7�l��&�F;�s��2)t����x����V{G/f�1���kע�E���H�n�6�m%0�
��>�ت��|K!�����٤�q7�зJ`����"�oA����V�n�2��H����_��{դ���#?#��51�(A� �
 �
 �>�}�!����%�+?��)#�<���1�r-��t�E1�{onI��ԙ��_~��P%�|%��j�oІn�����S"���P�$}Ӓ�W2��l��D��Ҹs�qGN8���>=^�M�J�q,�;�� d�ռ,i&������2���KN�ס���D���!�z����>V�̤�}��9�\��:(��pA(��؂;
��8+��e���������ݭ��Fw�q�?ϝtFT��ʭYC�V����1,JI�";O�F�&�����?d�P���/�d�8=�=�yYܓ������Kؚ�H�E`nfxe����知u9N�h�*6�3x��=����,WB� т�U���-F�=I��@�zI-mΟkS�?����UnK�Kb���Y��tDr��ͮ����O̜ׅ񯈿�x�4����E�M����}:i��_��%��/p��Prp��z�k�?'�^o�d��ԩW�c�#�����q��9��G���c����8�ƑD��=�Nj~���Y<|���w����׏�r��ፗ�^k]6�𗶑ٝ��d�9?��W�����$��<�R�&ϑ�ޏw����[��J���
���-Qu�-�,�Ƭ��������(�?��Zφ��֍���Z�KFm>@�cX�)�|Cӑ�ξ�b��g���Kzc�'��#�G���Q��>���e,D�}.F��w�~��q�pG���LWq�[]����\��F_Q��F�z�wĿ��2�ȷz�Fg�U�hX��S���T�]���W��wAB�+����������_��a����0Et�aPΫu�1�`��V~͐�V�ըӯV8�D�n�_1Ns���c�\�IzCp���z�!��=}M2��dz����l� 9���?:�U�l=|C���Q�<w1��)�r
n�%H��T��J�4lC���c�� �˚̱�ՄQ3�e$������R����g���P�v���/,���w``���W�d2e��ׯre�ض��X��L@㑸r������]�f��+�7���b���aq����4�dl`�{}����.P�C*1�zm=�x����#�B���[,���q�@y` �}h��+�l�ӓ@z��ϙSG$��{zf��	F�����Y#���
�[��8?���}Y���	c�ZG�[�xP�/�*��a��^IEl�̡%`9 �H�����@@@@@BQ0�{Yn�gTH�r38P�M��q�� ��ЍģKv�ISN�x3��r�����έr�9�9�Y�X�����h$��k��k_ķ���kM:��y�h��������b�T�,6�ZB%Y���w�K�#o���$�
�7sOq�B�)��#�M�B7�~U-���įu#�s$%q����۽v���sY�r�e����o���x��h�͇��H9���
N�X��ag�*ʊ���@Ežx�S�իVT�Ρ%pd ����+��jx'&��
 �
 �
������>�����Xco=�8#��z��ODt��r�o�z��Z��Z)Arb����&рG� kM�6��qv�+Ks$�«��M$�/n�cFҥ�l�� 8C$��8��fܝ�I���Zխ��*}=�_qS�<�Mv��9{��sK�j�N����;�(PD�!R��0y3�I*4�բ)�7��v���Z�j"��$�F,�q�'�L��8�DWrg2��k��׷h��g�H����?�uɥFP^�q�Gz�K��.ѻ�*�^T�����u�ض#qop�+�<;B��'�5�y8���vcW��]����=O���{L�T�O �n��7�)��-�N��X�e����H']�$�$d�ji=�M�f�w�k�-m�8#o�����$z����j�Ȣ���_I��7��_|IWX�s���^����ؖ)J�������/M���ZGE�:�IkxM݃��a�ǀ��_=�>u����/3���>��O�����5�/YxW�^�J�~���݅�7�)vK@Z97m2����|��<��|�jJ��O��#�������雍Bk�Q�[�[ ��:�������^���W��3��J�8����EѼ��P�>�u8��,���U��:��i�\�4.��:����"��eۭ��/P�qy���_�"�/촒��v�WH�J��/+�Z���������sm7��}�'���X���?�� �lS�q\h C���q�Z����|:Q���<G��"*�n��>(Y�Ǚ�����i��Y8z�]1���t���V�!�AIG⾏�>�0ߧD���F�TR��Aa�}*Q>��q�bH!Qn�cY�̍X�9��κ/ՙ�4�ZU�6��g�¨s%����Lz���z��o%u�O�IekQ�~\�J��d"c��I��c��&;��e�[j���ϐ�xw q��y�F�*�Ư����%�������M�cg�#����W�D5��G��9 ���~�B��t� �8
v8>���vN0~y�����)�yĤ*4$${��;�J�{!�=b�;}�[�$�.b>l-&8,�����Z�ޙZ�W�G��0��{���?{c�ʢ��@�k���Z�D�ef\4~\�zn�{�%~�lg ��0j���3����g�ʀQozֻ`G"g�r;q@b��K�>_�ϝ�=�1�9�[�M��eq<fgܻȺ�O�� �z� J�����W�,	 �UPv��	>�[֢{C$β0*�1��O�fX�@@@@@M	D�cF�IS&vL�W#ipֺ!�L��"����M��9��O�� B��O�k����I�A4$�C�ҭ���S�m����%)#���l'��g��P��Y�5=����� y�,AP�Y�{�����BW������4��7�r6����RM��[Іβ��3����ݯ�MW��$j�߮�>��L�f\[�`��@�Z�'��� ��8���S�����.dh�Tȕ�Ҥ1?��c=��֊�mj/'T���b�t��󂾆�d��!T��
 �
 �
���G�>���6$x<̓��?Zcz�3�/�Z[a2�Ҥ��Z�7z(�5�t)��d�՗
���R�&��ܵ��p��-�y��r�r�e��S��6�W��T�af���z��\QuVp� ��M{'_,0�3[����H9�^+��
įG.��� �N����������J�;#�S#n���v��߈���G�s+��6��s� �c�)�����Lj�[wsz��k5��Kg�s���S5ze�hի�k՚��2����##"F��O�_�A%���[ga}��itn��Si%��}3^?����G��}(�x��qu���_5�F1�d�?*��\��>29rc���^��mRG�|Mj��L�$zg� j�MWG:�c	��[��X�`��?���P�^�,��R�]�ah�HB�>.O���*_[&7�tF��ZO�}+���[��� �(ɉ}�خ%&�>��%�q��z��4,��3���.��|����|��x�k�%��Տ�ˋ�e��Ip��%���A�)=�c�>UO��*?��?����ߒ�}���z~ש4K�6��/4���r����9���<��cƟ�|'�T�fG��r,�n��	���VRTD_$?x-���?��C���K�%��u8���?ĸ!��5�y��|� ��[�;��y�j�mh��++��5.����y�lpۼ�y\����y�^,�f<6�Rv�S��Ziѭ���\iS����"��m.g��}�q�{ָ�g�L>d[o�e?�gȪL�Y�{��C�$r�}�9?���R]W�z�� �fE��a�J샡?��H�'�,�{<C�v���]m&C��D:��ygxx�.�5���P>Y8&��V����4�~ Ҁ�@��a.�z	C��d`��T�<v�,���4ޖ��	�����6�r���5�t�U�Fz��n�u	bE_��yl�U��T��,G"Q0eFbva�VC�=��� +��ec��Gw�m��o�{T�#%���c@r���&��D���,�n��P�����{����i��-�ߧ�)��qM��Y�e+ ���vW��q�ip��Io;meT�o*R̓�����*��K#p�%���������Ǡa���DQ�˞�����T��c������Py�pH�	�X�
�ʩ�6����5(
�XLE�4h[���0�'��jܨ	o���&�d� ��6;NO�=�)&u@@@@@@%n�-��|�e�\�x�6�2�?�o�����v�}���ƞ��#������k�*(��I�im��Y1�I�G2�\����!m���f�#���K-<{�,a��}�9��Oo��k˜a�tW�5(�$�?��Q*�V�۲�o=�ݞ����g����Z� �6ƽ7�����2	g��͈�0vA5h��X�c��,P��ς��d�%S�C�{�{�$���#��ک1�g+��� :���*@����w(�ڱ܌���~!\�?x��c ���� �
 �=��*&q����qR���������z���%�6��<�np>u0�vRr�,:�2Jz��#�#����U;�f�-"Ԭ�;��9�j�R�W-�ArgFhzLz.����jsܓ�^}��f핗�]A/O�W�cb4��F��\2���j��G�u�֡����b�!����׻�,ዩ	ck� 4�pJ�p��5� �7c���'�t��+��;��gүt���Z������+��i���}��e����Gl����&�q��V��+_ؿ�1��@K������V�T�ۏO�ު�+LD�
�/.�T�$��NW��+��q�Y��7�͝�Oh&��_��{�z�Y\RdN*N�W�EֺoXX�58�`h$�4���s�ν�2SZ]�|�L�-S�hY'�ef�]W8 s�x��ӭ����yt���t����/uyX$	����G�=�a5<��e'�#,~x��������O}5�2��J��+��T{U�4�Ȏ�챼*�z��C��W�~� enu�a��#o�YK��2߱��69tޣi�;z�������=v���U���#C����3�1�Gh T��M#����j}c��)��%�r���`|��)���Q�K����Π�� �
�1GVS�G�	�-�I^ng��{I����#�H�O�ֺS(7�E���H�E$�7\\/�&p���#��8�5��� ^��E}}
[]I�G�Y$^Ed�:4�# � c�㍧<�4:}����^hB���M��?3��d��*G��T��3I-��c$~[m��x�Ͼ�DjGYwŞ�q�Nk2E�����Q�|C�c��G�}J����ߎ�RIGOY�ϧK5��R#��ʝN2q��m�Q��^�%��o3&cX��*�3��� �R��%�ĭ���D|�W�r�Q�r=��ޘ]ܛ�RŰb�'�3��U,'5Pep>��P�� #@y�
*�� d�jӌ9>���@x�
 �
 �
 �
 �
 �
}�H���rB���k�0���N�xo�޷�n6���s���Q�6Ļ� / �pW�� ���V���z7�B�	�{���C*C~�	In�?by�� (�������趩�J��٩.��9Ϙ>^�JM֥�� �B��0�[x|�0��-�g�5mv�����Q$Q��F�5���[� (�Y�T����G,�#�"��#-l�v��Os��P��ɡ��Ҽ�Љ�7�yS+@M��Γm�?P��uI��W�͈�2AqϿ�Y5�R5ն���Z�d�A�XH_��Q�j��zD*�z�aR@P@b�[���b� ��I�\)�9aP�%v}b�ޛ��N�M�,�4U	ŐEtG%$�f��%��@�6�0��m�N(��!�ȴ�}RhbY��D��<�k�˙��G�Wܷfr�n8�:�ZE�B��OJ�,���e�W�߁�\��m٤�4|��t��C�ⷸ}��α�2�s��C��W�덶q�t���!�A ��)#�F1��\|`��kt�[�֡{5����_�U��F9�WL1�z]3�-7Su/�[=�r���n��{�Ѯ/e�l���r�E�ki�e:����m�����ֹ'7/���F���'g�����U� �G������'>���j:l_�uJY)�ԉ>`a]^<9-���?Q�,��0����:l�>G�7q��W�����JܛxѶ�}Use�D�ZYD�=x9�浔��3H&�Oz��zU5}2ME$��-��QiLp�>x����b�ײ�:�xs�8���p��-�k��L����5�<��cxWՂ7u�r+��?h�/*��.-�Z����#ᙰ�KkԆ�=E>��[XhڜPj�	"_�Ļ��� $f�܌��^Ǘ�O���Μ���a����IF7B�M��=V-KU�+=*��c�s*3��b��gں�忈x��q���>��o�?��R�}(����@��w�'����>	?��jV��u��E�WFkY������$�ٷpUO��QrrQ��~��}C���B	.tΐ�5=%��;{�h�O1Q�� �j�'�x���K"R^�Z��q����ĵEsк�q�hFX��?3�N�DB���o�>�>'�ޅ֠g?wݏ�	��=_5�CÑw������[k���b�F��;�+�5%h����ѓ���8=�>udAx�j� ��(v*��>>��g�*�(���w�D�36蕔�[���x<`�oZ�֛��R��ܨ�� {`�<�,���÷��S��j��T��g�rwh�C�Z&�$���'��1�;\�������淿̫�x�m1�H��<�ۅ��{���F�eu,L���
��]� ���fH����� Sp��J)�#{��^5�*�c BH��n�z��n���}y2۪of�r���*ÿ�k�v�:��X�-�M����~�ܱV�>���i�$���,��I�W��肠�/Σ^�b������47*T7�ps�G�՛T\E���8ǭ@2���`z�q�e���ҳC�*�1�X�)��N�X��H��1��K��S�,�Wj:�WV=��Y4�j����Q�tU
<��=;��@
 �
 �
 �
 �
#��X=	f��=<g�3,����"������~*���d�ծB@@��EK��bA���j�=��M�?x�Ha%�����2��C��;ՕǶ�1�w��"?v~�|�r}�������nD�,13d&�.� rIC�gҭ���CG,1��Y��yS) ���O4N>��@�{*�\B��w� C�!�P޸qQ'o��-b8��(��i-"ip�v�xJm��N����,6��M�e2�a4N�S�d��,k�Bu1F�����8V�a�=�g��F�4[MB����N\���m����8Z����H��l�<m�n��"�g� V0�5�8p�Eӱ��$(�(	���`�<S�R#b��BHp��g��Y�u�1��>��t�S��\F��q�{q�V���9b���ʸ��C��=9�k��[ߣ�*��s�ۜ��u�Ĥن&�������8�}�A�s`�H<�ׅ�zR;�.Ru�I.*�?��ٻZ9S9w�A��m�[��d��������W�rw}��u�����_^[M��X�Hf���߱�i�tp�Zk��Z�X����������ҹg����nʻ_�Eݫ�K,�W˅���aۚ�[�FN��W��D:�WFJ��tQ���8�ǭRO�vZ;t��ЭL6��"�8�a÷����<T��Z�Ko��N���Y�9�WO�>U�jJѼ�IX�jCZ*�� p�6~s]���H痻)��Ԣ�/5�E��+|8^0=���ۑ�Uƭ;�'�;��xE�U��IR-O�Y-�d��#I��������POc׽eg�4�˄[i$�n��NO�~c�C�?⸼\�q� ��o*���W���^q�i�N����kvLq��T���Ľ���+����#�bÖ2��ױ����#ˎ�_��i}S��3�j?����l-���i��R�r9-��}����^W�q�7���~����єq5}�I���sV[}^�;���`v��6xRg
	�s�ֿ_��o�p(bZ��2���w�Sx���N�Ҷ��qKa�I<�!&�RI��9U�^�_;kg3�"�N�ՓP�z��!�c����*��z/�i��� j>�����:����ol�q=��s3�=I��5�_�?e���\��K�w����P�%�N�c�N��3����C]DiZ~��^ %eE�@��s�_�|+?����g5s~���*pKȭ+�N��T�{���i�^�y-�T"�� �{����y�����e��z?�qa��|��K���㝱��!b�˩K�����狼�����7�!�ȣ��j�]�/�Bk�0U-��eq�#Ol�d
�M�e(�뺼�B�OV@%�>r��,�?j]i�\jw&��I�F�xh�`ǧ��	v[�sު[�����r(	�M�Si���s<P���,XW� �����:�US(ƾ��o��+)nB< ���ۑ�׃�����,��qr1w6�r �_�T��lJhR\yV�9C��SF�� � U�R"��1gRC������X�L`K�m[ۋ�RZ;�̐��C���뢞�C����!��`c��[Ό�~y�q��U6I�L�l�-�H�C�Kk&�Q�<��T�`#����fY�>N
�l0x���+6����e�ɒ0	�U*[>�Z��b��w$�o�ٖ]�>��"�@����j��ʭ���d;ׂG v?�ZG]�E��-�ۮ5%F��`���#���O��)Y�o�H���*��ܨ��,��)\����s��x�
 �
 �
 �7%�kg�͌`<�p�>��Tӫ��Gz$��T^�e3��IW�a�� z�N4Q�n{���Vi���\����g;��=~U����P�		ln)#�L�k��_x�#֗����\�41\[ k}�c-��R�|Q��4m���H"����;����ȞD�X���T��`ש��#�0߮ӕ��(��� 07�����n%���o8�����z�n�k��o��5�	����`�b2r��$`��4���i�Iwby\��l\E* ��i���=J���Y�<��O��� �05J�� 咇���.�RIh�S�)%O��j����E}st��C7
��Ѕ����p���r?M���r�@@>tL7uV��YV��H�1 )���*��}�ϫ|A�8tۻ]��X�Iky7��z��:�Î_�4��Y9-3�~���s�u��j��������J{���|��r�Wz��F8�Xֻe��7"�D�cX�F�W��P��ё58��)�5k�t�x�ݴcsz�q�s��j�*�'-�VϬYi���srv�_�yr=���Yq�6�b�_�i`���q�˘�6����qgJ:N��R�G��A�ZX,R�H��[�X���2f��i�p��r׼7�͍�T/o	 D��Ƿ�kxdN5ٌ�(����}:l�nh.lLf8�X�X����W���=�b�:kH��}b3<iq�ef<����H���;Z���^�KP.� @�zW2���;*��Qm��%7K<(�e�`3��W~8�3�!I}�z����=��Wu��������v��̡%٫Ɵ�:���n#&�Kv	2)FX׳�I矕t�
*�a����n:��WF��o5MF��eid��� �s۟z����㰖iV�����<���̲<:𯬺X�n�����(�X�@�x\Fq�����?���x�[M��w~��8G%v�ƾ���Ľo�%���b����\K<W����n3��w�������bX���<�'�͗/'�s���7sӷ"�W�]���o2�I��8B����yX�H5����|d@u�b�S���'
v}���I�����j� �������m4Hỵ̏��>���W��P�tT� �I��VMu�[�)bms�����)�=�+��|�)d�*K��<7�$������� �Kw����s<Ov�i�9%�ʨ���'���O��V��5蟹�!x~���9o�e�5��K+X-Y��+3�1��
���4���&���>�r�N֊��d�ž�y7&�)}{~Y�>"��y�r��<`4����:�]�,M7J�塚fF2��t����P�GںQe���r��.nb\�c�>�x=�z� ���u��#+�H H�`z��d7��!���$���HVB� �s�R��oE�G���U]u|�n�ɿm��)�0���ڨ�d%Ҭ ��KP����3fW��#�{����A�����t�v���v�q_j�p�׷5yi;+�[(��8�8�z���&��B��T��:{�>��O~��kt�E=F�uX%�Fg$Jo,��� �}���H�Ks�_���
���$�{sؑ��?�IBF��[²��*Z����劭5�"�׶6lDsEę�̀�e�?�[h�7���p$�SL��k�a>��ֳ�Iex#k��:���b<d���� ������~6��I]��� c����O��!�Bǭ���<� P P P�$K�xE`�$����*��x�=
���̰P P2������$Jѓu.�Ǻ2�5$7ֺqj&r�ؒ�����Ɩ�(#�џ��l䗧� ŵ�WūE,��/m�fV�#��N*��OӰh���t�wF$�&� *�y3 ��Nj%4�����Ru���73`e�/�0ߞ6����O��O]�Z��J�g��j�LD���O���zD��	�7��'Lݕٱi��=0�����&��O������Y�(-��2$��8q�[�6�^ʏrF�4��%�1�\��68ݵ��sZ2ȍl$I��,X}��oNxP$J�֘<]�k}��i�{Uu y�	3���?�Y��M�:"�֒�Z?��93>�%���e���s\�]27X�
 �
w�l^��=t�r��~R�~_Z��%U��Qҽ���la������l�.�V1�Q�+,�T1������ٚu�B���H��ڃ@�y��+�4��q1�٥���v��<��RQ��vL�qLK�>W���.b���ti���B��C��[���cǁ��*�ꚭѻ��K�,���om�$zb����Rf����(��������zbUl��}�mm舽�?�>�%�\�4q���;��s�=�"���D�za�]!$�棩_��[�����9��f��f}D�c�E��i��-�±�$�2=��uɎ\[�b�qkG����E��f��{}Mt�n�s���"��J��o.��Fmи(F	99�Wv�5s傫�ý';YjZ�ʴ��]���S�q�^��]���K�6�ԭ5̑�Ҭ��^����1�.���*��T�BH�|"��I�{���u.���gi���6�[��#j��־?�?���S�g:U���{�?�^+5�Z0}�z+]�c��[�'�\������aH �f��~���ܰ���sK�hƩ����w[���L�������0�rG֭� �1�8�T���[��o����o�m�o�i��Y@`���#DOq�9oOz�χx1�w��b��}G��^FW�]�+(^y`���ؤ��1���K���w/e4Q��4���Io"�89�� J�}��gRt'�=9�>�t���l�M�p����s��_���~#�������}� �Q�0��Ǌ�n�ޚ���U��C��mN�l�]2��A����$q��w�G�z80c����߿���>%s�ʹ�o|Y��-#Q��U�n�	���OM�K�;J� <��k����O+:��P}��t��|lx�p���>l�z�ο��j7����id���M~�������� q9��9>��>����̱�A3;�}�G+��<gԟJ�Tٓ#w���]��;*�p_(��a��Tտ����Q�j����L(�S��p��_α���f�v�{�Q��d�V��;��P&��)��xmJH�|.�/� L�z����c�E��d��sqoy r��i�J�?F���"G���7����by�!]A��0� ;T�Zb��uqsy��۹V��q��U�-�	���uEݵ�A�3��q�YvX���te����m�Vm�T�q�@��+�^���$YfI��cK�������z�E�iԬ��|=�Ɠ��k� Hq�a�}�uVأg�#�#��%�X�̄��~cޔ7�u��%�$S�$��oF?���8��:��wJ�D�J2�/�yT�;c����S���?W���$d rF�����]��r��?o
�����P1��ޭ����W��1�ߵfXSb-�]4�J�6������^��� P P P�z�[�[��JƊ�Qʇx�ŕ8�؟A[4�l���%����(T�I�I_=�ML�L����Hw !A`��1]�ӣ6�Sk�iG�yE����g��'~u<�mء��k;�(�d�*g@$����^Mf�_D��>�ss�$�H��>"��'�ͻ&��RLP
��㶽�I�U�>Km���Ӱ���|��a�T�P_.@H�Q�>����W���B���`Qn.�ݣ^���؈lcA��:� L�\�;�%��%��e���D@4��o@t�g��A僉��>L� ,�����E��xgƥ��q6��[�g$��=�X�i��ȁ�9�P�1@N|�bԺ�1.1o I�����s����Q�D��}��=�9�#��"�|{��7�M�Q:�~6�n���)c�̀ʿ�7~~���_Qmq7B#��� b�;>9a���v�#'z��!���������<�<�r�>~�W�����ѓ�#� �%ё��v��+�on�i�I��0�c6R%�,(�NI��BQ��'z"�E���8��[h��Nx�tF|^���m�"��[-��ϙ�>Y�q���f�]���f�Ԍ+��F��8�*J�t�rb����?h��t 䜁�4�6�qeg%�C��iae�ݥ��ͅ. a��_&��/$�G͞��R��5�MF��H��䑄r)n@ ���W�����&�%���m��i�䧟{���֪��%�K� /�H�LsZ��<�#�ǭj��*�"��|,�z�L��]�	,:�;��F�錍ˎI�n��K�?����]#u>�ikqy��-�݁v��pA�W��"�M�//�X�6rv�)�2H�Ï~٫ɿVXYan��
�P;rX	�+�a�*���H$>]������4k,�X9ۻ���n*���@Md��W%�U��้<� c���֭���E��� �o{�`l:�� 	��l�g������IV�'?i�������`G���.Y��m�0��\��	T���Gpg����W7���G_ʞ����P%ͼ]I��D-�P�8o���Ҟ��dj�רn΢��GrZB�x�&�x �F?�K�-����.�b7�~~�J�ze��xeX�H�#�s�_��y+�NѸ���$�-���x,e*Dm�!ʱ�A�?z�m$�7p��&C�Q3���͈����z�d?���d�R;��ل�N���۸�IeA�����e,ĳC�6N_��^�:!4�D�,�_��;�{�=�Q}��uwl�in0 ���������w�[_܊�/�]E;J���2	a��G�1���Ce܉��Db����<s�Jɻ$�jo$�λ�嘟:ٜ�o��O"(רj����[ZDRҧ�x���)82�˶�޸${����%���\i�
�$�����$s�;*��%m��:2�n����H��Ԝ(S��ʴ�$����I������:�&7��o|U8��l�ѯc�İ�}��[�sQLE��Ua�8��@5��,�}���0A��1@+����t��������J�7�_ղ��SDm��+!�m�i''�/��+YUSE�K���P	
oЃ$(@P P.�^�H�[ˑ@�L�$���O������$��]����{j�Xٰ1�'���k���Pϧj騽ӥ�D��&�!��2~/Z�2�wD�C��]���ou)�?w�	�=��B�N� �J:��,D��3:��� x��J���9�|��M�� �sP�
 �,�
����f��:�*�E�'������[����w\�U��G�����mdf�	��^Fhp����IS�/$wr����U��9W�C=�P�av��I@���^N-I-Q�%Ĉ��E'Uy��Y� ����xܧmQ��aG��Ki\��pN���<�L��7��4V��c,DCh��}�$�gK�y�D��>�UB���~U��J�gi��9R�F�c�s+ap{� �-�{5���2Y����G�9���erM(�i4[[���)�/��{ץ�Yh��%��ΰ�Q�\^��l�B�*3���q^Ҋ��<���a�k�.�p������"�>����:W�dWm���%����|8Qܡ��jt[l�4cy�i�*L�]�I��4�'��\ze��d�I/%ۗ��F3���ϊ��t��n21��2�����SGsl��z����Ǘ�B���c����3��l�IB��;��S��?B�t��yV�"��v�-�&����b��C�mŴq^9�"��	���s�c�Sm� Q��,q��Q�f[��~@�>�~u7I�JM��.�wWh�;�k�Y�GI��dyl_����ʜw=��7�0yM���:���0?�s�oL�/�3tΠV3.���0�P�Z����$��>L]��{�������3�ECT�4�"�v�K��m�w�I��e^p@�� J�6�h��ݩh�^}N�v��%���~/�������A�i"�Y��&B��.?/��ⲟ�ˡ�	$zp{�	0@�s�PI����Ɉnr΂DrG��pp8��k�E�Ӣ�DYm��:`�vޛ�����Ԫ�&��_��5&�_"EI7	 ������
!�3���� =k0zYDl>t%\w�qN���\�3m���9�=*[�x2;D����~�* <A�`�$�b21���y>�	�K%�<�����<��PT����8�y\�023�O�V�w�W�V����:���<�.� ����[mFѝ��ܷ-pӻ\0 ɞN;AX���2�MA/l�g�ѓ͍ghg�³`p�+i~��y�G�C1�f�FF�4J�r{�;>UV�#~#�<��"4Gz�]jY�>�"�$a�/���@�w��PJ��"Ԝ� T� ��ֲ\kq<h��#�#c��&���}��[M�/)��
�%�cF��dp~���Od�����@b��1�|�U%w�>��P6�mo"��9��(Vٹ9����ϣ��{'��_v�������K�l�T܌�qڪt@�_�g8�w����NrHS�Ǹ�k\��{S�L�1!��F $����YSkH3�U P��ss!��s�(��M*�ѝ3��ӷ�}��4��P�b1���F>���+� њܨ���v��K[����D��O?�͚���d��&�ױ`ݼ�ڿ���N��?J�uFoo]��[�?R�@{x�SJņ��θ�Rv�gJ���Hl4��3I,��(���+��C���c����h�xIfw 3c��s�ދcN�bw�f�m��Y>����j�+:f���F��}���r4ne Ï����*�2�ŏ=2#��ؕ? �Ϧk��Y�j��_�Z����<�Cs�{���Ӄ=�sNt��|A����H��m2��=��Ë���ɖJZ(;�F��P�Z!s���$�||����;� n�T�E#u��j��dG�g.Z{G�Y�Ad�s���Z��'�CuRO�ܧ�~�|�������5_m��%�W�A�c���3�x�q�ߕY?������ g_zw�:[k�R�ܓ���Y��&o���W�5�?���ȖLI��]�A�y^<1FVˣJ�@t3L�x�h�!d����1یg���|+�R�(���t~��+���}M��'����u�Q�l�[ȴ�&GnH�p���?��7$s�p֙X~��B�8��:J^��+�6�)�����ࣶpA둏���pe���Zv|�Ҍ�}�۫U�lF���������%�?ԩ���nm���|��1QZ�~�gp�A�_HkZ6��Cm�跱D�~bL�G3�2pJ�	�_�|O�/�П���۵�[���� �~d㏊����I��I������Ɋe��i
�<��G�~U�|7��͋Q���� _S���N�$���8���oZt���Qtޡk�zd�+@R�0}Z3���~��|s���BU%�g�g�s`tֿ��΍�:�e%J���+�_c���)*����j˰\qj�j�i���*�2�`���r�dWLmt��gO݅���i��d�I�y%e'��O��Uv�G�Z���ϫGz�ĥ|�����Wޫ$��Y�;N�0>,Z�z(Pa���G�������I%s��ܠ�Ƿ���:����z^+��)oe$^C�r�7�\}*�����$�&	+��g��܂��V�%1$h��2r���zsU �����$`�~b�%A�B�A��6+��D/�y�0��f^9Ua�G<��T��;�㏝�bh��8�n ۵���2�9;p>��o���߷��{�ܣes�n�������]\���ZC+�3�s�2=��o_ܫ��V]/к,��6�J�̥��uc@9�H���Gb�1��Jh:%�v��IV2���X���8�Rү�W�d.�N�e�f�c�(��^�c<���4�������X�΍�ɷn�=q�X��h֖���"2,A�����ހ�J�B�Ң[�O�� 2��Ӄ�!�o-Ŵ�X�^��?�Ҫ�4UA2�M=g�����V0';r��=i
�+!W۽��*2�C�\E1޻wz63��զ�E+���(H�]H�"���@8[�s({�&M��;�� �Z��	pLe��ł�x���PZBI8��^;|��IL�s���,G?���A�(� ��OրWb��#-�/*� 2I����բ��H�R�H�d�yl�L���$�^h����T %s�� @#߽�'�(��&״��;Z�0p3�B��Ϣ��0��s�^rm�-a������z�[����"��gf���O+��v��#���Q|vuM��w��.���v�*>,q����)��N�l�M����7E��9�
�6�E�i6Km�k���;;���oU�����5m:n��*�)��8?�q�a��-�Ǒ���v(4D�K
L��g�\矯o�\��ԹRȜ��&�4�������OE8�c�l��[ql7�L�徕%�y�A�'iϠ����2'*TU�!�j� �	u����>r����b�e�1�'���g:x��˭������,3��o�q����5��=��M��t-U�ܢ�l��^G>��Ӛ�U��(���m���e�Ϛ�8��B��3�Gl��w8�x.�"���5o"� �������^�Q
z}�6�L��9
�q�BW9<�s�ڑi��$�B� �c�d	?����1�֋J�_c;I�;2b�9��M�J�=���߷�	{������ΆᤒF2E"yEK&Ӝ���Z�?�u���O�����u�*���a�d�	�_�D�)����#�z�������|�����M/r�Ѵ���J+kEp�~�7'�W�m��;L�qo5���"�
����8?	��(� 2'��5]f��Q�Q�$��w�/����fQ�CN��k�Pr����}c�:���/�tm�{��\7 �ʾ_n>y�_�x_�|o��y#�Oj�_���|L���JZ^����1��[��Ѵ�h��;������8޲�,�&�6ܓ�F\x`�&|z֥�}gP�ݷ[�s+���\�y�_�ǥg�?��N��犷���w��m�c���X�����,	U �8�溮�fM��:dk:8�KtfdQ�\���G�sۜ��?���e���s�մV���֩� 8(H���>��Ri��	l����bU�a���8���cY?
�`�����	�88�e��60�A�K�c�{m�!��n_�v��>��v��:x�e5�NX$�T��CA<pq��d�x��R�8�!K�Ƅz����	�R�ë)��<g�T
����#����<�!2-�ÏO|����>T^BGr� qS@ʢ���%�@<��+�����o�$�u��������@����4]�ʇ�5;���ϺȾK����8� =k�-�G���v��=��e��^&�>l\� 	_J���#ڄ��9,m�����5�~�5�v��.�Km<O�ʪI�����i<�Cod��Tg�N>�(6�s�_�V�GS��n�*��������o���eI
�S��r`z���Ҧj)*+푪ȱj�<pZtzI,�M+�=�Xcw�v��t���y�U�����J5�����q�v����Rc�����3�q�<P>������؜��}�K���du2�/��g�]tQ�� 0F}Ŷ�yr����9�U K=��ȩ*�M��(����T0a`V
��.T��{��iP�8Ϸ��6�d���F�(�݃��(YvA��>���� �
 �2@�� �D�{^��4i^)U�/v��BWgد:�N�M��-/R��i,�0�`
�>~���H���f��R��(�6� �`涂\JJܘ\�$����^�gM�S���ܬ�z��߿U8S���� z����5N��!���k�qo���9@d���{�]���[#`j}So����-�j�9��Ҹ�ݦ��uMQ�zt\��,j -!^N����N9rJ�-%��F�����t����0S���ҳ�xɳ]>�� m�����k��0��u�'���$���Pm�"�&�:��R�c�=2��l?�Č�ʢ՘U��K��gwi�l�+�ͳv;���k�*9?����+{����M���O:R��.����>�v�5Rވ����[���uX��\��?׊�^��p�X�͝�6�	�nx�����i��	PզCsh���� ���s�pݝl����"�wٗ�.������t���j^yA=���@����k�>%�'��~N()/��|�G$�Z��.k��w�/�Ǩ��Z̓Frn܇=�+ێߕx9>?�����ގ��>?o"��ޯ�>���B:��LX���p��@�c�W��?��JoO�vz8����mM~Tq���MZ����@��mq(��5P�p��οb�g����1��[>/���\��+��f�K(ԕ\�md���5������M~�%�ncv�#C�Y��������k�ɚA[H��]��'Jiڴ��]:!ӓͺP�i�2H���~�~� �L��F�K�OУ���`� �+^��B����w� *��d��S�`i������_c���O���Ok�缯��m�zO��r�3������c�.g����*���Pr>����p���GO��V��	`���oԸc<w�{�.��i���%�� ��� A=�J�T���3}�x������h�m,��:& � �󃊫��%!��<B�z�;u�X��,wB0>�r��QےB�T�`���)�o�#��SZ�n���R_1>WH9`}A�ޔE�Z.��t�����&A���pyZ���6>�ψw�Cm�B�nZ�݆T?����-�B"�pK��**3o;��y�'o��B$�pU�m���J�p�?Z�@ͽ��eD��� � ���ԥa�Su���1K��G�|�b1�x5.4��D�j��;_p����P6A+�~z(_,Z6�-ؑ����8edx�܀��?O�K@���$)���f7�9"����w���>���/`��Տ�-�D�v�iq��kH�Z(�'[���y�Oj���)��ޣ9�ǽC�-��H�Y�cx�6�#L^�_,�W���/T�f��_�V�o#A~��T1N�}wv8�r�2��`����E�����p�x��	dey�v)9
p=�U��M���,I4j��
��;U�!�,���}&9����%�S�#����0���nƿYm�y�ʔI��c��q�~�O��(�V˧�l�N��tI� �-�n䑂���]0N��Ob�����P�c�۱� �Rk��,�T��p�6@��ƨ�ܰ
���P�Ѯ�-�F-Qϖ$<+#>\�Yt��I:�:G� �7�����	�|��B���@ 6�hKc����?#��4�<}0h cҀ�a�X*�~%ȧ`�sl��a�t�����jZh	� P P Pm]����;��Ns�>������{��J�!�%k���#�� �����W�=�ΞV��g)�%��9a����q��q㵷����#�η=��S���� �J�:M��|�5��Ļ�Ha�+c&<�\9?��F��W[-MŻ�ŖF���z�ni�����K�SN�_��I䔦�U9���r哖ңx}1d�������9\�,r�}��r�K��齔� ��e�N�5�C�\��ˑǠ�j��ܭ�lW(��Y�]ck�]:o5����F'�����%��>+Dk����Q����R���������z�D�K���a$�_�N�Z�I�Ͼy���� ���=�H�p��q�&�Wb,��ey7\�S�#c߁]��ʈϕݼ)����KV�?Oj�tGB�<ȡ/o�Er�`Ƿ�}��*�����e-��	#W�&1HX�~x=�V�R,���#��R��LҺ�R�4�����Ѫ���T��~6'.R���3�I�Sz�����	:�]	
"k��ʜ��u?#oK�h�ds���\�?���SP���Yfi�����c����������M+��0�� ���I7]�@�wm+[�Ԣ.�3yr�9���T����$k�S|�N�6O�~~����'�=�چ��v�z���ĩC�i<�*�����C0Ʊǉ��K#�7l����=� {ls�{��[L�G:u�sI�j�ę$M����H	�*x&�J�DE��WwS^��<�^i�b0I���>���D�R�m;�������$�a3+y�8+�=����N�&f��yꞵ��S�lt{MA�ې[Q�}��c8B2���%[� �$��9 (^I?*��r_��ws~����U'kC"���a�����=�V�^zT�@]���� �G�E���e���Z8��_��E�i�A\�5�y\�*y�W��g��*���$�,ְ,��K<��݊�rG��C\�IF���H���Y7_���絮<���_�Q-�$W�]��^�t�7u;�1e��˙A?/���[K��ؓE�{�B=���!&c�,;��R(>�V��Z}��� ����<ǂe����GZ�H������I-�V��[�`���@$T>�M�M���̝X�r����W���6xt���d�A� �"��8�	69��ݿ�<��*���s��*)�v��Q�Kw`�B��U�	��s��!�_�l�Kiv�8�#�ϡ����I�gs�Vm���$�id��aA'?��q�� [$RF���2T�.�f�}񃚸Ȇ ˻>_���9�5V��=�,��gҀ�t�U����P�Y,_�[�]@U���ѓzdP��}B��-���&[)�#�����:\S!Y.���G�@O�%kU$����}kU����k�0�7�5��&2ɵ�|�q�
�Uw��]�UV&�@l�F�h�X�+�hF�DJ���n�#)*���R������e�6����?�V�i�������q�T�=���1�k��&�V�2=�˫i���n[8<`�A��1�E��'$�`����U��62!%E����@x;˓���xl�b��$�.���?<��<��b289�<���
ǧ�M/�,\�[=�J��N�472����5��"�V��Q��Q*nH�������څ��^(م��L��Χ��ӢŽ��6��p�%|��Y�q�t_�r�S�4ٷNt�z�2���#�*�jym���G*����l����m-b(��y�9[�5ޣZ9�ݳ����/�,'p�t������
�<���S�N������F��U�$�ʠ�f��j-�%(��̚�V�u%����!�dO啐�����޺�WQO~��z�<�����,��ͲI?�����v�Rq�M'�
�����mƿ���w��oc*2N�-������l��#�z��)}^����dա�J����+�`�pX����������!�iҺ.��Zu��2��'2i�"�Ǧ=�9�C����sd�_J��~������x���R���\'��?J�Zo���O[u�����]�>G+yR���O�� �R���u9.n!)"ɹw�WHF��6���<�_J�il��"��-��	@����$y����c~�ZѾ^�������D��m*����|��O�Ψkc�� r��s$o�E8���7{[��K�s��F�DdIdِ���*�ޟ��Ii���^%���b���3�� #�F��܋�FlJ�H#�G3D�?�� �N�_�&Jz�)��X� @O�[*[<�i��"KWO��u�eU�����\W�;�*^��tޤ�-$E��.a���0}�Si�r�L��ӛI֯-&�ː��r@���\T��N�ꯩ$�C���p�ɱ����2y8�����U��m;\
����ʀ2y���q�5:h��_9���{F����c'��J>3�G�Z�m����۶(H��*�<�ˊzV����kY��^%�$c;�7��g�9�ڋ@���
{�.d��T.$��/+��<c>�E�����4K���pMe;!e�\4R�X�p{~TRM$� �&ɼ>��$�z�:��ɑ�vU9,�x��^呦��4��w;M�2�����9�	�~�Q��_�EG�tm:�k[Kqce* ��3w���w���Ae{��i��F���
�Q=��}�u=� ���ĩ%�l���3��g��r{v�߶j>�Iw<�{�	��Hp�.@�aUrh����_5mˮ�.#޿;0���+i�����I2��t���8���槉Q^�`�v^�0�X<�Vmѿ�;��>������V�f�����b�eۑ�|�Yt%�I��6�3����U1M���{gڀ�#�XԪ>�	e
1����el'�D ���A?P{T0i# ��N?ހ��������G���F�,� SR�/KuV�[�h�Gr��~1�;�[���Y�
/@���G�\F�r����M:�WeU\�@l���Wp��!�k�&w���|P�2	#� '&�	ɠ$0>�ߚC�h���|�IX_8;� Z�Il���w��3YZ���"DU��)\On��C�oE⫳{�A�c��ϞpH#�jm�v[K�W�cl#�X�+ ���o^*^̞�ઐb�(�(�A'Xh�ĀnS����U��Yv}Y���>�阵9o�m ���X�� �,t�Y�Bo܈�>5u��ms�$ze���#s��	'���1`Fs�of�#�ۋׄ�޶�|d���֟&�UJK�im�-�P��[���[n$ �b�ra�qѾ7��߇]=b����K��0����#��"�,�4����<:�穼�X�vp;����S9 �=�_+5A&��F�Xk���)V�K�Z#�� q��M&���{���V����l�{d�h�"@ ��$g5鬑Ϊ[k՜�+EG� ���CHդ��p��.�dp�0����T�Iq���K���D֞�H����]�Y$��HT`�{`�j�x��Ędq�����׺gQ�����S(�\ؖ�6A�<�9�8��㇄���r�eKa������;n��g�s���WTR�t�����U���-����|ׂ�
89�����ʈ��p���R��1
����I�*��4F��V�Ύ7��Y�O-̰�S��/ң��� 	�/z�W�Fҡ�u%��fX��Y�� r+�����Xe�+��px�<��D������Y��K~Wl�pa(�7�������>Tܰx���}$��
JS������B�ӺZ��dե��H4�Ca2F?���|ױ��Ԭ�B��bpO���G��8|�r��'��,�wi%��c�F� O��>��ӏ��x-lKk4��P�Y����ͼ�d$�rT�;�?*�T�~�ױ3�����-d��e�%T{�g+�3�{Ue�'�n�lqR�R��zo��>+���5Ɠ�7����~}��㿾���Rj?M���G�ἶ�D�@��*�\Xj%�ܛ UMA�$� ��8ϥS����a��fR�^��Ň���C�g��zKW��[��B�eBgG��?|������� �ycy���c��|xA�E#��^ZGi�3y,$���e���A���d~��>1o���ORG���FCo$2��P0��Z�j:�����;M`���|��NM��E)�:��HnL���K����J��Z"�KQ�%�ʷs۫���LY{|'�NMtJ��7��c�
���4֟�w8��� ���u�&���0M$��f;UZT�������uGd�$��E��G#��0� j��D���<�WR��9���C�u;��J��		�0Д��<��~{�T�i�F��q"�)q��љIc�#�s�N�^@��\g�)_�V?���3�i�
$���p���e���l�=�{��� w�%ȅ�&2��1s��3�Q`�n@c W����� |Y����YԭLj�?�Ύv=�P�g'��tix&�i.&Y��#�d�>���R�c�m�����a���K��;s�"�֦����ײ�o�@�p�� =���$ԓ�`�U[���UPyWe��W#i�E ;�b�Ic�&���e����!�9q�L���G"�Wlb���\]Z�FI���c���)���Il�UkK��C�͈!_a� ѥ����4��ү�$�k+k��XBܪ����Q�h�t��m���_���v�`%�i�b+�q���v��4�J���������[�=kѺ�N�}/�����7kh#�6=":�?O����䚂B���ю9`9�Ї�℅ P�O�� �%�%�uo4�`Y��+&0A��%Z�~��z��Nn,�h�U�X1R���Q�r�2�M����9�F;2�{�#�Zp���7�F��Z�U�t�+���m���I��ʖ�*Fj3�@b�(��xV
�Λ(�J!-)S��}�T2����+ƾ����:�-^'1R@���}G�x�%��W�f�L��Aۥ쮴����+cv�	��u+�OL��z-nnH��K?����8�3�.��n��O�.���GP��IX2�]��s���8El�o�{W�>!�ǈ�2���nLj���!�{׊�gr���ax��qK�t�F�ûȓ��$}qTΗ������7�}[d�Tn[�V�m%�Ͼ>uƠڪ�����R�b�K1G	�������zW��
<��ɖ|��(�Z��+��D�;%��w� �c�������D��|V�y5�qj�z\Dg�E�wc<n���k�2J6�d�m�ĚՕ��so��P�¥�i�d�f1�� c����JOh���)��Eޫ$W)�n2#[�����Z��&=O)H�I)��bZ8�bތA�"����,e�&h.�$�8�R#h� }nKv��:�W{.$����n��Y��A=��������j�&����힟��R\NUD� ��e�-�;�k�� �L�.xx�ݫG�|:+��������t}F�D��G��vW(�Z+r�#v�$���v�s�� �<x��W�u�<�#�˛�Y1�O��Z��WM���5��o$��7S��E@F�P	G�w�Gμo��(`�l⠯���Gw�3�E�N܊��C�������zK\�m�Bn�H�U;n���k��O��`�ݣ���y�}?Ԩ-��`/c!��>[��8#��}9m6<��7V)3��D��JW��J����ߡ�G��-F��M�2jܾ嶝7I�� a���\����M�~昱�,�1�������|!�R�����(VSp�1�'�(�c�>U�?�>-��ҏ���}'����a�Ƈ��ɑ�<c��Z�It��ӧ�ų
� ����_i�_�b�d~c������x>w��˨�$s�^����v��
>w!��_I�{n���V�ua�ho�E���q/8���ԧk��hńL� YN�9�� ����9-��A |�s@zk�?Vw$I�`}�.~T��,{���΀U9��*�^F7��s�R��=��.S��H��L�����>�SF�l�f�N�?:�����M�I4�`���n~�ǟ�U�J�:���xH�ɶ~����}(M3J�j1��R>Qƹ���R�4��ۤ2�2�$��@<�d�+H�) ���ņ8�SD�u!�f�Z�ZO��R6�;���9	�\��dޱ$�$wzP�C�2[n�) +(ިI���~�)Y-5��uE3,o�G��?���i�
 �
 �
 �
4 	� �<����
�:��B@ٷ A /��Г� P P��UAfc�$�jy���ԡ��%�픩"e+$�����Q�f��e��xk���*\O<�&���Gr~�{U9�J��A��I`.��v^�?�5�$��q�Lh�zxo2�iG��?q��e��M�.��=Rd����
��p=�Z)Z1�W�HP�=(P P�پ�޷�M��h|��2G��R�}tX]X���@3�,�3���]�G��̉Jxۭ�M�h$�[�|�Xc��Y��J���Ν�Iu���SLkP.e�w��FB+6����~F��7���E��M��[ �����p��#<j�kL�m܇��>��d�oRH�D��e_�׽S,�����.����n|N�-�7���"���� ��5Ś�H�V��W��.�dҬc�C2�..�j���<�ӊ�nES��q����*i�n٥c������wz�2��0ʸ4S�z���|���ȃ��'tij�ψ:Ƒw�Qjͨ��Z��\4�ݻ '�J�:��R)96��^�.t���y�JV���L8#�_z�\�{E.ʦ˨I꛻Ϻ�d1F�q�;w9\կܫ��5���+y���.m��+�ʟ���i��J�2���_0����;��%]q�}�^ýF�e�Z�k{Y�yr��m0�Fď� ��GI�;;3읥�� �� �	�/\���s呷��1_��sɖ���k�il��?�Iǲ��~�&C�-�7Z��	���|$�;I�6��ڿE���.JI[>}��'����N�:� �u-C�u>���f�����H$�q�ǥx_�|_ܲ�մw|;��Bu���̛P��N��mpl^�D��p� 	?��o�G� ��S����� �&���9����C;d� ��)�\g�<~u�m�j�2���7{P3��?5b�_\z����F<��;��O	4��z+���z��.׺e�Rx {{������!��|�����x�,|Xs�d�_	�\�SP�K[="�;RA���57�Q$d`O_z���O�|7��.-�߹�y~��I�kEi�}���;��V�U��3���HVT�p?+�#�K�7c�ɺ�ў{�fh�R�褼B�� b��r�u]Zl(�z���� *�y>J�<Ċ���Gڹ�
�
�
Pѷ�ld}*�d2�KJ�'1.HQܕ546�ZʱV�
���`��J&�d��(�GR�iM�v8>ޜ����E��D����={����Z+�Ĳ�pZ&���?ϟ�Ml�1i�i�0�N��N	d����)B�;�-�S;�w-��!���?*�D���iIdt���L�7��w��d�o$��e ar� cު�A��M�y��۰O��	0�ʪ�]�''�ބ�*tW;Xn�89�?*�$w7�
�����gq?� z{�*4�|?tռȚ@� (!;�DI��O^h�׫t��O��F���$zzյ[%��j�7���bTd�{>�������@b�(�(�(��99�@b�(p�Ώnn���hC��BOH��B2(  ����P���{^���B�̞n.A|����^1�_�?ٓN����~�o����>�<�+	e����5�;��"�.��mf�39��W+�<��RU�]k�n���Ԃl!S!;���]Yt��/�R�9v2G�dmXԖn�k������k�g���?/�U.�7��u1���%�b��:J����J�c�� ��ǌc>պ�����9��fx�X�>��r$`����(���������K�d��
�V��	����"D�ŏ�W/6�qt�h�`����������ZO�>�J@�
c �}��I=�S��D���!����)����m`X�weO9P���|zT��o���9h�n��;�����$�h�s _����ו�2T��kVJ:�UtDH�6�p1�ki*�a�Ew���t[��d�r	n09�.@��ɪ-�V4���Ȁ\�&�+,Ư' �|���{�e2�E�p�W�uK�;k����)߷b���}^ɕ�s��a����M�a��y��d󓑅a�sWPKU�HM�-�Z�� �KJ�9㺼_�5��n���=�j���Ы~�:t����`�d�D;�l�y�H�ޡ;]2�l�5k[x��B�MvK%��������P�.j���>��#cp";��&)���x�ǹ殭���o�HRE��`?�nӖ�2{�6��alR�X����_.)ZC��N�������_Ԟ�u7ً���ǥ�X:����ͺ��m�������#�����dz�]������0p�v_��l?��� ����;m������'�����^��gO�f��c%��¹e�Qy�N3�����n�q���!�"q�K!�b1Z��9��c⮭�ťZ}�K����U����ۘ� n�.k���� �v��m��yY����?Ȫ.�R?.R�,�+�� ����s�^�~�K�slh���'VH�����t��H�=�:�odۋ�t�M����Mӭ#��tk��/�m%�H�;��������9[���k���2�uC�m�Z)V8�KG��!eO9ѕr}~=3\����eNz'���U:�w�{s����}'�ؔ�w&'�eRT��n5u�+�BP��;�dK⹥	r}���s�����[L�� x��n9;�?ھ�K�2�C2lb��\����D�(YY���|A��>Uo@`�s� }~�E�T�K.J*c<�w�ވ���d��J����2I��� �:&�� f�f���1�={��@k�������s)��M���d�����G�}@�x�-"KpX2F�?>� �O�)��\�������� z���>!����l��SK9�]ʑ����9���eD^C�4���La�Uz�8�����F����o�k�6��� �E�#U��oB-k�t�%x4�[�Π��D�h$�w=��J����E�-ͥ�B�.�7�}q�*h�A�ȡ(�t�4�q46���E#��X�,=N)E���m5yc@�;��rG�ӎi�v)="Ժc�:��9-�8f��4)-T (�(�(�(�(�(��i��C�7�U�{U�b�pE	�_�5���#ӴM>mB��8Fq�R}M�#�|?��L�o�uT�|��Ȗ�G�'��r�<[��1Ė΄��,�]".��lHͷX�O��#)7�]���H�YX�mj��Ь	Xȏ�n;e��D����Y[��v�{���ky �$Uea�x�I+�k�H���&o9bVP6 >���EoԷ}��u��l�;� ^K{�E���9(�ӭn���T.$'+���`�d"�ٌ斑�]o�\�\]n�����O�v���N�0��9wTUMJ�'�PH��[)��j�젖���
 �,�t�u��db(�����z��:��e�ւ�n���Ҭj��$��w<z�s��Z���a�3��C(/�ds�����_e��[�j�Y�m��y�ۿֱ��Ѳ�5�ge�:��[��YW��ǽx�Ie��z� ����&����,0��Wf��;�B���p\���⧌7�Y�rq��C�n�� ��h�LǥI?�y1��mf��OJ�	������ =W���oBu��̖X�W�w2p�=�k�Y��nΜ�K�8A,R����۩�4�}`���^���� ����<�ӡ$��sR��?�̑Rdbar8
��*98J�]��d�Y�w�وZ[�]�K��N�gfߕra��&��#\��G3�V�Z�ɵ�-$�yj�1���Z0L�j�7H�*Gyp���f]�����V�e��>�s��^������.�8���7h���&g��v;gb'��A#�j���VжI��[��<ܙ��9 ��O���R���],�o2��̌�	� ��|��*�d�R���hxe	�FQǖ=w��m�2��Reh�i���X�}��b��%C�p<�<R#Ċ�V-�|Dw�~�Z�.:��&+���#��"�ܗ�fL�<eO��z�%��+�����$H�F@s��c����N�ػ_[Dc��YXy)˵�9������^��/K�7ͨ�2[���B܁$$c߷c�*�{��Y-��jK}� w�8�|�m��S���?�){�!��L^��=ݴ)s���B��,T��\�[l�]lo��X�>�,h��ˆ�����Aa3��b�c(�K��O?OztE�K_����&����;�ww�UGs�8��������sn�]ıI�G�RNR2>��S����a��cW�e''%{��Q�,��<Af�KkdӘ�׷(b���Fj�ʗ�kR���>�>�:�v�w�m+<R&��� S��>dZ٤�=Q'Ѽ9�N�э�P�3��~4i�.}���c�^��ƕ�O��>!�αm��6�� �F����;VYs�O[5��)m�t7K}��;���m���n%�9 v��\oȜ����������wv��r¬ФN�; �ֺ0��,�͉U��5�.�wG�ҥ����9S��`�v��קT�/kDO�T��� �&] [	��S,�� �Ƕq�*�G����Xf�mɈ ]�x*�NA�~ut�[]m~��Q�KN�mP��m����ޠ��b	�$���2
��h�3�@z�p��2���=��P@��#>�(�(��h�.�a��S�֥u��w�Ay5�&X����`G�����#���m#n���u�mai�K3�b!�8'�2�7$��k�_�����4�В��¾s̘�F�n�y�e9ˋz;�B$�X��W����u�Pšʘ�D��_9[h��>���ȭdW�!
��X��{֜[�ʧ�C�tͭ���,#m*G�$�ufI�4'�5�#O��)/�@���|�+��ʢV:ߊ:Di"i.�7�Bĩ�� 9�׊��E%�J�A��6�]I���X��v�P8�j�<1�RY%-�/�6��m�r�	��N9<�+��*�2���h^��K�R+�]�c.�*�9=��q����d��Eb�8"�X3�Qc�W��R�+�e��X䉀a��]AȆ����i<�� �� ��T���@J<3����m.;7�L�	��W�}Ǹ�-��^��5����3�k��,?�w%�s�����{�B8J?�[����Fv�Lz����h9cj Q���c������.Uٺ��Ԣڣ!"��V&D�>���.nE見���A��R\��U܌|~��OJ����٤b�����%�1 �)QM�.�؁�[�7zeՠ��F�XD�Qv</'<W�;�t�F� ~���omёT�wS��'$��v��g�qc�r��y�E���?5N��0\}����#�����!�|�N*^T۔tUA_vC��t[.��B�&�B�0��j��QqK��{)��m���������h�`�+��?�g�Mɢ�]�8�ī��:��M�L�,����%���zmӤqǢ��rd)��s�����?�>x�G�R��8^��sB�rd��X1-�R>��{s���"<,���=ձV�זVɸiG���8�Hߣ�dQ���7fx�h�d �b`�U��<q�j��d`����+�
�E��{bA��VI�Rm1K�$�KHX�#���10p㑟�Jmi��m6��t��t��o6��y�VJ��
���T��#gۆ�پ5>����]iY)�������d�˃�&6�3��;�,bkD�̐:��FF3�#�T�z`jա68�?����N�?*�B6�j�� J]������ ����FNr�����]~D��jӵkmN��K�}��|F�mB��<}j$�����Գ��}���p.��#n� s��/�us���J\}1��D��"�H����=�~ⱜekF�e,u�t�	�8��M%g�q=��;����U�ѢPQ��#�Q���l�nB�wB����\T���,�۪#�i�MZ�t^���8�[�6J�0We �H�9�B͚֙);C��-�i'S�9#��������zO�����v�O���:]/��[8Z5��L"��R>��8��Y�uQ#9��P��X�[��� �K��8�>�?*�>uF�KM[���w�?��N�~y?^h��*�峯>�Z��q��VH�դ�YH���^W�����Ȟ?ȹ���hGg�}p̓�$F;s\q�����j�K���Kf�HJo]�*}�b��9���^5x'���֐o�D}��9�?Aڽ�eN<��\��b��Aw�\Ϫ�2Y_7���@U=��}k�7�o��a|�Q�ތ�����.��!�l��]A�2g�WZi�G��Wd~��� �/�����F��ۙ3ۿ>�N�H^v�?4����^fa*8=�q�� *��fC�;�5Ĭ�
�0�*@� ֒3�����SU  �|��4�DV��f��̉� �{dw=�j= P�%WuW}�O,Fq�
��FP� ĝ��(�S��6��`eO�g�B�����)d�J�$�o_�O��JuФu��7��d�5��{w��_*bU�9��W>\����+����>+t��om�̓�*�2D��@��\2ݤ�3e�7Dάm�+`�e�;�{Q暗�ec�믵�Lt�%-��P�b�i�� ���r�1�i�R�_m_��](���m�,�ʜq�߸�]P�^�g+j��r����y�=���5�%g�!�`sZ�}QN:ؒ��N���[�jI&O���rN�����n����=wa�M%���yA����S���6���i&5�><iZt�'��!	#Ff�q���Mz�R�h�C���]w�k���,�݁\��ۚ䛶h�sx���"$�b�1���Z�������Q^Z/][i6V�J�-�ǐ��lj�wϧ�]	��*���g��]���s$J�#�}@�XKn��}LO��ll푐���LHF;�j�D�?5=?C��K��tX�Q�ː�g�����½H}#��1�խؖ�b�L1���ݲ~^��i�g>�I�n�u����6�aW޻r�rpj�4������!�m��Hv,݇�s_e��n�c�Q�+�&H�d#Ere����j�$}W�I0r�0�QN�w�)��i�b�8t�f����F����2�*a'��C�v��z~���\.��T�y��9X8�c5���Ks�,^3�]���RZ��,(C�ȿ	F	�~U�(��r�u��^�gHX��F[ܽ��*��3˖<x�g������Q�&˓���O��D�e�e��ݻ���g���z�O��+8��<�o�-ZKy\��"���c�#�]�J,�[J�9��gPG�,A^C��Lw���Wd��"�'�H��!�	*�^�ԙ"�<���h��CtK-m�Ɖ�,��qĖNU�?���g�Q��+m��j՜W���[�5�� a�z���H�e����f2FDI�XL� ���~�F��'_�$���ܴ*�N��$~Y�[$��S�C"4.a�h� {&D3�������e�k4�H�L 0���ʕ}yS�O��D�.",<²ϵdX�T�q��i���(�.]$�	�xLc�_DH�1 ���N�ܲ��S\=�����n�+�lXS������N��Gj���H��y-Y���֩'[K�H|.�[{���H�����n��	���������%��T�I��X_�+��� y/I����ڢr��D�f�:�I
*�G��w��S�j��4m#Qյ���mE��.�w%sؐGʲ��|q�����js�Ԣ��G���a�$���N�U�ކ�n��[c�P�У+�pH���K��v*�Y5	�}BY�;�8�cŃ�H<z����;�Eۈ����#��ʳA`U@ߟZ��PO%���v���)��c�:}ƏK!k�
I�ch�o��p��;!%GG��4�F����6G�<�4mǻ��W��B�g����o��:�I�mJ��O�6j�VET���΄���q�C���>�d�e�pH�O��nt�I2+�i��j�L��eG\����ԟ�b~�լ�S�uR�e�"yZW��������,�#���C�?X���o���Z�r��~�W��J����m���	JI�i�IC	`܀�~/�A��s�Z���!_:"�����)�� J�^�ꈞ�s��hUG��M���#��Q"ڨ
 �7Z�&t��:ß��� �����ت��*P���\2*A��8�w��@�1y8;���,m�����(��dq{o�O��߸��I'�hI#�n��zr����xb�pK�P����S��h������JyP�K`�F�?�\���Q�8��"��+��ݨu���(�t��H�n����!��GϿ5~	죓T��G�5�6�t�&��I+#�ʄz��|�֬�b��ꩧ����gi��$L�9���j��-ҡ�Z���}���Y|Ŏ����?F�?�j%kL� ���{J��+ �b���*��/�ks��rڡ�
g���__�ZՕj�B��-��g&C$�Iy����O[D�#*�vߝ��7|�$�(���
v&62g��%�R�N�+t&�bB'��I�yS�8��[�Q��dK��-�L���	�Ɂ�+���X�C&�40�K��C�eX��3�������� Y�{]�Vy�(1��EZ���;o��n�������8��E�O��G��VS�YN/��~�}S�hP$�ذ�F&���A��� J������&�̠�
7nf�#�=Ꜣ�I���z����8�1N���S$Sݑ�6E�V�Ѧ�{���yq��V#�|�W'I�k���2��/'��C�����ڹ��-Y���A�}	����f���Y����{�Pޛ!Ȯ�-5L�<yI6�6���=;����Ϋ
�d���̹S�w�{⺖L� ^�ڜt"�<A�����h�g5��<�.�E*`G�5/.��5��o:Ϫ���캻G�Y�Y���y`(P �������M˱V��Ntv���Ko<�Np�28���niz�������Oo�u�}ok�̲��8Y�SǮk�r���)������%�D���{ ���q�}}�=��jꈒD�m�$�N��1��S��_sZ���(�:��G��t�p�`�O��r�0�?��6�n�2�^���8��r�7.	x�dLs����Y�$�I��M>�+�^x3��,��{���#&��W��L��̞cV��Q�<q�z��z� P+v��I��
��yR���T�i��B[HZ8o]`Yd"(�r�G�=�V��_�4(���O-��F�|/��=�J~�� Ш��qv��m�0 ��\�;��.*>�}��S���1yҮ��}�;=y�K}�����E������*�L,��s�`p{��qY�U�e��g1�l�]k�-� �1#�����InL�=tGKï���Mw�=g�0���"� ���Yɵ����a�Ϡ���8����w��S�v�v����k�c*U�h��y<_���^��y�N�������\�'�գΟJ>�xy�b�n���Z����"��v �����9:=h�4��{�L�N�[������܀�cr��~*�4��ߏ����_ت>��y�^��������;����~B�����J�G$>��q��Oky��2�ps��D�H����O�ѺYb�1E;�4F�Y�#��y\���L|~V�/�-��&�d��V�3H�b��Ch������V�j��`�{�����DIj�(����w�j�tUv�>�8!]�=)�<� -}'�c^��A���2q�f���l`��ahѻH�����$���T��t'����i<�%��n�E�}޹����8Ӳ5�
WS=�cV�q�9�|��*6[B.'X��A���}qR����FAǨ�F �� �rT˄m�  �
J>_�ѳ�l�8 0��Pكq����� �ހ� P ���KQ�n$@�T� �	���b�om�%@�rGqȠ4P#��Y�I2H g��=�4�"2�co��g���(�iW֥S�0(�d�dG8�{U��>��D^ꚥŤ��m,p��U�)�m;p~�QTU���+�}Fɚ��%�G�׀3� �;Q�T��4s.ee�A�2� ��}2)p8t�6�"�`{����8�'��?<U�hY�=?̿k��I ��������թ�+�S�]�ߗip�v�K�~����;��N��B9t&��]Hm�R�ZE�8��ǡ��]�Zh�7��=��� �HؠMR������^��$w��~�k&=7!�Z���������;f")&�=�cy.��G�֣�Y$���ڟ}�̮B�ow�猜0!��e�'��˯�x��q�I���M�O��Okg$��&�.����3���b!��Ǒqp�5���q(N�Lw+����It)��ї�6�tJ�@�$��c�՛I�M�w����!��k�R��^�����Miq&��8*O�UIcz�J��Q>��N�K�F�&��Ӿ�ݻ��J�<�߃��n[lͶ�@�uΥ�:�\���X�E��4����L���4� � ��E6�ett����M��cW�m���T�co&PF���y�q�i�#��]����&�F��i����V����������n��+Xc�gqz2�S[CO��K�Wz��Qi:��6/8�X>�Z&+�(�+�r?�t�ȭ�fQr��6Ҽd��޵mV��k��!o3r�'h�c֩,/�L���ȼ=]y���$�S�X���Omq�'vPpq���Ҝi���F���zЦ�Ժ�\yS�ׂa#G0g��	��On+��J�h�*9�+!Ln ����F\º��x#��y�CO�֯�d��u����He���z�{�	�o���FHa��K��n�{M6T(f��&>�=�֩��Bj�E4+p��a�V��1��	�@��m�4}u�B{��G,2�l��e9�.�ʯ&�
$.�:����+=KȸI@�-��n�v��Z3m�!��u^�[��2>wn]����Ƕj���C)���&�{ۘV(|��+yГ�Ōdd�V6�'�A�Hڎ�c K�A�mu
x�|V�V�E��F��-�)���+�0͂��8��n�ܔD$�]^H3r��f�mՋ��f��s=쁮net����[o�C!�`*�bC�����T_�`���TCdOu�;��⯠L&ӭ?�]S[��<�t��d��9��qT�֒�,/�vgŁ$AіĬ˷[?��W��(��-NU�}0��C&$F�v�I/j𥧳Ӫz6_ʉĀ��6�+O��+mvAz��/���K�")�dnxa�qZb�.,�,yA�>L����h�O�CSf��E	�LJ����3�������؊]$q�ʑ?������j
����h::�����t->�Vis mR۷�<����L��z����'uxw��С�\F���w�s�+�x�tz���Qyn�� �'�u��2�["��sM�#���ںc]��d;�^�^�����a�<M��[ ���a�+%��~��	/��G���E����J۶J?�ν(MMvx�����)�b�N9�2&�=���ۇhe�]ʹ����=�Է�YvH%��x^	�pa�F\�}~/n� ڜ�{ �Uht�AbÄ�6om�o�Cє�ĺ,�g;\����H `���{���G��M�ܻ#�"��S�ơ��A'�A���6�T6pݍ���'���@� �� �3�1@b�(ZXݩ���0q��=�CӲG�'N����[H�H$ �L�S�'x�ր�m�jz�[V�u��$�˙Yx s��j�X[&�zN�q`��]����?&���
�>y��Q�]]vM�_n�״.��.E��WlJ6�ǿ劉F���PvƟ�WGyn�L2�Q̫,!��2y�����U�)IYW�N�ʬ�ʗ+��I���܍�~�~����9�Z���Z���졌R ��摍>��6��gV_ڋ���ް�Ȥ����R�b���F�Ȓ�  ��"J�?��L�(Ė����n���ȹ�K�'�q$?g�Vi?BP������;`�K	-&��!�1�U�b���m؍b��S�m#�m��[����z]�3ic��v�ZD�Lb�J��q��Q��Ǜ�u��H���������*�8���)�/Y�1jeK9� �D���Hn�ǥU�B�L}�\���c��@0�O~s��ErV�e{{�j��,��2?�>���~Y'���SX�,h�?�m��T������D�K�i%��o�"���N�o�]/�][&����En��9?��f��-�΢��[��FԯuO�d_���V��CgB}��	m�I�`0�&�i�
w�?�q\���͠�4\-x}'��s�ã[Z����J/pV��9�H�wg��Ѷ��aʝ�m�H�WS��S���mZ�f�E��.�ˆ�/����<�Q�Th���в4��H�#�5���D�kY"Ĥ�~B�yE�Q�j�\�m_W׼{�{L�z4����ndݴ`�>��Q�դ��R"E�7�7�gZu����E��y%d��3{�|�ɦ�U-"���c�~}(I��{�Do��<ǀG�|�V	zj�G��n���o-�?�!=��v�z�U�Le�e��T��Dh��ܦ�$`s���qU�i"���%�H��w�c��ϧ�g~�X��i$�K����+�e�s��g�K��)���xԭ�ӑ��จ�ܝ���I�5udw��}�0�f[HK5�y���2T���Uv��A/P�0r���"<-ŗ�2G�o��s�[�o:�I�DX�c�����_� �������{���1�\��2�m����yI��t"��L�	�}�Κ[t
�I�8e����X��0Z@A$ی�Gl������O���FL���L�����'�⮐6k�v�Z���m����O�C�ʡ�Ŵt��@�W�5E-�) -�@�#&��*|R=�T%3�-�Ht�f��y�%��ɯ*SoTv��bK�n$��7m �c��Dt�K��n�Ғ�LtL�#!Iȭ`�-��6���������#�5MB����ָf�w�+o9�py��~3�T��d���Tus ��=���*�LH%�lL�E�r=�Y�rj�;1j'^��<P�-����BV����Z�/�z���*/���:���%�ռ��a�j�-Y��>'�{� O>�dX� �f�~u1���L��Z-��{�ǻQ�{�v�6�J���\�g� [��Q��>8��##  1^�������)�>�U��C�q^��(��}>�9�Q�v��?*R��=1N@� �d]@Z,�fX��z�r����u���o�(�QF^}jw�b��ݥZ����/��Ċ�a@��xx�f�f�C"�3�0�$Ya1������S$�T$��̬UI
2���@z�h��� ���1 �ݐwۏ��@g@����F���P���
 �
F�X_�85q�ȡ�=��їV��.&V£�b|c$�ҷ�E&B\���=�y����h���=?�ZI4��[�oi�u0�w3Cmv�n���d�ۊ�$RI������O=3���j�$s�I�@�8
�'kvϮ=�i��}YG�eaq�2K,�n'��\��:H��(O<�ճ�mv�����Z�\�[���Bʳ��r����Ⳕu�&�:E�-"�̬�9&�(Fv.{g���'��rIY�}���#�
H�ї�qǥ_�o�c�&��Y`[���1����J�n�!�CҖs_4�0y{T�HbH��?J�}2ɍ�i�^#l�J��<�d��c�� �tV���&nn�#+,'·��n�R��� R�dǦ|2����؄λ��뚋Q��n/�I���tF�u$�B�e_5%H�~^��=��#Hh��� O���BR�8�}9�{Ԭq�Ħ��mI��@�q�7{��W�]��%;z"��F��Kn��&']˸��J�'������Εi��x�E1��'n8>¹����_�wDԬ^	b�;�`Z�4�O�q�U�}��_4� p��ylpq����+E.Fn)"q�����S.Ua�ܱ$���[E)�O@u�P���SK9m������8����J*J���\�����ynta{&f�	ϣn	�Vo���}=�D�� �W�w��gV
� 
���D��c�T�i�E�P����t�����.�M��_c�9�Gɇ�ޅ:/ڧV�,��&�͑���H>�/~�v����Nu�sԚ���x��o&i�'ݎj�ZD�C��@�� ���� (HP��
�R�R��K%e�Fv��sS@��e��I�[Y�g�8Zܔ��'9� Q�~���؃�_�y�(�X�ȝZP�0�֩�Z}�M?�c~�#L� [����#�S~�i�V�v*��M{t�om 1C7� d�'Ӂ�g9\�Q� �yH����������dD���%쮧$�u���r���g��=J'eu7Q]iY��ݴ�U7J#�\��^\`��Ω7�Bw֯m/�A
���'��~_ʪ���f�v��V��O�i���~#�>��ʋ��L�_��XZ��6�e�S�6s9�h�$�5���o-I�����������2��:��fc���4ѥ][��e������7��f'���o��RP�?��^�]H�go0B|������r�|<��.����z�����y1-$�*g9�����B>�R�+���_}���4hΙ�mq�T>]�����j���w�Vp������Md5�>[{�L���I ��zg��=8SQnG6����ש�T�m�up,S�Q����0޺�h�bI���Ԥ�9��Mha��@��b��~�*�f-R�;�Y,�"��o֔A���F�xhN��y\�pil��rٟ<$I���T��1�4j�hȒ�YV�V���1�wJ�蚱OTٶ��g�7E��ž"?*�EQ�.��mjSH�G&�!,������?:���Տ�O�z��a5ʘ��v�BVI#/����O�쟗/Q� �������Qm
���w>�ά��J��?OI�k|&Wy�h>��F���V��+�vQ�Km셃�-�q����z�4�յ�k(�W���˜p{��蔭���t���M=�B��`U�K3��q�F貍�uގ��a���[���Q;�����i�E���� �5%P �I�l�fd�����}	(IxxM�ާ�xws�Ge-ńwOv�rs���^�G���f�]7�'�����1�	������o%��A;$�y+�	H���I!G�C�U��BV��.%-/:���	Qf�U��r;�k7X��4IsqeK�7JC�~%��%�uy<��[`
}y���:�k���:b��֡�H�Ws���%q؃�����f�/��K�{x-�Yd*P�RB��s���� �v��Yt������[sņq�[.�tQ��5k�v�s��u��$��.e��>��TT\R�xuw���ơ}r-�����J����M9�̈Z���xtؠ{�cl��A�����j_ҷ��#J�@��E�+a&�"�*�o�G�q�$��6�h��#����QVHBJ����;T$� ��%����igGi�Ē�w�=ط����"���V�E��d��(��w1�r��Zw��7�v��b�[y
�2��Ì�������e��D�{��&1:K���rU�x���-�,��H!�87�ª�$��Q�q�z�~��e���`�I ������Ϸj��t]��	+!�����ld��*�e)+66���E�C%�P��f���)Vٷ��k�-���E�Mo���A����9��98�Iz��ռ2��%t�	�ҩ'�?#'%tc�(����Җ�]Ckv`�H���'���#o��K�Bo-�1}���2�p�l�� ��j��(��`;N��@�E$l�D�G��т��S�j�f��aoL78��<m�wdc8�� ��* ��1@�Bݱ�j!p�8�89��Ԡ*������X���� ��~u4��5�?�]@��"Lg�W�j���J�1���p�O�M�O����WIe���QZ�w:��V3���VC�C{�t��gDJH��n�->��]����$c�� ;�U8�h�z��aӭ-^U�%�Ŵ0`=��Ҵi�c�S��fᡰ�G�*�	�Y��1�s�kZ�{5ۻ�E���+֖�z<�Il���Fs��Vr��L%�\�;ף5�/:R�MZ�;mVh�Hq��x�U{**IH����i2�t��	c]��~ = &��oVJ�A�^���n�~�����f�ʩ������~�/�7���c_��W��ļ��[c;�-���#��*��׼��	��6�i�7����{��PD�M��ʧ���#ɘ��0@ߵ^)X�'&�J�%��v�J��^� �ڲv�͑x��4Թ�KNi"�+�뜂21\y�P=r�>�i��A�\ 
=?�xr�l铵^��F�n�ʜ�~�;��T]��A�����W��i�H�����Q�w�5��!cq}#�S&P�}$t��=R�]"ct$�%��7��dp}��s�ջ�6�?42y{v�#�I`l���s��*H{����<�\O��Q�m��v��5�7k0�/�7��T!�8هpq���V���	h���	d��8`%PCc��Pʞ/�~�{4�U7�v�p?Z�I:�m�_P����uw
���}@�P��L��{��=�z��ך��;#�H�sN)�f�o�cߋF�-��.���b�V2����QfNG]z���/����U�$�O��W�N�w�~�hS�4�bV�h�p��=}I���cG-i��,,��D(;��*�j�%�hSZ^�6��<����]�+�%�=y54�aM��\�w������W�>�z�����#Ė9'$���C@+ҕ_T�@C2d�l�Q�$�%�῏���}sӶ���f�k��g*�Hn=�S)�l����O��^}�������xX����Z���U*1���o����������e=�ǶZ�t8Zs�?j=F=?G�m"	_N��Vi�,��d~����Z�v��ŏ��ǉz�����إ����r'>�T�+�R��dwA���B����"�X�P�!e�=ERSmh�E��}�/�8~�N�ik�8X���y�d��▚W�CM�'�k�Unu--���9���U�T�qD�����hɧ}�B�ͳF�K$��'<`U\ӵ�/m�3}��/.n.�4���b�� ��݌⬲q�V�i�ȿ��0Yt奖$/�'���2��~�:��Hn���$�`��=85e�/B�M�ږ�C�� �Hn���W��U^F�[��R�N��M$�H�F�ؙ���}�i�z�������[N�8#;��q��,�WB��� �6�����p�0"]�[؏cVy/�8�s��.�u��NV,���RcԏOʋ"��Q�$���ԣ�1t֞�-��bT��~+7+,�0�~ַz�Gq��<�	���pI���'��ʟh�����ΔH�23�P8�9�j��R-~�Z�wS�>����N��g�q�x��tV��{�u]Q����9W���O�j�����3�$j��s�4��dC��"�n98���hQ:�Ԉca	������T�^�Ro������l�#�r����-���*ɿDC<Iku�Gh�F��ə��֥�������K8�0Vhd$+u���ʫU�&Ʃ`1��e$�
��ǩ�S�zk��X��~�~ �3��@ў1���$�
 �
 �28����W��_�#�=H=��S�&�e��Qn.�[2�LR� 9�֚� �m���T}9$�[}�<7	�D��0��{�e^�-�E��n���5�puJ~΁��.�~��=�?O�X䛊��n�"	�h+uquoi
*��F��*~�����fiZt)��#�E��;G.]�\ �#���7w�D��U�g�&�av��� �H� ��R��E��K��GV���u�m)�[|oĘ�u=���(�>͜%�]�q�x{�c���)���J0د/��]�Ӌ|���k4)�I��F8����9O�~]W��'�O�F@bJ�9=��ƛ�Eg������ږ�w�^Ig}o%��Gk�*�"���5Zdˣ�Eзy(���ͻv � .>�[4WC큂��..d�K�����m!~�vnn<��,1�1�w.�~=ϥN�����0L^YJˌJ�x �O'kG��?��_j�\��׿���(t9 �p	�U�TQm�ǌ�����޽|α��}��c��1E��o�G���bn�ff2�#<�1_@��:8T0�|�S`�K�,%��o�*[)^���n�����m�<UT�4�2Mv�ʛG���s�z}j��:"zո��
���$q,� ެ�ۊ��2��k��\D+ª�p�׎=*Z��9��T�q��C�s��g��/���Mc�n4�=?h�|۫E�.}w�O�f��Zz��o"�:�Xj����V����!_���3n�����|�Ўiǉ��f}+_�DA �k�`�8�<g����g���+��RA��<`��ޭ&gԓF΍3���� ��;� O����V��5%cn�)�����o�\r&]��oKei���^����kM��� I�-ߒc>aN?�Քr)z��)ò P�8=��jeg� �zqN��BDf�0�7
���hX( y�@b�(��2��2��|@��4 ���΀�@G��%q�{�'4 h�6�X�>��>a�l�� ���v�����@ �9�Ƞ6�crى��q� s���=Ci$����	�1')X���N�D��#�VO���ⵊ*e-�N�2H<�y�B���m��>�L�6��w{u0.
l�d[��
�@���6@[��t0��]�Z>�Lgq��;�A�&��cx���[? 0�I�8��խ�S��+�[�"́�*�nޢ���X�:s�5��
�Uud����� ��Uuto�9�ݳ�N�>7�X0ǧ5/G:4�@@o����_..�$��VJ�!��i��RDM@��Tvhe_��;q�8��e[��仔��HIU��uA�@���So���;t۶�$��nr�����'<;��ҹ�v�KƏ��_Z�kI,D��# YI����T��Ѽ�i����'{�S�If��m�yb�&9R�N;v#��]qnH��Zh=��|��o0JA@�FH?����$�M���T^�xy��u�3ߓ{q(���a������,z�����+�m���i�`�u�){��0\�ˋ����� R�6����;7QD�B��#��Ȭ����n�,��k"c(˂b1Z�^�{9wǿ�%���&��-B0U&�0��׷�z�|�Fq��T�G�~j�_�e����eh���r3�Ú� �Wg���}+,	Q�]2Z8�1�9 �֊�F�N���������`�u�Jͦ��"�v]>ji�Mo"�b%RHNr3޹���:=���D�[�2	���=�+���m5Rv*��@r[�{U�?C4�s�C�WO��ګ��`����5�x��Yϙ.T|��X���b�Y�6{�=���9m	E�@�\yx�!Rq����=vN�o��\ݏ6�G�E.s��®�tQm�Aԓ��ci�����X�88�}�j 쉽��[��q��;>����B�G�]?E�����-n��H�l�)B����֡��O-��|�U�m�%屖8�O1KC��������ѧ�t����=�GZ��1,z�Ix�>O#���W�>[='�<6s�Gޝ��M$L�$֓H������v4��8!jM!H�Z7Y[y�ӥ�W8Y6| ���Ƕ}}*��˒T<��Bk��U��I�k1q#� �e�=��Oj�d�T��1K��ex]��������-rY���6�b<��>�e<�ZGN\l�.�瘺�
�dB
/!A����hݿC��g�K"��P�Ӗ��m�`��ַ�4�NЭ�IWA��>3-���Ҩ�q�(��ˡ= T~D���z�j��n���q�22}+g�ki�.��>�uxZXm������j�᜕��d�K��N��OP��-�_��B�1�gx�f�Z,��ʹ����U�����>�kh��d
S����j���y�,pÖ? �ݮ˚�@P P ��\e� {���pT�=� '͡X�0;I |�@xp�{b����`�@��FOZtV�;��h�ae����'�$�e�$�,Bv�Ò�=}�h������5�E|��b�g���Z��<�T���9il�t ��ϧҪ��F��F�).�#�ǝ�Y,O	�� ��J]�,zb�D��;�K�Q�������YC�6gH%�\o��)37p����Tǂ��l������Cq<���g
Z69���ϑܷ�H�%������c�����{���$���;_Ӊ_����C�Nј�e�_/��ǥj�8P����
 d�Y���I���>��b}�R��1J�q�<|�d�X�4�
�N��7M	�3@!�O�	�$0�֩<���k.{D�N�0��ym5居��˙W�鑟�Ux�[5��H�zw�l�+C�Ӵ��̐<�2�����I9M�h�`��;�F'��� 	���Nɒ+��f�GY�iq-��<`�3�~c5�>�L�$*�)��.������Ұ�D�vF;g۞Ն\��gV,m���#��-���,��-���e���I��-[H#��.=W��\�M�z$v�Ja�o��Մ��[�Hb8Ԥ����Ex�M+�c��Eq��.J���,����*c�h[{e���k�=���LX �����CiG�a<*}����RZMWA�[gS�<q9n=2{�ֽ<~K}�������]�]o���$��{�� �u�tq��t�_��Y��eTo��d�ڹ�-:;|wR>��{~u.�Ӥ���ϰ�|��ݝٿ�tLq��3�QH�S���6��i�� �'����s�W��+_�pM�6r����m��G��d�^��e�z,�����k�+gd���Ls1�r>_��g�1f� ���x��}�/,m�%����'�<1dDH�O�ަD2:Dd���童����m���$���~_J�z8��ի�G�|�{>���	V��^sEd:dw\�)�2�_;Z=���~_�R��!����#��95 �@[�	i:v���K�<�,۷+�p�n}9���QӉ'o�cu���宁$�Y\4!��d���P�� #Yp�$u���d�|0�v�i��N��9�o�پgް���I(�KC�:.�m�)l�;f9e_@~]�r��ƺl�C3��4m�ذ���j���/]�I������]��-�d"����w� Z�m���'b{����ag}��ّd$6H�*�~㊮ʣ�S����W���%A$
0O�GϷ��+�V�\�|4�n���1@*ҋ�N��m�yɵ��G4"]	hH�I��ֵ+kP�ss"���fc�3�4�d�n�y�e^����j���K{P&�X�f��~Uۏ_Ԥ��<�_FzY�:�X�WM��Zۼ�,�HS��O��9ʖ�4��dj?�t�n�Xcy�y��
0c��9�����>����eayh]U��d�w�	�����(쳎�Y����:5��M|׺d��n��� �?�Wv�%/B}�i�/�I��kht�A�0!ۼn<�Tzs޺j#mnV��W�=OF��[��y�|I���sK�kcEf �P�
$�ʩc�ɠ��@'��@����@{XY���7(�4�m�y�_0�$��`w�<g�*�`�ŴѾѻk��I����}�7�a"��K��<�.S*�d�q�2*�7���;4�]O?ܭv�0�D�8Q���+x��կ�Q�-,zgOҠy�w(�?qbC1�>� *ұ�ݕ�M��o���I���>G�*����T���b�O�4ǩ]�BR}V>8�1<(=�2J�rj�
 ��Ԍ%,�e(:�1��+�*���� 0,]'�>'��`� ��V[h����n*/n���6�Z�Lɳ�T
�,_$d� >�Ñ�z4��u��B�N���ԕ[|o¹q�Ye#�?�H�k�v
傝�x�������&�@�[w���Լ��UT�I�跠X~��_]���+$�`ۆ�~g5�;6�l�uֈ�-�W�#�G���D�S���� ��Ԡ��1�jT_^��K�g
�J�����^~y����K/Rص�x!c��{?:�rIh�-�b=f���i��}i��i4�f�����~%$ȫ*_IGMv5_h/sp����7.;g�*餭����yt��~�k
"��3�+��;l�ih�AmJ��c9�R��d�Ol�_uM���&�(7p7�֋�M"ܣ��a�$�+*������Qk�3H���cټ��0��Q�!U�Sj1A��d^2KU"��%�Ǳ�uk]FFKy�w\�
��.*�e�R]ř�����Aݜ�f��G�o֬"����v]ݿ�k��I��_i>��N�x��:�0W�6q��}�m���MLc�t�N�c�vE#�=�L�������� �f���]ǘ�B3����f��S*ME��>#m��ێj"b��g�ϴ�P~��'V�1B�Z�����WW�*ݕ�H�,�奼�G3�f (Q�s�:�ɥf�RrI�A4��.��k;/ږ��F
���f�<��ގǖ�ް�G�.�gq��#�(�poLsZ�����.x�H�����=i�_QjZT�ɥ�
&F�����RI�F�&��x�C�yf �C!�|7�{���9�@��r��	��[�����!�3�b���ү%]B���9�;6����������������tV��Y����R��̥���� M����\����ȣEt�_M���;�Z����n�1���V��OD�����Bi^�؁$_��� =�9c��в���!�� �� W����:/d,z|�#]����J��u-2�麃%���_�bF5O�{E�>,w��%鎜���m?Ι�)�������Ty�Qv���l�>�]7}�}-jfDKmZM��It�w`��ՂJk�8����'0Wa� �H��ޫeq�L���!�{z��7!*�CS��#_��m5���VK��i��dq�6��Ub�]��kc�Ht毭%��ݥ�FVB��� ���*x��\1�Zl�˃M��<�uu	[�ł3���p=k��|}�))"��+�o�3��4��.�I@�#���W.h8J�	��+"'�ʰ4$}	�_���{x&&u���m��8��O���Y+�y�mo=�F�_�k��Oc��5޶f�E��q����PKZH6�=T���\���n�Ɖ֊���`A}+�֋�
 �3�(P
�%X�?��g���o;zlRN>����[��R�@���I�Քe���@�'�O���`�Lx9��g���[��쭳{Iggm�օ���H.��O 0�gޯ���=��7�k��;e-�2��x�y�T��t��h72K:�\^4�P�7��7B�ʬ�����"�1���}�@Y^�·ӹ�x��Z�����v�O����.
�]���~/��s�����U�m��]Jᣃ�t��d��<�8)� ���No�Q*?rq�� g�:�i�.<�ݤI.����⢦�)Q4��:'�wҺ��wZ�XԤ`�Z�JD�{���#4\a�9w���мv�t�.����(��ߏ-r0�>�޹r?����$N�r�~����F>�l[�f1�w����V�I��;��癮UDbJ�v��d�֬�5T �
U��O�E�)�����(<�4�y�?�v�8�'ڬ��]�Ih]!��jP�ږ��k{����A8C��\����������+�-��\�M���Hޙ� �=;WN*��������k+@���P�>�ʸr�M���Q�X	�?Č�B��<W;I���3k��=� ������9� ?�m^�%!GO]�h�<���G��/��Yʯ�4�[$�3f56{�C�S��Q9zE%�Z�F���#�0Lr+�x����4��Zx�k��CVm"��6U��Y�$Wg���^���fm�4sg��e��z�h��}n�`�k�����઩���G?��e؂�z��}F_om���\X�<#��x�ڬ���>yp��/��;�u�oms���}Yq�g�-Y���n^={��c/Ң�.L��S�׃�2���+�u��y� d��E��ᑎ��ִOi�_�Yc�.��ᇎ�ꩭ�y�żd �b���
�Q�9{VY,�vu߄�h�;�KT�����vz��
�߃�xټg������vY�_�+	
1 c�Oʹ����E��?k%������J6p��E{^5����?�eY�S/�(��7nL� _�tM}:-����f^�/��Y�l��ʼ��JZ=95<e�Ԛ��ѯ.|� �&|����7-y3�Uj� �5�ٛ��������ڽ��� ST��v��
�w0�A��|�i5Fo�]��ԷF�U$�=cl�S���nvC��P�[8Yv��H��޷��F3n�G]��j���;,�8	?�s�ݏ'�^QG<;g���`�����"n�c�]��?�O]�+"Z����#T}ʀ�+��8�>��V3�h@�+4�5)q�k���`P;r{��*�HY|xca����+ۛ��[+ko�Dr0��s��a\�:0�2ۻ��ִx�u����̐�aY���o�6ׯ�=ǹk��r���v�Jゟ�i��ɶ��K�����l*d�klPc��.�Y�E[e��Sz:g�u:kS]TК����m$���H��pgjr����z�X��ZҺcF�{MI����lܢHo`{Ua1y%��y��z;�"�|�k��<��q���9=�s��k�v^rQG/}��i�������kM04�.�����k��ԯg��7��5�(����4����w�e�0ÑB%�D$�y%|D�}=�@N���(��$s�~8��F�H��نٜ�rtB�:��2y2h�o��,ǩ�k��[��I��t_k׉m�����J#��*'��T�z^��ůS��>�[������3 p7,��?�ZIeT�\:9R�\_J�#���v����^K{:z�m`s۞���|B��ZG-ٞ+s��0[�a��ֿ6M$�DR.���k]g����� �x�����v�NQ�L$W�}�U��,mB��BK!����Ye����+C޸�LP��@k0� !Ƞ6��&<�_��X��>F��%��6ݡԕ#��D��$���#:��'�%7m��t��>I��g�F/-=e�s��,N0�|�津i6T𺆓m�yn�eM��l@H����Z��=X��_�t�x�E'ϳ]��1���~o%B��u��W��%�á	ol�d�8��9����O�w_���uuf��T�5u���0s��7�#WE� ���ä�7/��j��+jl!���i�GiY-�_}+�t�h�;k1>�
�$��z>R�*��ޠ�����Ӵ�Y?�d��⮣�e�3��^���w�啦`w5i-4J~���-�?ji"���7����n9 ��-`�";�μ/z������*�/��~��+�5��?�R�s�y�{~Uffx�@�T\d3�#�$P��;�+��:WBӭ�P���|�s��<w&�B^��x��&�6�F�Q�gG��|�x��M+I4c�[�K�	�����G�Yy�q�Yd]�H4�����'��R����uɤ�2�P5�4�1-�>gҴM&��U���NI<�$P25b�S�9����h�/�\}"�U��Ǖ�`8�Y?s[&q�,v{N2��{ދ��Gt���uI}�5�P8Q�~���%TT.E�}d�Yƫ�&�PM��e'��Ҵ�W��e��=��suWS/��k�p�G>u5dg��ѽ�� u%�Eޮ���!i�������=H�ɔ�V[��QӖ��ea��\x���n��R�B��߸���Dg}�w[xYmo�1u]��=� 	s��2����d��őF3�K2�s��;��xS��>7#yOtr�ژ�=݁�nI�b�oU�^U��O�X�h���~U�^�Aӣ�>�:��k�n�X� �޼���=,n��zx��6�Ꮅ:��hLI��`V8������):o�6�g��m�r�׏��Q*�M�Jn,e��=#N�o&"�c���=�O�W�O�f�J���`��X� ��t��� *�q��d�?By��om/+<@��M�y��ֵ2�2�3�\;2���]r�&�A���nY��'��$����@
�+�K[eH�ܰ�{�������+EIh�,_fi]J�7Љ�{����R�^G���2��GN	(ɲ��]*�U���)_G�d���2���/�.���ܭ��!7��H�O�{FJ������E9�߹k����G���5!2�oQY�5L��*ga蚮�֚E�����Y �^+����֟g.x�սW���$��%�Ay���9�X����1��3ɜ�|�Jnz���������~ļh�Aj7��0���"�a�ze��Y:%~9t~���gn��I���P�<�}�(JRȔ��Q�:��x��T�LP4x֯e1E�tR��,9�Yt#�c�hҺ�.�s�G�=�P;S���}cI�i�X��J4q�)�^�>�+0����'�Gyyq<X�>�T
�8�Ҍ��I�~Y�ֺU��2[̇rJs���n{����T��6���hZ=E�ڌ葬Gi����!ݜ�nq��z�N�!�4�]@��6����}�����I�.���I�*�<R2:�u$�#��bǊH�'�&��D�����,����Z��]^�J6tM娿�-+�@��?=��w��h���9�zht��\�$Λ�k)�J�ָrAE���.��ܛ7|��~.��K�����V�6��J���+�Vh�i{� ��[i-qle���~�G��{ո�ˮ�o*�4�Q�AG[���:]�?��Y%�{o#�$��J�Z����b'r���*[hU$Ǵ1s�1�g�b�t(������Z\���	/úT;Ury���^8� t���c�%n���g|��{`hǫ��]1�Kdr��^�i��<i�m���������f�N����b�DW+���ܯ�����C}�M�3,��j��$��sSn��%�I.T�J������EH�R�e".�,l�2��=���F�cn���v�˵�J��Wm2u�p���-'�I{uy�Goyn��ʀ>:�ue�:��Ѷ�S�O���QIź�t`������e�gS�w/s�5TT�p�.��O��8��W}��"�@�>Ib��x3+��FNs�BV�쾛�ola-�M!#h'�ⱪg���<u6�&�Ӓ ��hJΣ�|�#/��2�J��J5������a�J)��j��V�L��o�V���v���#�8�`�84�RMԅ7�r��*�J#>ב����� ֫�M#v�Hh���ү䱊)b�p��&=� ��VqmQ���YZ�rV�K���G#cg��eD^�d��V�7����[M�� !����>D�O��������I;I�� l�
���Z~��矑:���]m��f9�8 )�늕��~�>���3������4�E.���!��Ye9�Mu��4��s�f�5}���鞪�MK���!��k������Wʏ-�x�$�ّIĊ��<zW�h��J��HD%�����0H��$�j� q���V�����r"�)[�^��h+{�F�������LW~Z<��Օƅ#Gpy?�n���u���q����L�:`YW�	���ɕZ;�� ��]�k=tZxm�quq�㜀3Y�[��o�>zu�SA��J�vX��ym����<~��G}��'����-��nLo2�b���Q� �w8�>X�{���n�7��\I"c�K��8�����D����:���e��ю޽�	��HEf�3���W��|��d�'���i8�@zY]C �a��ڀ�|�H��H�@D�ĉp��`~UL��l?��F���A��kz��H�����Q���K$�Z!׏os����"�G�>#�H�����{1m4�Io�Z���&H�7�L� �i(�lz���Җ�Chp^oш����W>��';��NN-�׌�������"-�l��6��A�~x8�Ww���6y�ieI&���0�ak4JC�$�2/n~u�y����&s��;N��K+;˨��Q[�1h�����w���y�M%H�z�8P��]ӆ������CօeЂ����{8�X^���6L���8�ퟝ^�d3�<�s��X��Y��<�
1{��8��ۓ-�4f���-����0�K�O�˷���j��KEI���WoL4VW^I�.��1��>���ьg�:#m�t��^��4�SW��yu-h�,Iy.�fۜdw�Ԕq��d�@��zGA��+��fWrr0p0��ګx��J���#�M�Y��^w�T~�G��O|���LI/R�VW��X���h`dr�h�莨��>����qk��Xm`ûdv�5%f3ӡ_h�:��5��"�L����v���q�^�9���m.�Kk�,m�;��~����ʙ�zMJKYĶ�Z8I��7�4�����͆�1.q��Ql�H�<�r>U �B@��=?�z�Vݥ�����ˀ�.q� �g��Jn�:W�_���h������O��+�U#����]�����E���qZ�����h�dq. � Z���ߩ2��ʷ��>f{1�����h&J��r�#8S�?9��;��aG|�o�Ī�-�8��~�٪~�&Z�[���nB]<�3��2�9'8?����l�$�P�v�#b)�x��h�Z��:N�gˍ]T��9��H�@ϕ�7꭯x��Wor�A�e?*��c�Ռ�r�x~��D�L�]���ґ1B�� ����j��es� ��+N�<�'	���U4d5� P������F�Բy���� J��\J���-��UG@ۏZ�Fz����[�֮���b���N��j��t� �D�S��c�]	'�!�.c��n��9�Թ:���KlSwv��Ѡ������E)m�� �~��W��u�΍�bx�D�TZL��$\<~Yn�r;U;%�:9��˟�u>�,a�	���#�Z�⛂��xӾZ ��ʰ���, o�q꧸�ƻ��th�Xr��+7ǌD�[��B�8�:���G�ȯ�������{����k�v*�܏��������7�+ך����fk�W���Nx9����[5��z;;H�7�2���o��\|��f������:d���N�6�YI��J?1ڱ��-�R�7Ꚃ\�<RG:�� ��r(���]
m�I,��S���zVwF�M�(��`��w�)ȍ��|��]x$�Sg&x��-&Pd�����N{�o|W�%G]O�kb��n`���c�w�a(�I�u���U���N(zs��F3H���I�A�5��|���}G�q�^�{���k��ڱ\���*ݳ�Ͻz)'���=���3J�N�CGt�b��8����&��
ɸFr�DѨa��q�CpV#(rF���-�{����c���3��������ҁq m�{����}O����X�0F8m�pG�U`�P�8�/�J[k}_�|��mc��4����� �x�?:���Q����Q�M�Ww�zv�u$���#�%^y��pPn��y�<<�Q�m�k�|.��9���I+'�&ڲ�xAy`�Ea �YdP�.N��9[�TS�$����:GP��ZEp��m�+��mu�Tr[��Lq\�u����ޛe[C&�G_�1�+�MŻ:$�$�=gӚ^�֗�щ�,p֭�rZDO�v��u\iRj�>t�ƔM��E.�1��<O5��S���'�q�����#޺�Q�];Am{�;u#^<Si��� ���I9V��妛�}}�o'�j����7�]ә��2��YK����4΢�u�`���q��1���]xRnߡY:EǤk��_Ė��L�*�mc��{W_̧qK��&Z��k��m��{n���>`V�7�V���G���z��_)cx�3I� Z��܅��)O:.�W�5۝N�g�yZfg�.X���}*eO�"�iD�:k�t�>��-��)�)��0k�GqF�F���1i#U9{C�l����ȵ��쩺��/\�:�[g����|��ʼ٤���4U����S�nR��u�R
9!Xv$z�Icz*�-����e�\��<��
�rG�E{��_�*~���ͻ_�mqn�n�O�%}� �r��I#H��r�n\�q�N}�q�Kd�{rG"������#8#��<M%莉��E"�tV[��p�F3�=Mi9�q�]=�t���f��D�`�ǎMw��ы�貭����$A7c$ʫM����Ƃ�Ir��p��O½��ڦ��	�Bs���pl�s���=���e~��G����G��Vr�N�I��F�fC�� 9VV-���X\��FT�T�zR���o�ˆ�c^�2�� �V�/�K��y��0�[��\�7}�m�|V���EӴ�o+̘4��F��*�ԊK�|�똁�GYG�P�rݮ�ۿ�|�\��f���,��y�U0�2P�?3�U;tΆ�Sڵ��ܘ�-�������{T�@
 �,��֒5,Q�8�\z���Y�t��^C�-��K�Sy�{���2n����m
~\g���-c���@Pw�_n��F�Q
�=�`Tllr>y���C[Z�g!T�rG�o_rRV"辦}[���]w>�}��U�yE6k	j�>�����ݴk��A䟠��>�f�m�Ʊ-�X�ĂI�2a~W=�~+ւ���N���z1:ys���$>T�{���OFbtԕ&���E�Qa��f3��ߏ�V�?ԁU]Ie��]L4���MT�#��i���!�mc��9�i"�@\�-�)'�>��_&i:,��W]?�,YgB�S�~"�������ON��L|>&�x��n��"m���s�c��㰛,.��WQ��2�ߍ��̀�xڧ���.8�t�Ml��O���k	h.@��n}=��ɊK��k� �=�|Z'J^���LH̹�<V�!r�F�>4rOM�;�:� '����d�}�l�F�,F�!�~rj�&��Z[)���P�	��[��*���$�6�@� Z�QQ��9r;d�{m��ܔ�RH���Sl�P/`���y2#�h$%�����`H��F��I���0���{Ɠ��DX"�� #f9Cn���u�}��:��H�(�*�����=3�h��6]�_-���~%�|���8>��P��� q���T(���\�\��34H�����4,���]~�L����e�
VY7,��s��>��oRH�w|����<�３'�	���V.Omub�*��R���\ 4.Ns��~�gҳHG��v7���WO�5��x�$����#�#Ҽ���'q=EpH��4x��+{h8(���s6۹��Ǭڶ���0DrT"��\`淄��Fm9���~�fn��
��r��Eud��72�>ӓ�����$�N<�!�vp�z'�~�'���ϸ&ۈ���|B�eЂ�,�tz��TӢ�>s yc�l�G�������Y���R%ܰ6���y� ���?Z�x��E��n�ґ��^d�L���pO�+v�B���l���u�j��� �X�H�xQ܃��E�2�k���/�o:�{yLs� �w1$�Ǯ*Ӷb�TRvWK���&�6�j�[��O�z�U迡��Ѩ���Ք\��s��1�ǹ��z[*���i☴��	7,}�ø�^t�gBCdHm�K���➴K�Ρm=��i�'Q�f��-��{��k��e8�C��k����'X��lz�[�)*�� �U���hz��?7���T���⸲c�/��X�ј��a�ȱ�Ҁt��������(�#�2���^stCtt��\[[An�"B�>%���ߚ�QIR2m�֓!�v@|�d g��Y���'���hQ�������?:���h]�HM�H�2Nv��z�Uz-D�KH��
wmn[�\zqSb�/���)*�E*� �j�q�RI��_���'�pq�ްzE��|�B�"D� E!�{%�V��k�B��������v�Ӎ-��2�8 �*%/F�TʓƝQ%�4��EZǴ�;1<� �k�}7Fv���c� Q�v���mA�gm�Ş� �򬤚��X���$B��qk1�V�-�OJ�;�v���_˱#�NX_r�CGْUA�AB��e��oor�D��G����~��_[g_[�&�����n�ڴ4k���K��w1-� �'8�kx���Jk��n��J_Y�G�1����ȩx&��tJ��� �V�������~}*�&q�yb5�u���V���$LP���y�9�+�DrŰ�ȼ��fC(6��l`W�����D��J}�z��㴹��NYom�b>9b;������e6��m�ٵMn�I�\L�e�b�sz�~��w�p�M��tCf��TQ)K�����:�վ��� [ٵ�������Arґq�Px<TҊ���2�;�yk9�D�E��]>Lǂyބ���r��b~���-�@�������A��s�Eg��,}Y���ԡ��{��$��K�@;����֍GT�IݍP�9����K@�S7��U�'*�� <�N�}��w�^Ek�L���3'���!���L��։�9�V�����̲�A��bl���\3�Gd&�+�ї�<1�����i"�G*�/�c������9�O����	�1u*Gl�~���V����L;,�`dn���XZ��6kV�3�4�n�����?��d~bl�1����~��l��l�|��p���-*�pF=�ԙٷH�Q��f�6�&M�����Q^��GN�@�q��Uf_*A����*���n���$š�����|���?Lԋ!Z���1�(N�dޣ<�'ۚ�����4(0���g;�����`����䢫!��؜���x�΀z�{��ͪM#�s�w�zS��]�41!�X� x�eﴑ�>�Q�h�wB�[M��I7q[`�>���G�ǽd��F�Y���y6�j���+��>�9��0���U�f+]�τ�(2G=�z���zyOC��s���l�3��T����1]�]���A��;s�mq��"���)����߼�����v�r9\���Z�J3�O"\��>b��I�n��f�`��0}~!B%Њ�[�gI����w��]�9�����t��'��V���m6������dWnFֽ�cH��6�����Ǧ\}�4��r�����*�L�4��|>𙅯Q�W��~se��`�&��l��X����/T�m��^[V3��o��%~�j�� �i�F�������d����~ʳiv�٫W�� VyIW�1\|Y�ﺥ��K�"%)�6���Uh�bҢo޼���yyN�Ԙ�Y�	G��-q�C24y�9Wr���c�Һ0�$�ȳ.������!�q�p»]�M��e�����ޅumu��1��%F2�����Vy ����TU��f�@[~hb�C��Hc3JY��*�0>��vc�K��L��r9���Ƿ��͞��i����ӫ�np��C�p9�j�Mt	$���s�*�ş�։�R6It�-m�����}3��W�,I�rK
d��;�.�~T�lW�'Ӥ�{8�x� vg99>�:�ԫ�I�q�C�}��y+���}���#�I�%�r3�� '?�c�H�����ǞJ����W��N^��WPm#J�P�,e��.ja&D��.��]��V�Ϳ�N5ܗ�-��s�+fB��BP���9>���\�{m���?��WR3�V��G&�)\�߽,�Pu���ḃP�.b1J1���j��h�t6�.�yi��� ���35�fA"��{�9�keջ�A��-�<6�h,�B���n9���l8�+w��B����ij��[�@Cw 1���J�;q:Z:v��d�/�w1?	��sս�wKEO���{����8�3Jk1\�`��=��t�8��6�-�-b��WΞ8�vRI�3���+�gg��Ii�i2�����-�� I�O ���jϛ��V���+�v�� ���]ľv�7���S��8��h������X^��:�7�t�%����-�#
�8��Mŵ:1FN<�Pl��8��
&9����=��y���6@:��-3X��I�[���.�dÎ ~� �ԵG,�#r�L���Z(r�\���U��+C�]iw�x㵞<Hn�$	@#����1R�e��}����4),r��e��ɖE'���9^�)�7ԷmֱY�1��u/݃�,RC8$?�J���B�+��,u�o6��]3������Vd�?}��W�>�7����J8�Q䲔}�8�M�"D�g�_!L�@�;�ߒ�G$s��O���}Q&�+^	k�đ�R",�OP{�jr'=���
���K��AnnLRI�����8����ǌ�:-8��SL�-��]a=�r9 ����e��﵉��5R��&����:[\H�g{yesF���Hܭ��'�V�I���O��:a��;�3�_��TN�EJv��Pq�i�/���Q淔߻��g��޼c�\��G6�47HQ���E�2{����=0m�ŝ��Ǿ�۔F�X�@��?:��^�2�ĳ�"!�������sf�:�@C�E>���0#��Ia�>`���A���6��w����ǌ�:��� �����$@V�p���<���.�9n��Ծ ��:Ah�n�0v�C����*�YO��_c�y��u���оo���\C}#�Q��썉#�L����+���m~�t
��B�}jk��w*I��
�p{���b��O�"x+�Ҩh�ؖS���+����<�#��{'�b�s际�Q�r��]F�1��C�zЬ��l�b��>�h�sJ��ر���q��J[+.����Ym,&� ��8����q^���G3{E�> ����Yi�j7��D����mڊE!$�F���U�z���C�%�mX����7�����E6�f��I$�q�/��4��K;�m��;�dJ�k���&��l�ѫ����Y��somn71R۰���*�-�5�o�K-ܩ�2���~8��<z}+X?U���3诼D�w{xn෍� C�n����������k�VV��p��&>���o&�����GnGoZ����+#��.���{�f����x}��8�������m2Y���c-�Г<��$�'���.Fq^�նv�߉�f�#�%���cq�:�r$��x��������s�-�����3
�]7/ q��k��)3��HznM�T��u2V����MV��2��ȹR�pY9�����$���.��N������OĨ�%6:���������LSe�����֝e�i�8<}=j�I1Il[��+.�I#Ў՜�;/KѮ헀�=����*�u��Өt�BE����s��O�*��}$*�#U�Uq� �>��r{d�ou�t���@i&"5��޷�Rz2��EO�k�N�ȍW����5���N:�M>9��:�6�8nn�}���,����z�uiu�,{|�^�����v�.��_h� �����Դ�7̲��F���� ����$��(K�h����\t]Ρ��BVi<ĉ�!�g���3�|Qۊ	bv�ȧ�d-g����=2�%���=÷��r����V�D���W�+���	�J��I�u-s_EɥĢ28�͒~��q{1pkKc��v�Q����K�\F�Wf�RN����*F�s���C�$�Kԩ��g-�������>���g��茹:z.�<�5�>�ZG| ��H�e�.�)��O�^t�F��ƣem����8$��s��]p�):g,�Ei�>������K[C�F
�g;NNG�\�t� B~_���U:���޿��kk-�˽g�3���OcW�T�<m�^��î��z*�,5 R�h��/�I�X��ZɫizѬ9/��9^Ŭk]?}�i(��	|��~A�#�*Wӧ�n_��z��Hf�K�f��HRCl|���ܽ��������4�2��L��¦P���\�y�Fh��As$2�EX��~���*���y��l����O�3<Z�r����H6�[Eo2�m=�UR�?�@Y�9�Y�c���8�yM%��be�%<�U"�!��<��6$3ܔ/��>$#�UJ�����Ԝ���9;?�%��9�i��F�F�^�l��q�Ї�Fq�j6�B����}���V���10ܬ	㟟�{V\�n�$�{�m(IU�@ҩ-}��oa:=�$9���=9�J��u��ghU���~�$�kF��� %�ж�8&��J�E����=��
�r�Y�;)q�$:�ȑKm�*�62z>�t>����P�{��l�̅�"����FK����� �Y�"�����#�q�#ڝ�I<C��њ�@[�"S.I��s��G�'��e�(���*.J�#>��ך�%$�'>٠0A'ך�]=��W�(�H���� �n����G��Q�S���Q���̰G#*9��3�ℳ@$�w��
����� ��4.�տiY�iԂHh�C($g�� �p�*����C��z��Ԩ�H98��6I-�G�8f܊Z<��(���	n&/B����Y*f�~��>ԁ�֤��6���ȭ�~3�:�gʊ��((��?o�Qa'�c�T���v4+.��i��6�k}n�9��Y�����T�Ŧ��w��^��^4h�Q2�Rv���k�Ru�&�E{�=��wT���k��|��i˴~����6�q�m82%���ޝ;�����\��|�P{���V
�k���<v�Rh���s!72�n�S5�y�@�*��{V2�'�~�ӤL:wB[7[k�C��m�O�<|�1ഊvβ�c��:S��A�G���9�`i	��&�,��E�i�Kw��X��m��oC���y]%�#�(min��E���7	\q�c�W�+��wb1U�Njo��v�))�VEޛ	�?,U�'ZtGr���:N��v�]���H���{Ws������P�um�o�-/ݔ$?��<m���x����CIl��+X����%���͉o�;v��VMZ�ˢ	��ͣM��BP�]ˌ�\KR5-mc��3JY-t�3t������t<�:���"��7PZ���ذ�)�c����/�P���5]�h�;�I>��唻#�$}7���2�6�ek�ǌdf7�#�>d�l��]����w�.೚c��q�����V�Ⱥ#����P�XD��?𓁊ӊ���s��E��x�2�%������eTM;%�r%�JL�*��2N*���׹�cmE���h�2pEV�}I�^�a�E.�k��v���Ѹ�Q$3�[��P�	��N�9� J�
�Q������X ��3ϯ�S%ǢY��!8��Ou$��(�q��q�c�� �Ǘ��GK\_�:��ȥWg�>�:�J��X���D��+����3Wr�o�I����t��Z�{m2I� e��\��Vk&���D���2~��Wq)�����Q�#G������G��N��'��S�z�X���F�*�N..��
v�?Z��j�
Z[�(�u�:O��rx�7��yr�����}��iK�YƥRt]]5�Ԭ�%�.8$r���x����{��]�\��6�*>>�:�n��Z�Eٙ<'����sݭ�c����a���2��컂���QY^t�1XY��"��V�g�����d>Ҋ+������֡���ȁ���~�i�A*l��ȯZ��Oי�~�����ymfVO��Ԋ����h��%���[ȷW�ͤ�e���~ߟgh�n�L�R2AΝ�Pm�9�A�h�-��:[����K�C�� �?���bh��T%�pFdD��ń� 1��N)��� �oBe�M�kq�8��)�17��dc)�Xɸ�~�����ꮞ��M6dKd��J�[j�BN)Q�$h�߼Z���|�J��[�{�k��� ��;"��3m�/��q�]�>$�UBȯ�ӭdf�d'���p����x��m�*�N���4�,@�	D�����1�@\w�9<�n��Y7�/�MFv<�r��������Z�W쎬Nɝ�o0]۷|;�=�j��M�rj3Gr��ت�|��֭ޙ/qU�ԗ4,�G*[��?ʪ��[�2��t�:kR}��WڞL�Tǩ1�Һ},�ō�������'ٝ�h�T�`c*ޝ�T?r,��#�9iO�;`�������f�F�IkN������H&��T�����Q�� ��s;|J�n1�ڀ�-�E�*��Č'Ў⡪fX�wz���[j�-�
��Ō�S�&�χ,4��k�Y4X��h]�v��Ѥ��2g��jwr[�ZK{*d��C'����PUo��������c��F�f���P+�#�Eg9T-�Κ>��6����p�Uq�F �&[���S��)��� ��Ut� �5$���	:�I���4�ߨ�=�6$b�*�[e�>�W�|�8��_��ݎ9a����V%SMfu���P�P� ʝW�3�`���ݱ�P�~4���BC��{}�������o㳉�i"-�sݔ�?�u�ȓ�tRqMY|u7H�W�<f��w|o���x�I���拊d�uMB��Oӭ�I��Hêv'��\▴�ܥ^�cK�&w�;t��ߋ�r�?�z�������烉�jv��� {��{]�r=Y��KI"���k����ī���ѭ'V��@�@��ڲ��G3����/�w����Z�u+��0��N��&�$�ۦuE$�g�@�j�p���2�to����3~#X�?O�s� 2q�@tw�E�з?��쁆5l����^��UMP�ֺ�zO�v�-*��8w��K(@A�a�H��T����R_�~¹WW���P���q���<*.��[iB��.�� t�O�� g#�޹�Ɲ�3H���K P����lP�^A54��Z�Q��e8 ��w'�W�n:ۤ��S�������̤|!�c�WT$�fmV��Q��e�s"��#�K(���S����w3��1O��;�B��/O��|30 �c�X:Ӣ�ܕ�lt9��q"e�8�Ᵹ'����kZ��N�?���'�*춑U�JuHm:gC�o/� p{�qT�a����4�G_�f��dq#��h�ysO��rI+GF��뛣���� y�
����k��Z:j�6�xA-�͹�Y�6� ļ�G�ZF��L�?�vl�d��Q'�I'�� ҡd��%Ƃ?
�d�H5��1�Ǳ� >Uo��hqD�|1�GHѵ�1U8'�ֱS��iG�#�i���K�8�bf'?έ�"�j/h�-[�ۋ?����)I۾9�)����_O#�Es�l�+���X������<G'q�8&�nZJΚ^����������<�1����t[�H�t�'��"i��#Ǚ�a�ӵe�AK���t�P�}q�ܴ���`�~���*Q�i�B��[��9n!���l��"�f����޷��l����qmΨo�ghcI��H��3d����Og�ݍ�eyW��y�Xa�ջd='`���1q�^�"��8�uw��� ?�E� HUUd��[1�6���� �-�WE��s��Nh$�` �*j+�ocY��R��b�3y{��s��-3|;�Xt�)`İfl.���u�ɦ��%Ŕ^����2�j�YY
x��|��--Y�4Qw[��sson2ۣ"�#�������G?����a�GƲ�0(7�tg�=j�kԦ���5"9�a�y26}��Q��$�={��f�Y�4�H^!)�^G�������!���S�B�-�������?,�wN���_D�����y-���q b?�z��_�����d��1k�Prrx������WH�u��	�Id�]\��t����V�O�c���As<��$R�����K��q��Zi���WEn�Ҭw��{a[���Q���$Y!D
��lL�݅>����!4^T��{H�thd��fR>�T��'i����Yً6O����K:���`�p���2�~}*��e�ian��mˬf=ϖރ>��[��_س���^��Ik�7:U�W|@�o$��l�e�܋�N�GUxU}��K-��ܴ��BA9��7$v�팥�q4��l@A��>��&l��#o=6�T�F��R�=6
]`�N_=�J�}	���1���S9
�B��K���^�c�W�!#�����܃�V�w%F���^�映zRATiJ��q��~!ޅe��X(��2�O�H�MGC���P��w:�q���^�ϴ����w+��WT2ޛ2⯢����뾲��,6��-�H@�|������[)�:C��;�|5�D�mﵩp�;�"01���Է?�˓�(c�~��,n����c�U&|#���jI.�5��UM�_�Iqr�g�PB�Ԧ��EZCo�K����0�ؒʛ�q�}�6�TG�s����{@bh�1�����_C�j�2�ٴH�s�6A!�T�� �8�,�o�P���y�K8SS.��	�W^�FrWE��� I�tL��Q��O�xn%�d1+r�~��/�q1O�i�]J��U�[�	0w0�J�U��_i�C��R�T��\����HE(a�9��ǽD�ȸ��ԕ�eYwi5�Ė��SFv�7pk��L�;��PHP#���$�B�AS�����K�u^��V�M�Ϻ��rHW<��գZ%���^��x)�~ʗT�]RR���� �z����F.V˷N���{#<X��)&qǽb����z��=���$������֮��֋sG��LX� �;�콫�Q��]:x��"{?#�E�O��I�T�<Hi�)Ӑ��e�s�=���y=׹��^�Kuc )�f�?:c]����οb�-o�D��D����7l�c��pem�߅�N�ꞗ��5ey!����DӍ�o����,�n�*�}}��F�r����HZ��$r6㓷�{�����kӺ~�բ�@��9,yo�h⚴G�I��zu���Vy��@�5�Ǣ^t�ѵ����n��Of+����t�o��N0�J��	����J��T�\� ݈�cN	#���Do�]^����$O�ԏ/ >/S��1����g&�n�����"��W��1�З��|���Z�ee����:����ao}�l�R�r+��x���ti�$��};��E�WK����}�c������X�ך���^jZ���\��Q&0D����ҧ��Yκ8kQ�Z��Q�2+>Zѱ�+��8������]� �H�6�Z-N?2���^� ���oeh�X~�,y�`�Eh�
ӢU!��ݤ�a���y�2mq�u5�K�.���I)d�+�2�|��[��(��&ɇA���԰��\I��-� +�Rk�xK��˭>�����+[x�c+���K�&q��Z�cH��6D��A�54����>6��dww�c�q�G�O�+�[(x��8����ӟk���f3�*�{3���*Qi#n6�����U;	�{۲�!��{ ��['�#�����F���+��8Ĉ�'"H�i�����6�}�ۮ�n�H�6��F��>u�MvtŪ=�ȟq�@ʠ`Dy�x��a�f��&�8~x-��>_1S��&�g�U⿵1J���E����~uX���V�E��O�5�o����Ǎ��S�V���oR4ۢ �h�v9��O_���U$�_݂``�Ns�?:��>��p�����gz� ����4�8n0>�ç��&���0Q$z2vb�y�i�.����}m��m#Ǽ��d�[h���*"��.֮�ZU��N����o��$�P��ՓoI��+�[+��l�5g[d���B7F����L�-VΜT��θ������aϷ�\N-vn�E�o��t���;ŎQ�F<�����V�@Bȭ���UQ}�T���w� R|ݤ����Tii/�LZ]x3��G&_�%�8'�\��jTs�k�g��>,���zG�y��jq�Zdd�s;�G�ǭ
ˣ����  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ascr  ��ޭ