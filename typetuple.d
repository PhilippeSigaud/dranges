 / /   W r i t t e n   i n   t h e   D   p r o g r a m m i n g   l a n g u a g e  
  
 / * *  
 T h i s   m o d u l e   d e f i n e s   t e m p l a t e s   o n   t y p e t u p l e s   ( c o m p l e m e n t a r y ,   s o m e t i m e s   s i m i l a r   t o   s t d . t y p e t u p l e / s t d . t r a i t s ) :  
 r e v e r s i n g ,   r o t a t i n g ,   e x t r a c t i n g ,   f i l t e r i n g ,   u n f o l d i n g ,   e t c ,   a l l   o n   t y p e t u p l e s .  
  
  
 L i c e n s e :       < a   h r e f = " h t t p : / / w w w . b o o s t . o r g / L I C E N S E _ 1 _ 0 . t x t " > B o o s t   L i c e n s e   1 . 0 < / a > .  
 A u t h o r s :       P h i l i p p e   S i g a u d   a n d   S i m e n   K j & a e l i g ; r & a r i n g ; s .  
  
 D i s t r i b u t e d   u n d e r   t h e   B o o s t   S o f t w a r e   L i c e n s e ,   V e r s i o n   1 . 0 .  
 ( S e e   a c c o m p a n y i n g   f i l e   L I C E N S E _ 1 _ 0 . t x t   o r   c o p y   a t   h t t p : / / w w w . b o o s t . o r g / L I C E N S E _ 1 _ 0 . t x t )  
 * /  
 m o d u l e   d r a n g e s . t y p e t u p l e ;  
  
 i m p o r t   s t d . t r a i t s ,  
               s t d . t y p e c o n s ,  
               s t d . t y p e t u p l e ;  
  
 i m p o r t   d r a n g e s . t e m p l a t e s ,  
               d r a n g e s . t r a i t s ;  
  
 v e r s i o n ( u n i t t e s t )  
 {  
         i m p o r t   s t d . s t d i o ;  
 }  
  
 / * *  
 A l i a s   i t s e l f   t o   t h e   . i n i t   v a l u e   o f   a   t y p e t u p l e .   W h e n   y o u   h a v e   a   t y p e t u p l e   ( T . . . )  
 i n s i d e   a   t e m p l a t e ,   y o u   c a n n o t   d o   ( T . i n i t ) ,   D M D   d o e s   n o t   a c c e p t   i t .   U s e   I n i t ! T   i n s t e a d .  
 * /  
 t e m p l a t e   I n i t ( T . . . )  
 {  
         s t a t i c   i f   ( T . l e n g t h   = =   1   & &   i s ( T   = =   c l a s s ) )  
                 T   I n i t   =   n e w   T ;  
         e l s e  
                 T   I n i t ;  
  
 }  
  
 / * *  
 C o m p a r e s   t u p l e s   t h a t   m i g h t   c o n t a i n   a   m i x t u r e   o f   t y p e s   a n d   v a l u e s .  
 A u t h o r :  
 S i m e n   K j & a e l i g ; r & a r i n g ; s .  
  
 U s a g e :  
 - - - -  
 S a m e T u p l e ! ( F i r s t T u p l e ) . A s ! ( S e c o n d T u p l e ) ;  
 - - - -  
  
 E x a m p l e :  
 - - - -  
 s t a t i c   a s s e r t ( S a m e T u p l e ! ( i n t ,   i n t ) . A s ! ( i n t ,   i n t ) ) ;  
 s t a t i c   a s s e r t ( S a m e T u p l e ! ( i n t ,   " f o o " ) . A s ! ( i n t ,   " f o o " ) ) ;  
 s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( i n t ,   " f o o " ) . A s ! ( " f o o " ,   i n t ) ) ;  
 - - - -  
 * /  
 t e m p l a t e   S a m e T u p l e ( T . . . )   {  
         t e m p l a t e   A s ( U . . . )   {  
                 e n u m   A s   =   i s (   S a m e T u p l e I m p l ! T   = =   S a m e T u p l e I m p l ! U   ) ;  
         }  
 }  
  
 s t r u c t   S a m e T u p l e I m p l ( T . . . )   { }  
  
 u n i t t e s t   {  
         s t a t i c   a s s e r t ( S a m e T u p l e ! ( i n t ,   i n t ) . A s ! ( i n t ,   i n t ) ) ;  
         s t a t i c   a s s e r t ( S a m e T u p l e ! ( f l o a t ) . A s ! ( f l o a t ) ) ;  
         s t a t i c   a s s e r t ( S a m e T u p l e ! ( " f o o " ) . A s ! ( " f o o " ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( " f o o " ) . A s ! ( " b a r " ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( i n t   ) . A s ! ( " b a r " ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( i n t   ) . A s ! ( f l o a t ) ) ;  
         s t a t i c   a s s e r t ( S a m e T u p l e ! ( i n t ,   " f o o " ) . A s ! ( i n t ,   " f o o " ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( i n t ,   " f o o " ) . A s ! ( " f o o " ,   i n t ) ) ;  
         s t a t i c   a s s e r t ( S a m e T u p l e ! ( ) . A s ! ( ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( i n t ) . A s ! ( ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( ) . A s ! ( i n t ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( " f o o " ) . A s ! ( ) ) ;  
         s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( ) . A s ! ( " f o o " ) ) ;  
 }  
  
 / * *  
 C h e c k s   i f   o n e   t u p l e   c o n t a i n s   a n o t h e r .  
 A u t h o r :  
 S i m e n   K j & a e l i g ; r & a r i n g ; s .  
  
 U s a g e :  
 - - - -  
 C o n t a i n e d ! ( S m a l l T u p l e ) . I n ! ( B i g T u p l e ) ;  
 - - - -  
  
 E x a m p l e :  
 - - - -  
 s t a t i c   a s s e r t ( C o n t a i n e d ! ( i n t ) . I n ! ( f l o a t ,   i n t ) ) ;  
 s t a t i c   a s s e r t ( ! C o n t a i n e d ! ( i n t ) . I n ! ( f l o a t ,   " f o o " ) ) ;  
 s t a t i c   a s s e r t ( C o n t a i n e d ! ( i n t , " f o o " ) . I n ! ( f l o a t ,   i n t ,   " f o o " ,   " b a r " ) ) ;  
 - - - -  
   * /  
 t e m p l a t e   C o n t a i n e d ( T . . . )   {  
       t e m p l a t e   I n ( U . . . )   {  
               s t a t i c   i f   ( T . l e n g t h   = =   0 )   {  
                       e n u m   I n   =   t r u e ;  
               }   e l s e   s t a t i c   i f   ( U . l e n g t h   > =   T . l e n g t h )   {  
                       e n u m   I n   =   S a m e T u p l e ! ( T ) . A s ! (   U [ 0 . . T . l e n g t h ] )   | |  
                               C o n t a i n e d ! ( T ) . I n ! ( U [ 1 . . $ ] ) ;  
               }   e l s e   {  
                       e n u m   I n   =   f a l s e ;  
               }  
       }  
 }  
  
 u n i t t e s t   {  
       s t a t i c   a s s e r t ( C o n t a i n e d ! ( i n t ) . I n ! ( f l o a t ,   i n t ) ) ;  
       s t a t i c   a s s e r t ( ! C o n t a i n e d ! ( i n t ) . I n ! ( f l o a t ,   " f o o " ) ) ;  
       s t a t i c   a s s e r t ( C o n t a i n e d ! ( i n t , " f o o " ) . I n ! ( f l o a t ,   i n t ,   " f o o " ,   " b a r " ) ) ;  
       s t a t i c   a s s e r t ( ! C o n t a i n e d ! ( i n t , " f o o " ) . I n ! ( f l o a t ,   i n t ,   " b a r " ,   " f o o " ) ) ;  
       s t a t i c   a s s e r t ( C o n t a i n e d ! ( ) . I n ! ( f l o a t ,   i n t ,   " b a r " ,   " f o o " ) ) ;  
 }  
  
  
 / * *  
 E v a l u a t e s   t o   $ ( D   F ! ( T [ 0 . . t u p l e L e n g t h ] )   & &   F ! ( T [ t u p l e L e n g t h . . 2 * t u p l e L e n g t h ] )   & &   . . .   & &   F [ T [ $ - t u p l e L e n g t h . . $ ] ] ) .  
 A u t h o r :  
 S i m e n   K j & a e l i g ; r & a r i n g ; s .  
  
 E x a m p l e :  
 - - - -  
 s t a t i c   a s s e r t ( a l l T u p l e s S a t i s f y ! ( C o n t a i n e d ! ( i n t ) . I n ,   2 ,   i n t ,   f l o a t ,   " f o o " ,   i n t ) ) ;  
 s t a t i c   a s s e r t ( ! a l l T u p l e s S a t i s f y ! ( C o n t a i n e d ! ( i n t ) . I n ,   2 ,   i n t ,   f l o a t ,   " f o o " , s t r i n g ) ) ;  
 - - - -  
   * /  
 t e m p l a t e   a l l T u p l e s S a t i s f y (   a l i a s   F ,   u i n t   t u p l e L e n g t h ,   T . . .   )   {  
       s t a t i c   a s s e r t (   ! (   T . l e n g t h   %   t u p l e L e n g t h   )   ) ;  
  
       s t a t i c   i f   (   T . l e n g t h   = =   t u p l e L e n g t h   )   {  
               e n u m   a l l T u p l e s S a t i s f y   =   F ! (   T   ) ;  
       }   e l s e   {  
               e n u m   a l l T u p l e s S a t i s f y   =   F ! (   T [ 0 . . t u p l e L e n g t h ]   )   & &   a l l T u p l e s S a t i s f y ! (   F ,   t u p l e L e n g t h ,   T [ t u p l e L e n g t h . . $ ]   ) ;  
       }  
 }  
  
 u n i t t e s t   {  
       s t a t i c   a s s e r t ( a l l T u p l e s S a t i s f y ! ( C o n t a i n e d ! ( i n t ) . I n ,   2 ,   i n t ,   f l o a t ,   " f o o " ,   i n t ) ) ;  
       s t a t i c   a s s e r t ( ! a l l T u p l e s S a t i s f y ! ( C o n t a i n e d ! ( i n t ) . I n ,   2 ,   i n t ,   f l o a t ,   " f o o " , s t r i n g ) ) ;  
 }  
  
 / * *  
 R e p e a t s   a   t y p e   o r   t y p e t u p l e   $ ( D   n u m )   t i m e s .  
 A u t h o r :  
 S i m e n   K j & a e l i g ; r & a r i n g ; s .  
  
 E x a m p l e :  
 - - - -  
 s t a t i c   a s s e r t ( S a m e T u p l e ! ( R e p e a t T u p l e ! ( 4 ,   i n t ) ) . A s ! ( i n t ,   i n t ,   i n t ,   i n t ) ) ;  
 s t a t i c   a s s e r t ( S a m e T u p l e ! ( R e p e a t T u p l e ! ( 4 ,   " f o o " ) ) . A s ! ( " f o o " ,   " f o o " ,   " f o o " ,   " f o o " ) ) ;  
 s t a t i c   a s s e r t ( S a m e T u p l e ! ( R e p e a t T u p l e ! ( 2 ,   i n t ,   " f o o " ) ) . A s ! ( i n t ,   " f o o " ,   i n t ,   " f o o " ) ) ;  
 s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( R e p e a t T u p l e ! ( 2 ,   i n t ) ) . A s ! ( ) ) ;  
 - - - -  
   * /  
 t e m p l a t e   R e p e a t T u p l e (   u i n t   n u m ,   T . . .   )   {  
       s t a t i c   i f   (   n u m   >   1   )   {  
               a l i a s   T y p e T u p l e ! (   T ,   R e p e a t T u p l e ! (   n u m   - 1 ,   T   )   )   R e p e a t T u p l e ;  
       }   e l s e   {  
               a l i a s   T   R e p e a t T u p l e ;  
       }  
 }  
  
 u n i t t e s t   {  
       s t a t i c   a s s e r t ( S a m e T u p l e ! ( R e p e a t T u p l e ! ( 4 ,   i n t ) ) . A s ! ( i n t ,   i n t ,   i n t ,   i n t ) ) ;  
       s t a t i c   a s s e r t ( S a m e T u p l e ! ( R e p e a t T u p l e ! ( 4 ,   " f o o " ) ) . A s ! ( " f o o " ,   " f o o " ,   " f o o " ,   " f o o " ) ) ;  
       s t a t i c   a s s e r t ( S a m e T u p l e ! ( R e p e a t T u p l e ! ( 2 ,   i n t ,   " f o o " ) ) . A s ! ( i n t ,   " f o o " ,   i n t ,   " f o o " ) ) ;  
       s t a t i c   a s s e r t ( ! S a m e T u p l e ! ( R e p e a t T u p l e ! ( 2 ,   i n t ) ) . A s ! ( ) ) ;  
 }  
  
 / * *  
 E x t r a c t s   s o m e   t y p e s   f r o m   t h e   v a r i a d i c   t y p e   t u p l e   R   a c c o r d i n g   t o   t h e   i n d i c e s   g i v e n   b y   a r r a y   ( a   s t a t i c   a r r a y ) .  
 [ 0 , 1 , 2 ]   m e a n s   ' t h e   f i r s t ,   s e c o n d   a n d   t h i r d   t y p e s ' .   T h e   i n d i c e s   c a n   b e   r e p e a t e d   o r   o m i t t e d   a n d   t h e   a r r a y  
 c a n   b e   l o n g e r   t h a n   R   ( [ 0 , 1 , 2 , 2 , 3 , 0 , 0 , 2 , 3 ] . . . ) .   I n   t h e   l a t t e r   c a s e ,   t h e   r e s u l t i n g   t y p e   t u p l e   w i l l   o b v i o u s l y   b e   l o n g e r  
 t h a n   R .  
 E x a m p l e s :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g )   T T ;  
 a l i a s   E x t r a c t T y p e ! ( [ 0 , 1 ] , T T )   E 1 ;  
 a l i a s   E x t r a c t T y p e ! ( [ 1 , 0 ] , T T )   E 2 ;  
 a l i a s   E x t r a c t T y p e ! ( [ 1 ] , T T )   E 3 ;  
 a l i a s   E x t r a c t T y p e ! ( [ 1 , 0 , 2 , 2 , 0 ] , T T )   E 4 ;  
  
 a s s e r t ( i s ( E 1   = =   T y p e T u p l e ! ( i n t , d o u b l e ) ) ) ;  
 a s s e r t ( i s ( E 2   = =   T y p e T u p l e ! ( d o u b l e , i n t ) ) ) ;  
 a s s e r t ( i s ( E 3   = =   T y p e T u p l e ! ( d o u b l e ) ) ) ;  
 a s s e r t ( i s ( E 4   = =   T y p e T u p l e ! ( d o u b l e , i n t , s t r i n g , s t r i n g , i n t ) ) ) ;  
 - - - -  
 N o t e :   w h y   a   s t a t i c   a r r a y   i n s t e a d   o f   f r e e   p a r a m e t e r s   l i k e   t h i s :   $ ( M   E x t r a c t T y p e ! ( 0 , 2 , 3 , 1 ,   T T ) ) ?   B e c a u s e   t h e   t y p e   t u p l e   a n d   t h e  
 i n d e x   l i s t   a r e   b o t h   o f   v a r i a b l e   l e n g t h ,   a n d   t h e   t u p l e   c a n   c o n t a i n   a n y   t e m p l a t e   p a r a m e t e r ,   i n c l u d i n g   i n t s .   A   s i m p l i f i e d   v e r s i o n  
 w o r k i n g   o n l y   o n   p u r e   t y p e s   t u p l e s   c o u l d   u s e   $ ( M   S t a t i c T a k e W h i l e )   t o   g e t   t h e   p a r a m e t e r s   t h a t   a r e   o f   i n t e g r a l   t y p e   a n d   t h e n   d e d u c e  
 t h e   r e s t   i s   t h e   t y p e   t u p l e .  
 * /  
 t e m p l a t e   E x t r a c t T y p e ( a l i a s   a r r a y ,   R . . . )   {  
         s t a t i c   i f   ( a r r a y . l e n g t h   = =   1 )   {  
                 a l i a s   T y p e T u p l e ! ( R [ a r r a y [ 0 ] ] )   E x t r a c t T y p e ;  
         }  
         e l s e   {  
                 a l i a s   T y p e T u p l e ! ( R [ a r r a y [ 0 ] ] ,   E x t r a c t T y p e ! ( a r r a y [ 1 . . $ ] ,   R ) )   E x t r a c t T y p e ;  
         }  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g )   T T ;  
         a l i a s   E x t r a c t T y p e ! ( [ 0 , 1 ] , T T )   E 1 ;  
         a l i a s   E x t r a c t T y p e ! ( [ 1 , 0 ] , T T )   E 2 ;  
         a l i a s   E x t r a c t T y p e ! ( [ 1 ] , T T )   E 3 ;  
         a l i a s   E x t r a c t T y p e ! ( [ 1 , 0 , 2 , 2 , 0 ] , T T )   E 4 ;  
  
         a s s e r t ( i s ( E 1   = =   T y p e T u p l e ! ( i n t , d o u b l e ) ) ) ;  
         a s s e r t ( i s ( E 2   = =   T y p e T u p l e ! ( d o u b l e , i n t ) ) ) ;  
         a s s e r t ( i s ( E 3   = =   T y p e T u p l e ! ( d o u b l e ) ) ) ;  
         a s s e r t ( i s ( E 4   = =   T y p e T u p l e ! ( d o u b l e , i n t , s t r i n g , s t r i n g , i n t ) ) ) ;  
 }  
  
 / * *  
 I f   n > 0 ,   i t   r o t a t e   a   T y p e T u p l e   o n   t h e   l e f t   b y   n   p o s i t i o n s   ( i t   t a k e s   t h e   f i r s t   n   t y p e s   a n d   p u t s   t h e m   a t   t h e   e n d ) .  
 f o r   n = =   0 ,   i t   d o e s   n o t h i n g   ( i t ' s   t h e   i d e n t i t y   t e m p l a t e ) .  
 I f   n < 0 ,   i t   r o t a t e s   o n   t h e   r i g h t   ( t a k e s   t h e   l a s t   n   t y p e s   a n d   p u t s   t h e m   a t   t h e   b e g i n n i n g ) .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g )   T T ;  
 a l i a s   R o t a t e T y p e s ! ( 1 , T T )   R 1 ;       / /   ( d o u b l e ,   s t r i n g ,   i n t )  
 a l i a s   R o t a t e T y p e s ! ( 0 , T T )   R 0 ;       / /   ( i n t ,   d o u b l e ,   s t r i n g )  
 a l i a s   R o t a t e T y p e s ! ( 5 , T T )   R 5 ;       / /   ( s t r i n g ,   i n t ,   d o u b l e )  
 a l i a s   R o t a t e T y p e s ! ( - 1 , T T )   R _ 1 ;   / /   ( s t r i n g ,   i n t ,   d o u b l e )  
 a l i a s   R o t a t e T y p e s ! ( - 5 , T T )   R _ 5 ;   / /   ( d o u b l e ,   s t r i n g ,   i n t )  
  
 a s s e r t ( i s ( R 1   = =   T y p e T u p l e ! ( d o u b l e , s t r i n g , i n t ) ) ) ;  
 a s s e r t ( i s ( R 0   = =   T T ) ) ;  
 a s s e r t ( i s ( R 5   = =   T y p e T u p l e ! ( s t r i n g , i n t , d o u b l e ) ) ) ;   / /   e q u i v a l e n t   t o   R o t a t e ! ( 2 , T T )  
 a s s e r t ( i s ( R _ 1   = =   T y p e T u p l e ! ( s t r i n g , i n t , d o u b l e ) ) ) ;  
 a s s e r t ( i s ( R _ 5   = =   T y p e T u p l e ! ( d o u b l e , s t r i n g , i n t ) ) ) ;   / /   e q u i v a l e n t   t o   R o t a t e ! ( - 2 , T T )   a n d   a l s o   t o   R o t a t e ! ( 1 , T T )  
  
 a l i a s   T y p e T u p l e ! ( i n t )   T T 2 ;  
 a s s e r t ( i s ( R o t a t e T y p e s ! ( 1 , T T 2 )   = =   T T 2 ) ) ;   / /   o n e   t y p e :   u n c h a n g e d   b y   r o t a t i o n  
  
 a l i a s   S t a t i c F i l t e r ! ( i s I n t e g r a l ,   T T 2 )   F ;   / /   d o u b l e   i s   n o t   a n   i n t e g r a l   t y p e   - >   F   i s   e m p t y  
 a s s e r t ( i s ( R o t a t e T y p e s ! ( 1 , F )   = =   F ) ) ;   / /   z e r o   t y p e :   a l s o   u n c h a n g e d   b y   r o t a t i o n .  
 - - - -  
  
 T o   B e   D o c u m e n t e d :   c u r r i e d   v e r s i o n :   a l i a s   R o t a t e T y p e s ! 1   R 1 ;  
 * /  
 t e m p l a t e   R o t a t e T y p e s ( i n t   n ,   R . . . )   i f   ( R . l e n g t h > 0   & &   n > = 0 )  
 {  
         a l i a s   T y p e T u p l e ! ( R [ ( n % R . l e n g t h ) . . $ ] , R [ 0 . . ( n % R . l e n g t h ) ] )   R o t a t e T y p e s ;  
 }  
  
 / / /   d i t t o  
 t e m p l a t e   R o t a t e T y p e s ( i n t   n ,   R . . . )   i f   ( R . l e n g t h > 0   & &   n < 0 )  
 {  
         a l i a s   T y p e T u p l e ! ( R [ $ - ( ( - n ) % R . l e n g t h ) . . $ ] , R [ 0 . . $ - ( ( - n ) % R . l e n g t h ) ] )   R o t a t e T y p e s ;  
 }  
  
 / /   u s e l e s s :   i s   R   = =   T y p e T u p l e ! ( ) ,   i t ' s   t h e   c u r r i e d   t e m p l a t e   t h a t   g e t s   i n s t a n t i a t e d .  
 t e m p l a t e   R o t a t e T y p e s ( i n t   n ,   R . . . )   i f   ( R . l e n g t h   = =   0 )  
 {  
         a l i a s   R   R o t a t e T y p e s ;  
 }  
  
 / / /   d i t t o  
 t e m p l a t e   R o t a t e T y p e s ( i n t   n )  
 {  
         t e m p l a t e   R o t a t e T y p e s ( R . . . )  
         {  
                 s t a t i c   i f   ( R . l e n g t h   >   0 )  
                 {  
                         s t a t i c   i f   ( n   = =   0 )  
                                 a l i a s   R   R o t a t e T y p e s ;   / /   I d e n t i t y   t e m p l a t e   o n   t y p e s  
                         e l s e   s t a t i c   i f   ( n   >   0 )  
                                 a l i a s   T y p e T u p l e ! ( R [ ( n % R . l e n g t h ) . . $ ] , R [ 0 . . ( n % R . l e n g t h ) ] )   R o t a t e T y p e s ;  
                         e l s e   / /                   n   < 0  
                                 a l i a s   T y p e T u p l e ! ( R [ $ - ( ( - n ) % R . l e n g t h ) . . $ ] , R [ 0 . . $ - ( ( - n ) % R . l e n g t h ) ] )   R o t a t e T y p e s ;  
                 }  
                 e l s e   / /   R . l e n g t h   = =   0   i e ,   R   i s   T y p e T u p l e ! ( )  
                         a l i a s   R   R o t a t e T y p e s ;  
         }  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g )   T T ;  
         a l i a s   R o t a t e T y p e s ! ( 1 , T T )   R 1 ;  
         a l i a s   R o t a t e T y p e s ! ( 0 , T T )   R 0 ;  
         a l i a s   R o t a t e T y p e s ! ( 5 , T T )   R 5 ;  
         a l i a s   R o t a t e T y p e s ! ( - 1 , T T )   R _ 1 ;  
         a l i a s   R o t a t e T y p e s ! ( - 5 , T T )   R _ 5 ;  
  
         a s s e r t ( i s ( R 1   = =   T y p e T u p l e ! ( d o u b l e , s t r i n g , i n t ) ) ) ;  
         a s s e r t ( i s ( R 0   = =   T T ) ) ;  
         a s s e r t ( i s ( R 5   = =   T y p e T u p l e ! ( s t r i n g , i n t , d o u b l e ) ) ) ;   / /   e q u i v a l e n t   t o   R o t a t e ! ( 2 , T T )  
         a s s e r t ( i s ( R _ 1   = =   T y p e T u p l e ! ( s t r i n g , i n t , d o u b l e ) ) ) ;  
         a s s e r t ( i s ( R _ 5   = =   T y p e T u p l e ! ( d o u b l e , s t r i n g , i n t ) ) ) ;   / /   e q u i v a l e n t   t o   R o t a t e ! ( - 2 , T T )   a n d   a l s o   t o   R o t a t e ! ( 1 , T T )  
  
         a l i a s   T y p e T u p l e ! ( d o u b l e )   T T 2 ;  
         a s s e r t ( i s ( R o t a t e T y p e s ! ( 1 , T T 2 )   = =   T T 2 ) ) ;   / /   o n e   t y p e :   u n c h a n g e d   b y   r o t a t i o n .  
 }  
  
 / * *  
 T a k e s   a   t y p e   t u p l e   a n d   r e v e r s e s   i t .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g )   T T ;  
 a l i a s   R e v e r s e T y p e s ! T T   R ;  
 a s s e r t ( i s ( R   = =   T y p e T u p l e ! ( s t r i n g , d o u b l e , i n t ) ) ) ;  
  
 a l i a s   T y p e T u p l e ! ( d o u b l e )   T T 2 ;  
 a s s e r t ( i s ( R e v e r s e T y p e s ! T T 2   = =   T T 2 ) ) ;   / /   o n e   t y p e :   u n c h a n g e d   b y   i n v e r s i o n .  
  
 a l i a s   S t a t i c F i l t e r ! ( i s I n t e g r a l ,   T T 2 )   F ;   / /   d o u b l e   i s   n o t   a n   i n t e g r a l   t y p e   - >   F   i s   e m p t y  
 a s s e r t ( i s ( R e v e r s e T y p e s ! F   = =   F ) ) ;   / /   n o   t y p e :   u n c h a n g e d   b y   i n v e r s i o n .  
 - - - -  
 * /  
 t e m p l a t e   R e v e r s e T y p e s ( T . . . )   {  
         s t a t i c   i f   ( T . l e n g t h )  
                 a l i a s   T y p e T u p l e ! ( T [ $ - 1 ] ,   R e v e r s e T y p e s ! ( T [ 0 . . $ - 1 ] ) )   R e v e r s e T y p e s ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( )   R e v e r s e T y p e s ;  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g )   T T ;  
         a l i a s   R e v e r s e T y p e s ! T T   R ;  
         a s s e r t ( i s ( R   = =   T y p e T u p l e ! ( s t r i n g , d o u b l e , i n t ) ) ) ;  
  
         a l i a s   T y p e T u p l e ! ( d o u b l e )   T T 2 ;  
         a s s e r t ( i s ( R e v e r s e T y p e s ! T T 2   = =   T T 2 ) ) ;   / /   o n e   t y p e :   u n c h a n g e d   b y   i n v e r s i o n .  
  
         a l i a s   S t a t i c F i l t e r ! ( i s I n t e g r a l ,   T T 2 )   F ;   / /   d o u b l e   i s   n o t   a n   i n t e g r a l   t y p e   - >   F   i s   e m p t y  
         a s s e r t ( i s ( R e v e r s e T y p e s ! F   = =   F ) ) ;   / /   n o   t y p e :   u n c h a n g e d   b y   i n v e r s i o n .  
 }  
  
 / * *  
 S w a p   t h e   t y p e s   a t   i n d e x   i 1   a n d   i n d e x   i 2   i n   a   T y p e T u p l e .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g ,   s h o r t )   T e s t ;  
  
 a s s e r t ( i s ( S w a p T y p e s ! ( 1 , 3 , T e s t )   = =   T y p e T u p l e ! ( i n t , s h o r t , s t r i n g , d o u b l e ) ) ) ;  
 a s s e r t ( i s ( S w a p T y p e s ! ( 3 , 1 , T e s t )   = =   T y p e T u p l e ! ( i n t , s h o r t , s t r i n g , d o u b l e ) ) ) ;  
  
 a s s e r t ( i s ( S w a p T y p e s ! ( 1 , 1 , T e s t )   = =   T e s t ) ) ;  
 - - - -  
 * /  
 t e m p l a t e   S w a p T y p e s ( s i z e _ t   i 1 ,   s i z e _ t   i 2 ,   R . . . )  
 {  
         s t a t i c   i f   ( i 1   <   R . l e n g t h   & &   i 2   <   R . l e n g t h )  
         {  
                 s t a t i c   i f   ( i 1   = =   i 2 )   {  
                         a l i a s   R   S w a p T y p e s ;  
                 }  
                 e l s e   {  
                         a l i a s   T y p e T u p l e ! ( R [ 0 . . M i n ! ( i 1 , i 2 ) ] , R [ M a x ! ( i 1 , i 2 ) ] ,   R [ M i n ! ( i 1 , i 2 ) + 1 . . M a x ! ( i 1 , i 2 ) ] ,   R [ M i n ! ( i 1 , i 2 ) ] ,   R [ M a x ! ( i 1 , i 2 ) + 1 . . $ ] )   S w a p T y p e s ;  
                 }  
         }  
         e l s e  
                 s t a t i c   a s s e r t ( f a l s e ,   " S w a p T y p e s   i n d e x   o u t   o f   r a n g e " ) ;  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g ,   s h o r t )   T e s t ;  
  
         a s s e r t ( i s ( S w a p T y p e s ! ( 1 , 3 , T e s t )   = =   T y p e T u p l e ! ( i n t , s h o r t , s t r i n g , d o u b l e ) ) ) ;  
         a s s e r t ( i s ( S w a p T y p e s ! ( 3 , 1 , T e s t )   = =   T y p e T u p l e ! ( i n t , s h o r t , s t r i n g , d o u b l e ) ) ) ;  
  
         a s s e r t ( i s ( S w a p T y p e s ! ( 1 , 1 , T e s t )   = =   T e s t ) ) ;  
 }  
  
 / * *  
 C u t   a   t y p e t u p l e   i n t o   s e g m e n t s   o f   l e n g t h   n .   T h e   s e g m e n t s   a r e   $ ( M   s t d . t y p e c o n s . T u p l e ) s ,   n o t   t y p e   t u p l e s ,  
 t o   a v o i d   a u t o - f l a t t e n i n g .   I t   w i l l   n o t   c o m p i l e   i f   n   = =   0   o r   i f   n   d o   n o t   c u t   t h e   t y p e t u p l e   i n   e q u a l   p a r t s .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g ,   i n t   d e l e g a t e ( ) )   T y p e s ;  
 a l i a s   S e g m e n t T y p e s ! ( 2 ,   T y p e s )   S e g m e n t s ;  
 a s s e r t ( i s ( S e g m e n t   = =   T y p e T u p l e ! ( T u p l e ! ( i n t , d o u b l e ) ,   T u p l e ! ( s t r i n g ,   i n t   d e l e g a t e ( ) ) )   ) ) ;  
 - - - -  
 * /  
 t e m p l a t e   S e g m e n t T y p e s ( i n t   n ,   T . . . )   i f   ( n   >   0   & &   T . l e n g t h   %   n   = =   0 )  
 {  
         s t a t i c   i f   ( T . l e n g t h )  
                 a l i a s   T y p e T u p l e ! ( T u p l e ! ( T [ 0 . . n ] ) ,   S e g m e n t T y p e s ! ( n ,   T [ n . . $ ] ) )   S e g m e n t T y p e s ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( )   S e g m e n t T y p e s ;  
 }  
  
 / / /   I s   t r u e   i f f   a l l   e l e m e n t s   o f   t h e   v a r i a d i c   l i s t   a r e   e q u a l   ( a s   t e s t e d   b y   = = ) .  
 t e m p l a t e   A l l E q u a l ( a l i a s   a ,   R e s t . . . )  
 {  
         s t a t i c   i f   ( R e s t . l e n g t h )  
                 e n u m   b o o l   A l l E q u a l   =   ( a   = =   R e s t [ 0 ] )   & &   A l l E q u a l ! ( R e s t ) ;  
         e l s e  
                 e n u m   b o o l   A l l E q u a l   =   t r u e ;  
 }  
  
 / / /   I s   t r u e   i f f   a l l   t y p e s   i n   t h e   t y p e t u p l e   a r e   e q u a l .  
 t e m p l a t e   A l l E q u a l ( T y p e s . . . )  
 {  
         s t a t i c   i f   ( T y p e s . l e n g t h   >   1 )  
                 e n u m   b o o l   A l l E q u a l   =   i s ( T y p e s [ 0 ]   = =   T y p e s [ 1 ] )   & &   A l l E q u a l ! ( T y p e s [ 1 . . $ ] ) ;  
         e l s e  
                 e n u m   b o o l   A l l E q u a l   =   t r u e ;  
 }  
  
 / * *  
 c r e a t e s   a   T y p e T u p l e   o f   n   T ' s ,   r e p e a t e d .   I f   n   = =   0 ,   i t   b e c o m e s   t h e   e m p t y   T y p e T u p l e :   T y p e T u p l e ! ( ) .  
 - - - -  
 a l i a s   T y p e N u p l e ! ( i n t ,   3 )   T N 3 ;  
 a s s e r t ( i s ( T N 3   = =   T y p e T u p l e ! ( i n t , i n t , i n t ) ) ) ;  
 a l i a s   T y p e N u p l e ! ( i n t ,   1 )   T N 1 ;  
 a s s e r t ( i s ( T N 1   = =   T y p e T u p l e ! ( i n t ) ) ) ;  
 a s s e r t ( ! i s ( T N 1   = =   i n t ) ) ;   / /   T y p e T u p l e ! i n t   i s   n o t   a n   i n t .  
 - - - -  
 * /  
 t e m p l a t e   T y p e N u p l e ( T ,   s i z e _ t   n )  
 {  
         s t a t i c   i f ( n   = =   0 )  
                 a l i a s   T y p e T u p l e ! ( )   T y p e N u p l e ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( T , T y p e N u p l e ! ( T ,   n - 1 ) )   T y p e N u p l e ;  
 }  
  
 / / / / /   d i t t o  
 / / t e m p l a t e   T y p e N u p l e ( s t r i n g   s ,   s i z e _ t   n )   {  
 / /         s t a t i c   i f ( n   = =   0 )   {  
 / /                 a l i a s   T y p e T u p l e ! ( )   T y p e N u p l e ;  
 / /         }  
 / /         e l s e   {  
 / /                 a l i a s   T y p e T u p l e ! ( s , T y p e N u p l e ! ( s ,   n - 1 ) )   T y p e N u p l e ;  
 / /         }  
 / / }  
  
 / / /   d i t t o  
 t e m p l a t e   T y p e N u p l e ( a l i a s   a ,   s i z e _ t   n )  
 {  
         s t a t i c   i f ( n   = =   0 )  
                 a l i a s   T y p e T u p l e ! ( )   T y p e N u p l e ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( a , T y p e N u p l e ! ( a ,   n - 1 ) )   T y p e N u p l e ;  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e N u p l e ! ( i n t ,   3 )   T N 3 ;  
         a s s e r t ( i s ( T N 3   = =   T y p e T u p l e ! ( i n t , i n t , i n t ) ) ) ;  
         a l i a s   T y p e N u p l e ! ( i n t ,   1 )   T N 1 ;  
         a s s e r t ( i s ( T N 1   = =   T y p e T u p l e ! ( i n t ) ) ) ;  
         a s s e r t ( ! i s ( T N 1   = =   i n t ) ) ;   / /   T y p e T u p l e ! i n t   i s   n o t   a n   i n t .  
 }  
  
 / * *  
 T r a n s f o r m s   a   s t a t i c   a r r a y   i n t o   a   T y p e T u p l e .  
 E x a m p l e :  
 - - - -  
 a l i a s   E x p a n s i o n ! ( i n t [ 3 ] )   E ;   / /   G i v e s   T y p e T u p l e ! ( i n t ,   i n t ,   i n t ) .  
 - - - -  
  
 N o t e :   i n t [ 1 ]   g i v e s   T y p e T u p l e ! ( i n t ) ,   w h i c h   i s   n o t   o f   t y p e   i n t .  
 * /  
 t e m p l a t e   E x p a n s i o n ( T   :   U [ n ] ,   U ,   s i z e _ t   n )   {  
         a l i a s   T y p e N u p l e ! ( U ,   n )   E x p a n s i o n ;  
  
 }  
 u n i t t e s t   {  
         a s s e r t ( i s ( E x p a n s i o n ! ( i n t [ 3 ] )   = =   T y p e T u p l e ! ( i n t ,   i n t ,   i n t ) ) ) ;  
         a s s e r t ( i s ( E x p a n s i o n ! ( i n t [ 1 ] )   = =   T y p e T u p l e ! ( i n t ) ) ) ;  
         a s s e r t ( ! i s ( E x p a n s i o n ! ( i n t [ 1 ] )   = =   i n t ) ) ;  
         a s s e r t ( i s ( E x p a n s i o n ! ( i n t [ 0 ] )   = =   T y p e T u p l e ! ( ) ) ) ;  
         a s s e r t ( ! i s ( E x p a n s i o n ! ( i n t [ ] )   = =   T y p e T u p l e ! ( i n t ) ) ) ;  
         a s s e r t ( ! i s ( E x p a n s i o n ! ( i n t )   = =   T y p e T u p l e ! ( i n t ) ) ) ;  
 }  
  
 / * *  
 D ' s   t y p e t u p l e   a u t o m a t i c a l l y   f l a t t e n ,   w h i c h   i s   i n t e r e s t i n g   o n   c e r t a i n   o c c a s i o n s ,   b u t   n o t   w h e n   y o u ' r e  
 t r y i n g   t o   c r e a t e   a   d e e p l y   n e s t e d   s t r u c t u r e ,   s i c h   a s   a   t r e e   o f   t y p e s .   F o r   t h o s e   o c c a s i o n s ,   u s i n g   s t d . T y p e c o n s . T u p l e  
 i s   a   p o s s i b i l i t y .   T h i s   t e m p l a t e   i s   f o r   g o i n g   b a c k :   g i v e n   a   t y p e t u p l e ,   p o s s i b l i y   c o n t a i n i n g   n e s t e d   t u p l e s ,   i t   f l a t t e n s  
 t h e m   a l l   a n d   r e t u r n s   a   f l a t   t y p e t u p l e .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g )   F l a t ;  
 a l i a s   T y p e T u p l e ! ( T u p l e ! ( i n t , d o u b l e ) ,   s t r i n g ,   T u p l e ! F l a t ,   T u p l e ! ( i n t ,   T u p l e ! i n t ) )   N e s t e d ;  
  
 a s s e r t ( i s ( F l a t t e n T u p l e ! F l a t   = =   F l a t ) ) ;  
 a s s e r t ( i s ( F l a t t e n ! N e s t e d   = =   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g , i n t , d o u b l e , s t r i n g , i n t , i n t ) ) ) ;  
 - - - -  
 * /  
 t e m p l a t e   F l a t t e n T u p l e ( T . . . )  
 {  
         s t a t i c   i f   ( T . l e n g t h )  
                 s t a t i c   i f   ( i s T u p l e ! ( T [ 0 ] ) )  
                         a l i a s   T y p e T u p l e ! ( F l a t t e n T u p l e ! ( T [ 0 ] . T y p e s ) ,   F l a t t e n T u p l e ! ( T [ 1 . . $ ] ) )   F l a t t e n T u p l e ;  
                 e l s e  
                         a l i a s   T y p e T u p l e ! ( T [ 0 ] ,   F l a t t e n T u p l e ! ( T [ 1 . . $ ] ) )   F l a t t e n T u p l e ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( )   F l a t t e n T u p l e ;  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g )   F l a t ;  
         a l i a s   T y p e T u p l e ! ( T u p l e ! ( i n t , d o u b l e ) ,   s t r i n g ,   T u p l e ! F l a t ,   T u p l e ! ( i n t ,   T u p l e ! i n t ) )   N e s t e d ;  
  
         a s s e r t ( i s ( F l a t t e n T u p l e ! F l a t   = =   F l a t ) ) ;  
         a s s e r t ( i s ( F l a t t e n T u p l e ! N e s t e d   = =   T y p e T u p l e ! ( i n t , d o u b l e , s t r i n g , i n t , d o u b l e , s t r i n g , i n t , i n t ) ) ) ;  
 }  
  
 / * *  
 U s a g e :  
 - - - -  
 I n t e r l e a v e ! ( F i r s t T y p e T u p l e ) . W i t h ! ( S e c o n d T y p e T u p l e ) :  
 - - - -  
 G i v e n   T 0 ,   T 1 ,   T 2 ,   . . . ,   T i   a n d   U 0 ,   U 1 ,   . . .   U j ,   i t   w i l l   i n t e r l e a v s   t h e   t y p e s   a n d   b e c o m e s   T 0 ,   U 0 ,   T 1 ,   U 1 ,   . . .  
 I f   o n e   o f   t h e   t u p l e s   i s   l o n g e r   t h a n   t h e   o t h e r ,   i t s   t a i l   w i l l   b e   a p p e n d e d .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( b y t e , s h o r t , i n t , l o n g , u b y t e , u s h o r t , u i n t , u l o n g )   I n t e g r a l T y p e s ;  
 a l i a s   T y p e T u p l e ! ( f l o a t , d o u b l e , r e a l )   F l o a t T y p e s ;  
 a l i a s   I n t e r l e a v e ! I n t e g r a l T y p e s . W i t h ! F l o a t T y p e s   N u m e r i c a l T y p e s ;  
  
 a s s e r t ( i s ( N u m e r i c a l T y p e s   = =   T y p e T u p l e ! ( b y t e , f l o a t , s h o r t , d o u b l e , i n t , r e a l , l o n g , u b y t e , u s h o r t , u i n t , u l o n g ) ) ) ;  
 - - - -  
 * /  
 t e m p l a t e   I n t e r l e a v e ( T . . . )  
 {  
         t e m p l a t e   W i t h ( U . . . )  
         {  
                 s t a t i c   i f ( T . l e n g t h )  
                         s t a t i c   i f ( U . l e n g t h )  
                                 a l i a s   T y p e T u p l e ! ( T [ 0 ] , U [ 0 ] ,   I n t e r l e a v e ! ( T [ 1 . . $ ] ) . W i t h ! ( U [ 1 . . $ ] ) )   W i t h ;  
                         e l s e  
                                 a l i a s   T   W i t h ;  
                 e l s e  
                         a l i a s   U   W i t h ;  
         }  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( b y t e , s h o r t , i n t , l o n g , u b y t e , u s h o r t , u i n t , u l o n g )   I n t e g r a l T y p e s ;  
         a l i a s   T y p e T u p l e ! ( f l o a t , d o u b l e , r e a l )   F l o a t T y p e s ;  
         a l i a s   I n t e r l e a v e ! I n t e g r a l T y p e s . W i t h ! F l o a t T y p e s   N u m e r i c a l T y p e s ;  
  
         a s s e r t ( i s ( N u m e r i c a l T y p e s   = =   T y p e T u p l e ! ( b y t e , f l o a t , s h o r t , d o u b l e , i n t , r e a l , l o n g , u b y t e , u s h o r t , u i n t , u l o n g ) ) ) ;  
  
         a s s e r t ( i s ( I n t e r l e a v e ! ( ) . W i t h ! ( )   = =   T y p e T u p l e ! ( ) ) ) ;  
         a s s e r t ( i s ( I n t e r l e a v e ! I n t e g r a l T y p e s . W i t h ! ( )   = =   I n t e g r a l T y p e s ) ) ;  
         a s s e r t ( i s ( I n t e r l e a v e ! ( ) . W i t h ! I n t e g r a l T y p e s   = =   I n t e g r a l T y p e s ) ) ;  
  
         a s s e r t ( I n t e r l e a v e ! ( 0 , 2 , 4 , 6 ) . W i t h ! ( 1 , 3 , 5 , 7 ) . s t r i n g o f   = =   T y p e T u p l e ! ( 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 ) . s t r i n g o f ) ;  
 }  
  
 / * *  
 J u s t   a n   e x e r c i c e :   b l i n d - c o d i n g   s t d . t r a i t s . s t a t i c M a p .   A l i a s e s  
 i t s e l f   t o   t h e   T y p e T u p l e   ( F ! T 0 ,   F ! T 1 ,   . . . )  
 * /  
 t e m p l a t e   S t a t i c M a p ( a l i a s   F ,   T . . . )  
 {  
         s t a t i c   i f   ( T . l e n g t h   = =   0 )   {  
                 a l i a s   T y p e T u p l e ! ( )   S t a t i c M a p ;  
         }  
         e l s e   {  
                 a l i a s   T y p e T u p l e ! ( F ! ( T [ 0 ] ) ,   S t a t i c M a p ! ( F ,   T [ 1   . .   $ ] ) )   S t a t i c M a p ;  
         }  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t ,   u i n t ,   s h o r t )   T T ;  
         a l i a s   S t a t i c M a p ! ( U n s i g n e d ,   T T )   M T T ;  
         a s s e r t ( i s ( M T T   = =   T y p e T u p l e ! ( u i n t , u i n t , u s h o r t ) ) ) ;  
 }  
  
 / * *  
 T h e   f i l t e r   e q u i v a l e n t   t o   S t a t i c M a p :   a l i a s   i t s e l f   t o   a   T y p e T u p l e  
 c o n t a i n i n g   t h e   t y p e s   i n   T   t h a t   v e r i f y   t h e   p r e d i c a t e   P r e d  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g ,   l o n g )   T T ;  
 a s s e r t ( i s ( S t a t i c F i l t e r ! ( i s I n t e g r a l ,   T T )   = =   T y p e T u p l e ! ( i n t ,   l o n g ) ) ) ;  
 a s s e r t ( i s ( S t a t i c F i l t e r ! ( h a s L e n g t h 2 ,   i n t [ ] ,   i n t [ 3 ] ,   i n t )   = =   T y p e T u p l e ! ( i n t [ ] ,   i n t [ 3 ] ) ) ) ;  
 - - - -  
 * /  
 t e m p l a t e   S t a t i c F i l t e r ( a l i a s   P r e d ,   T . . . )  
 {  
         s t a t i c   i f   ( T . l e n g t h   = =   0 )  
         {  
                 a l i a s   T y p e T u p l e ! ( )   S t a t i c F i l t e r ;  
         }  
         e l s e  
         {  
                 s t a t i c   i f   ( P r e d ! ( T [ 0 ] ) )   {  
                         a l i a s   T y p e T u p l e ! ( T [ 0 ] ,   S t a t i c F i l t e r ! ( P r e d ,   T [ 1   . .   $ ] ) )   S t a t i c F i l t e r ;  
                 }  
                 e l s e   {  
                         a l i a s   S t a t i c F i l t e r ! ( P r e d ,   T [ 1   . .   $ ] )   S t a t i c F i l t e r ;  
                 }  
         }  
 }  
  
 v e r s i o n ( u n i t t e s t )  
 {  
         i m p o r t   s t d . r a n g e :   h a s L e n g t h ;  
 }  
  
 u n i t t e s t  
 {  
         a l i a s   T y p e T u p l e ! ( i n t ,   d o u b l e ,   s t r i n g ,   l o n g )   T T ;  
         a s s e r t ( i s ( S t a t i c F i l t e r ! ( i s I n t e g r a l ,   T T )   = =   T y p e T u p l e ! ( i n t ,   l o n g ) ) ) ;  
         a s s e r t ( i s ( S t a t i c F i l t e r ! ( h a s L e n g t h ,   i n t [ ] ,   i n t [ 3 ] ,   i n t )   = =   T y p e T u p l e ! ( i n t [ ] ,   i n t [ 3 ] ) ) ) ;  
 }  
  
 / * *  
 a l i a s e s   i t s e l f   t o   a   r e p e a t e d   a p p l i c a t i o n   o f   t h e   b i n a r y   t e m p l a t e   F   o n   t h e   t y p e s   o f   T ,   l i k e   r e d u c e  
 d o e s   o n   r a n g e s .  
 E x a m p l e :  
 - - - -  
 t e m p l a t e   C T ( T , T 2 )   {  
         a l i a s   C o m m o n T y p e ! ( T , T 2 )   C T ;  
 }  
  
 t e m p l a t e   T u p ( T 1 , T 2 )   {  
         a l i a s   T u p l e ! ( T 1 ,   T 2 )   T u p ;   / /   T h a t ' s   s t d . t y p e c o n s . T u p l e ,   N O T   s t d . t y p e t u p l e . T y p e T u p l e  
 }  
  
 a l i a s   S t a t i c R e d u c e ! ( C T ,   i n t ,   d o u b l e ,   i n t ,   l o n g )   S R 1 ;   / /   E q u i v a l e n t   t o   C o m m o n T y p e ! ( i n t , d o u b l e , i n t , l o n g )  
 a s s e r t ( i s ( S R 1   = =   d o u b l e ) ) ;  
 a l i a s   S t a t i c R e d u c e ! ( T u p ,   i n t ,   d o u b l e ,   i n t ,   l o n g )   S R 2 ;  
 a s s e r t ( i s ( S R 2   = =   T u p l e ! ( i n t ,   T u p l e ! ( d o u b l e ,   T u p l e ! ( i n t ,   l o n g ) ) ) ) ) ;   / /   N o n - f l a t t e n i n g   t u p l e s  
 - - - -  
 * /  
 t e m p l a t e   S t a t i c R e d u c e ( a l i a s   F ,   T . . . )   {  
         s t a t i c   i f   ( T . l e n g t h   = =   0 )   {  
                 s t a t i c   a s s e r t ( f a l s e ) ;  
         }  
         s t a t i c   i f   ( T . l e n g t h   = =   1 )   {  
                 a l i a s   T [ 0 ]   S t a t i c R e d u c e ;  
         }  
         s t a t i c   i f   ( T . l e n g t h   >   1 )   {  
                 a l i a s   F ! ( T [ 0 ] ,   S t a t i c R e d u c e ! ( F ,   T [ 1 . . $ ] ) )   S t a t i c R e d u c e ;  
         }  
 }  
  
 t e m p l a t e   C T ( T , T 2 )   {  
         a l i a s   C o m m o n T y p e ! ( T , T 2 )   C T ;  
 }  
  
 t e m p l a t e   T u p ( T 1 , T 2 )   {  
         a l i a s   T u p l e ! ( T 1 ,   T 2 )   T u p ;   / /   T h a t ' s   s t d . t y p e c o n s . T u p l e ,   N O T   s t d . t y p e t u p l e . T y p e T u p l e  
 }  
  
 u n i t t e s t   {  
         a l i a s   S t a t i c R e d u c e ! ( C T ,   i n t ,   d o u b l e ,   i n t ,   l o n g )   S R 1 ;  
         a s s e r t ( i s ( S R 1   = =   d o u b l e ) ) ;  
         a l i a s   S t a t i c R e d u c e ! ( T u p ,   i n t ,   d o u b l e ,   i n t ,   l o n g )   S R 2 ;  
         a s s e r t ( i s ( S R 2   = =   T u p l e ! ( i n t ,   T u p l e ! ( d o u b l e ,   T u p l e ! ( i n t ,   l o n g ) ) ) ) ) ;  
 }  
  
 / / /   a l i a s   i t s e l f   t o   t h e   t y p e   o f   a l i a s   a .  
 t e m p l a t e   T y p e O f ( a l i a s   a )  
 {  
         a l i a s   t y p e o f ( a )   T y p e O f ;  
 }  
  
 / * *  
 M a p s   t h e   $ ( M   M a p p e r )   t e m p l a t e   o n   t h e   a l i a s   l i s t .  
 * / 
 t e m p l a t e   M a p O n A l i a s ( a l i a s   M a p p e r ,   a l i a s   c u r r e n t ,   R e s t . . . )  
 {  
         s t a t i c   i f   ( R e s t . l e n g t h )  
                 a l i a s   T y p e T u p l e ! ( M a p p e r ! c u r r e n t ,   M a p O n A l i a s ! ( M a p p e r ,   R e s t ) )   M a p O n A l i a s ;  
         e l s e  
                 a l i a s   M a p p e r ! c u r r e n t   M a p O n A l i a s ;  
 }  
  
 t e m p l a t e   M a p O n A l i a s ( a l i a s   M a p p e r )  
 {  
         a l i a s   T y p e T u p l e ! ( )   M a p O n A l i a s ;  
 }  
  
 / / /   S a m e   a s   $ ( M   S t a t i c R e d u c e ) ,   b u t   o n   a n   a l i a s   l i s t .  
 t e m p l a t e   R e d u c e O n A l i a s ( a l i a s   R e d u c e r ,   a l i a s   c u r r e n t ,   R e s t . . . )  
 {  
         a l i a s   S t a t i c R e d u c e 0 ! ( R e d u c e r ,   c u r r e n t ,   R e s t )   R e d u c e O n A l i a s ;  
 }  
  
 / * *  
 F o l d s   ( r e d u c e s )   t h e   T   l i s t ,   g i v e n   a   r e d u c i n g   t e m p l a t e   F   a n d   a n   i n i t i a l   a c c u m u l a t o r   v a l u e .  
 F   m u s t   b e   a   b i n a r y   t e m p l a t e   a n d   a c c u m u l a t o r   a   v a l u e   a c c e p t e d   b y   F   a s   f i r s t   p a r a m e t e r .  
 * / 
 t e m p l a t e   S t a t i c R e d u c e 0 ( a l i a s   F ,   a l i a s   a c c u m u l a t o r ,   T . . . )   { 
         s t a t i c   i f   ( T . l e n g t h   = =   0 ) 
                 a l i a s   a c c u m u l a t o r   S t a t i c R e d u c e 0 ; 
         e l s e 
                 a l i a s   S t a t i c R e d u c e 0 ! ( F ,   F ! ( a c c u m u l a t o r ,   T [ 0 ] ) ,   T [ 1 . . $ ] )   S t a t i c R e d u c e 0 ; 
 } 
  
 / * *  
 G i v e s   t h e   T y p e T u p l e   r e s u l t i n g   f r o m   t h e   s u c e s s i v e   a p p l i c a t i o n s   o f   F   t o   r e d u c e  
 t h e   T   l i s t .  
 S e e _ A l s o :   $ ( M   d r a n g e s . a l g o r i t h m 2 . s c a n ) . 
 * /  
 t e m p l a t e   S t a t i c S c a n ( a l i a s   F ,   T . . . ) 
 {  
         s t a t i c   i f   ( T . l e n g t h   = =   0 )  
                 a l i a s   T y p e T u p l e ! ( )   S t a t i c S c a n ;   / /   T h i s   c a s e   s h o u l d   n e v e r   h a p p e n   w i t h   n o r m a l   u s e 
         s t a t i c   i f   ( T . l e n g t h   = =   1 ) 
                 a l i a s   T y p e T u p l e ! ( T [ 0 ] )   S t a t i c S c a n ; 
         e l s e 
                 a l i a s   T y p e T u p l e ! ( T [ 0 ] ,   S t a t i c S c a n ! ( F ,   F ! ( T [ 0 ] ,   T [ 1 ] ) ,   T [ 2 . . $ ] ) )   S t a t i c S c a n ; 
 } 
  
 / * *  
 G i v e s   t h e   t y p e t u p l e   ( T ,   F ! ( T ) ,   F ! ( F ! ( T ) ) ,   F ! ( F ! ( F ! ( T ) ) ) ,   . . . ) ,   u p   t o   t i m e s   a p p l i c a t i o n s   o f   F .  
 * / 
 t e m p l a t e   S t a t i c I t e r a t e ( s i z e _ t   t i m e s ,   a l i a s   F ,   T . . . )  
 { 
         s t a t i c   i f   ( t i m e s   = =   0 ) 
                 a l i a s   T y p e T u p l e ! ( T )   S t a t i c I t e r a t e ; 
         e l s e 
                 a l i a s   T y p e T u p l e ! ( T ,   S t a t i c I t e r a t e ! ( t i m e s - 1 ,   F ,   F ! T ) )   S t a t i c I t e r a t e ; 
 } 
  
 / / /   T h e   s a m e ,   b u t   o n   a n   a l i a s   l i s t .   U s e f u l   f o r   i t e r a t i n g   o n   v a l u e s :   0 , 1 , 2 , 3 . . .  
 t e m p l a t e   S t a t i c I t e r a t e O n A l i a s ( s i z e _ t   t i m e s ,   a l i a s   F ,   a l i a s   v a l u e ) 
 { 
         s t a t i c   i f   ( t i m e s   = =   0 ) 
                 a l i a s   v a l u e   S t a t i c I t e r a t e ; 
         e l s e 
                 a l i a s   T y p e T u p l e ! ( v a l u e ,   S t a t i c I t e r a t e ! ( t i m e s - 1 ,   F ,   F ! v a l u e ) )   S t a t i c I t e r a t e ; 
 } 
  
 / * *  
 G i v e n   a   t e m p l a t e   F   a n d   a   s t a t e   S t a t e ,   u n f o l d s   F   t i m e s   _ t i m e s .  
 A p p l y i n g   F   o n   a   t y p e   m u s t   g i v e   a   t y p e t u p l e   w h o s e   f i r s t   e l e m e n t   i s   t h e   r e s u l t   a n d   t h e   r e s t  
 t h e   n e x t   s t a t e .  
 S e e _ A l s o :   $ ( M   d r a n g e s . a l g o r i t h m 2 . u n f o l d ) ,   t o   g e t   s o m e   g r i p   o n   t h i s .  
 * / 
 t e m p l a t e   S t a t i c U n f o l d ( s i z e _ t   t i m e s ,   a l i a s   F ,   S t a t e . . . ) 
 { 
         s t a t i c   i f   ( t i m e s   = =   0 ) 
                 a l i a s   T y p e T u p l e ! ( )   S t a t i c U n f o l d ; 
         e l s e 
                 a l i a s   T y p e T u p l e ! ( F ! ( S t a t e ) [ 0 ] ,   S t a t i c U n f o l d ! ( t i m e s - 1 ,   F ,   F ! S t a t e [ 1 . . $ ] ) )   S t a t i c U n f o l d ; 
 } 
  
 / / /   G i v e n   a   t y p e t u p l e   T ,   g i v e s   ( T [ 0 ] ,   T [ s t e p ] ,   T [ 2 * s t e p ] ,   T [ 3 * s t e p ] , . . . ) 
 t e m p l a t e   S t a t i c S t r i d e ( a l i a s   s t e p ,   T . . . )   i f   ( s t e p   >   0 ) 
 { 
         s t a t i c   i f   ( T . l e n g t h   < =   s t e p ) 
                 a l i a s   T y p e T u p l e ! ( T [ 0 ] )   S t a t i c S t r i d e ; 
         e l s e 
                 a l i a s   T y p e T u p l e ! ( T [ 0 ] ,   S t a t i c S t r i d e ! ( s t e p ,   T [ s t e p . . $ ] ) )   S t a t i c S t r i d e ; 
 } 
  
 / +   S e e   S e g m e n t T y p e s  
 t e m p l a t e   S t a t i c G r o u p ( a l i a s   s i z e ,   T . . . )  
 {  
         s t a t i c   i f   ( T . l e n g t h   = =   0 )  
                 a l i a s   T y p e T u p l e ! ( )   S t a t i c G r o u p ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( T u p l e ! ( T [ 0 . . s i z e ] ) ,   S t a t i c G r o u p ! ( s i z e ,   T [ s i z e . . $ ] ) )   S t a t i c G r o u p ;  
 }  
 + /  
  
 / * *  
 T a k e s   e l e m e n t s   i n   a   t y p e t u p l e   a s   l o n g   a s   t h e   p r e d i c a t e   t e m p l a t e   $ ( M   p r e d )   i s   t r u e  
 f o r   t h e   c u r r e n t   e l e m e n t .  
 E x a m p l e :  
 - - - -  
 a l i a s   T y p e T u p l e ! ( i n t ,   s h o r t ,   b y t e ,   d o u b l e ,   i n t ,   l o n g )   T y p e s ;  
 a l i a s   S t a t i c T a k e W h i l e ! ( i s I n t e g r a l ,   T y p e s )   F i r s t I n t e g r a l s ;  
 a s s e r ( i s (   F i r s t I n t e g r a l s   = =   T y p e T u p l e ! ( i n t , s h o r t , b y t e ) ) ) ;   / /   s t o p p e d   w h e n   d o u b l e   w a s   e n c o u n t e r e d  
 - - - -  
 * /  
 t e m p l a t e   S t a t i c T a k e W h i l e ( a l i a s   p r e d ,   T y p e s . . . )  
 {  
         s t a t i c   i f   ( T y p e s . l e n g t h   & &   p r e d ! ( T y p e s [ 0 ] ) )  
                 a l i a s   T y p e T u p l e ! ( T y p e s [ 0 ] ,   S t a t i c T a k e W h i l e ! ( p r e d ,   T y p e s [ 1 . . $ ] ) )   S t a t i c T a k e W h i l e ;  
         e l s e  
                 a l i a s   T y p e T u p l e ! ( )   S t a t i c T a k e W h i l e ;  
 }  
  
 / / /   T h e   c o u s i n   o f   $ ( M   S t a t i c T a k e W h i l e ) .   D r o p s   t y p e s   f r o m   a   t y p e t u p l e   a s   l o n g   a s   t h e   p r e d i c a t e   i s   t r u e .  
 t e m p l a t e   S t a t i c D r o p W h i l e ( a l i a s   p r e d ,   T y p e s . . . )  
 {  
         s t a t i c   i f   ( T y p e s . l e n g t h   & &   p r e d ! ( T y p e s [ 0 ] ) )  
                 a l i a s   S t a t i c D r o p W h i l e ! ( p r e d ,   T y p e s [ 1 . . $ ] )   S t a t i c D r o p W h i l e ;  
         e l s e  
                 a l i a s   T y p e s   S t a t i c D r o p W h i l e ;  
 }  
  
 / * *  
 R o t a t e s   a   t y p e t u p l e   a s   l o n g   a s   t h e   p r e d i c a t e   t e m p l a t e   $ ( M   p r e d )   i s   t r u e   f o r   t h e   f i r s t   e l e m e n t .  
 I f   a   c o m p l e t e   r o t a t i o n   i s   d o n e   ( $ ( M   p r e d )   g i v e s   t r u e   f o r   a l l   e l e m e n t s   o f   T ) ,   $ ( M   _ S t a t i c R o t a t e W h i l e )   r e c o g n i z e s   t h i s   a n d   a l i a s e s   i t s e l f   t o   T y p e s  
 i n s t e a d   o f   c y c l i n g   f o r e v e r . . .  
 * /  
 t e m p l a t e   S t a t i c R o t a t e W h i l e ( a l i a s   p r e d ,   T y p e s . . . )  
 {  
         a l i a s   S t a t i c R o t a t e W h i l e I m p l ! ( p r e d ,   0 ,   T y p e s )   S t a t i c R o t a t e W h i l e ;  
 }  
  
 t e m p l a t e   S t a t i c R o t a t e W h i l e I m p l ( a l i a s   p r e d ,   s i z e _ t   n ,   T y p e s . . . )  
 {  
         s t a t i c   i f   ( n   <   T y p e s . l e n g t h   & &   p r e d ! ( T y p e s [ 0 ] ) )  
                 a l i a s   S t a t i c R o t a t e W h i l e I m p l ! ( p r e d ,   n + 1 ,   T y p e s [ 1 . . $ ] ,   T y p e s [ 0 ] )   S t a t i c R o t a t e W h i l e I m p l ;  
         e l s e  
                 a l i a s   T y p e s   S t a t i c R o t a t e W h i l e I m p l ;  
 }  
 
 t e m p l a t e   A d d O n e ( a l i a s   v a l u e )   { 
         e n u m   A d d O n e   =   v a l u e + 1 ; 
 } 
  
 / / /   T h e   T y p e T u p l e   ( 0 , 1 , 2 ,   . . . ,   t o )   ( t o   i s   i n c l u d e d ) 
 t e m p l a t e   S t a t i c R a n g e ( a l i a s   t o ) 
 { 
         a l i a s   S t a t i c I t e r a t e O n A l i a s ! ( t o ,   A d d O n e ,   0 )   S t a t i c R a n g e ; 
 } 
  
 / / /   T h e   T y p e T u p l e   ( f r o m ,   f r o m + 1 ,   . . . ,   t o )   ( t o   i s   i n c l u d e d ) 
 t e m p l a t e   S t a t i c R a n g e ( a l i a s   f r o m ,   a l i a s   t o ) 
 { 
         a l i a s   S t a t i c I t e r a t e O n A l i a s ! ( t o   -   f r o m ,   A d d O n e ,   f r o m )   S t a t i c R a n g e ; 
 } 
  
 / / /   T h e   T y p e T u p l e   ( f r o m ,   f r o m + s t e p ,   f r o m + 2 * s t e p ,   . . .   t o ) .   t o   i s   n o t   n e c e s s a r i l y   i n c l u d e d   i f   s t e p   ' j u m p s '   a b o v e   i t . 
 t e m p l a t e   S t a t i c R a n g e ( a l i a s   f r o m ,   a l i a s   t o ,   a l i a s   s t e p ) 
 { 
         a l i a s   S t a t i c S t r i d e ! ( s t e p ,   S t a t i c R a n g e ! ( f r o m ,   t o ) )   S t a t i c R a n g e ; 
 } 
  
  
  
 / /   a d d   T y p e s [ 0 ]   t o   T y p e s [ 1 . . $ ]  
 t e m p l a t e   A d d T o S o r t e d ( a l i a s   P r e d ,   T y p e s . . . )  
 {  
         s t a t i c   i f   ( T y p e s . l e n g t h   <   2 )                                                         / /   0   o r   1   t y p e :   a l r e a d y   s o r t e d .  
                 a l i a s   T y p e s   A d d T o S o r t e d ;  
         e l s e   s t a t i c   i f   ( P r e d ! ( T y p e s [ 0 ] ,   T y p e s [ 1 ] )   < =   0 )   / /   t e s t   l e f t   e x t r e m i t y  
                 a l i a s   T y p e s   A d d T o S o r t e d ;  
         e l s e   s t a t i c   i f   ( P r e d ! ( T y p e s [ 0 ] ,   T y p e s [ $ - 1 ] )   >   0 ) / /   t e s t   r i g h t   e x t r e m i t y  
                 a l i a s   T y p e T u p l e ! ( T y p e s [ 1 . . $ ] ,   T y p e s [ 0 ] )   A d d T o S o r t e d ;  
         e l s e   s t a t i c   i f   ( P r e d ! ( T y p e s [ 0 ] ,   T y p e s [ ( $ + 1 ) / 2 ] )   = =   0 )         / /   t e s t   w i t h   p i v o t   ( m i d d l e )  
                 a l i a s   T y p e T u p l e ! ( T y p e s [ 1 . . ( $ + 1 ) / 2 ] ,   T y p e s [ 0 ] ,   T y p e s [ ( $ + 1 ) / 2 . . $ ] )   A d d T o S o r t e d ;  
         e l s e   s t a t i c   i f   ( P r e d ! ( T y p e s [ 0 ] ,   T y p e s [ ( $ + 1 ) / 2 ] )   <   0 )         / /   t e s t   w i t h   p i v o t   ( m i d d l e ) :   l e f t   h a n d   b r a n c h  
                 a l i a s   T y p e T u p l e ! ( A d d T o S o r t e d ! ( P r e d ,   T y p e s [ 0 . . ( $ + 1 ) / 2 ] ) ,   T y p e s [ ( $ + 1 ) / 2 . . $ ] )   A d d T o S o r t e d ;  
         e l s e   s t a t i c   i f   ( P r e d ! ( T y p e s [ 0 ] ,   T y p e s [ ( $ + 1 ) / 2 ] )   >   0 )         / /   t e s t   w i t h   p i v o t   ( m i d d l e ) :   r i g h t   h a n d   b r a n c h  
                 a l i a s   T y p e T u p l e ! ( T y p e s [ 1 . . ( $ + 1 ) / 2 ] ,   A d d T o S o r t e d ! ( P r e d ,   T y p e s [ 0 ] ,   T y p e s [ ( $ + 1 ) / 2 . . $ ] ) )   A d d T o S o r t e d ;  
         e l s e   s t a t i c   a s s e r t ( f a l s e ) ;  
 }  
  
 t e m p l a t e   S o r t T y p e s I m p l ( a l i a s   P r e d ,   T y p e s . . . )  
 {  
         t e m p l a t e   A d d T y p e ( S o r t e d ,   N e w T y p e )   / /   S o r t e d   i s   s o r t e d   i n s i d e   a   T u p l e ,   t o   p r o p a g a t e   i t  
         {  
                 a l i a s   T u p l e ! ( A d d T o S o r t e d ! ( P r e d ,   N e w T y p e ,   S o r t e d . T y p e s ) )   A d d T y p e ;  
         }  
  
         a l i a s   S t a t i c R e d u c e 0 ! ( A d d T y p e ,   T u p l e ! ( T y p e s [ 0 ] ) ,   T y p e s [ 1 . . $ ] ) . T y p e s   r e s u l t ;  
 }  
  
 / * *  
 S o r t   t y p e s   i n   T y p e s ,   a c c o r d i n g   t o   p r e d i c a t e   P r e d .   P r e d   i s   a   b i n a r y   t e m p l a t e  
 t h a t   m u s t   a l i a s   i t s e l f   t o   0   i f   t y p e s   a r e   e q u a l ,   t o   - 1   i f   T 1   <   T 2   a n d   + 1   i f   T 1   >   T 2 .  
 I f   y o u   d o   n o t   c a r e   f o r   t h e   p r e c i s e   o r d e r i n g   ( s u c h   a s   w h e n   y o u   j u s t   w a n t   t o   v e r i f y   t h a t   t w o   t u p l e s  
 a r e   t h e   s a m e ) ,   y o u   c a n   u s e   d r a n g e s . t e m p l a t e s . C o m p a r e T y p e s .  
 * /  
 t e m p l a t e   S o r t T y p e s ( a l i a s   P r e d ,   T y p e s . . . )  
 {  
         a l i a s   S o r t T y p e s I m p l ! ( P r e d ,   T y p e s ) . r e s u l t   S o r t T y p e s ;  
 }  
  
 / / /   A l i a s   i t s e l f   t o   t h e   n t h   f i e l d / t y p e   i n   a   T y p e T u p l e .   U s e f u l   f o r   t e m p l a t e   c o m p o s i t i o n .  
 t e m p l a t e   N t h T y p e ( s i z e _ t   n )  
 {  
         t e m p l a t e   N t h T y p e ( T . . . )   i f   ( T . l e n g t h   >   n )  
         {  
                 a l i a s   T [ n ]   N t h T y p e ;  
         }  
 }  
  
 / / /   S a m e   a s   N t h T y p e .   A l i a s   i t s e l f   t o   t h e   f i r s t   t y p e   i n   a   t y p e t u p l e .  
 t e m p l a t e   F i r s t ( T . . . )   i f   ( T . l e n g t h )  
 {  
         a l i a s   T [ 0 ]   F i r s t ;  
 }  
  
 / / /   S a m e   a s   N t h T y p e .   A l i a s   i t s e l f   t o   t h e   s e c o n d   t y p e   i n   a   t y p e t u p l e .  
 t e m p l a t e   S e c o n d ( T . . . )   i f   ( T . l e n g t h   >   1 )  
 {  
         a l i a s   T [ 1 ]   S e c o n d ;  
 }  
  
 / * *  
 A l i a s   i t s e l f   t o   t h e   l a s t   t y p e   i n   a   T y p e T u p l e .   A s   t h e   p r e v i o u s   t e m p l a t e ,   i t ' s   s o m e t i m e s   u s e f u l  
 w h i l e   c o m p o s i n g   t e m p l a t e s .  
 * /  
 t e m p l a t e   L a s t ( T . . . )   i f   ( T . l e n g t h )  
 {  
         a l i a s   T [ $ - 1 ]   L a s t ;  
 }  
  
 / * *  
 A l i a s   i t s e l f   t o   a l l   t y p e s   e x c e p t   t h e   f i r s t   i n   a   T y p e T u p l e .  
 * /  
 t e m p l a t e   T a i l ( T . . . )   i f   ( T . l e n g t h )  
 {  
         a l i a s   T [ 1 . . $ - 1 ]   T a i l ;  
 }  
  
 / / /   D o u b l e s   a   T y p e T u p l e .   i e :   f r o m   ( i n t ,   d o u b l e ) ,   m a k e s   a   ( i n t , d o u b l e , i n t , d o u b l e ) .  
 t e m p l a t e   D o u b l e r ( T . . . )  
 {  
         a l i a s   T y p e T u p l e ! ( T , T )   D o u b l e r ;  
 }  
