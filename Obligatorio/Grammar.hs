{-# OPTIONS_GHC -w #-}
module Grammar where
import Tokens
import Data.Fixed
import Data.List
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,51) ([2048,16384,0,4,0,256,1536,12288,0,4,256,512,768,6144,0,2,260,0,0,32768,24576,0,0,0,0,0,8192,8,2,16,32,768,0,0,2,16,1024,128,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","BabbleG","List_Prod","Prod","Terms","Elems","Elem","L","T","NT","':'","';'","prob","nprob","'|'","'_'","%eof"]
        bit_start = st * 19
        bit_end = (st + 1) * 19
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..18]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (12) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (13) = happyShift action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (19) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (13) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (11) = happyShift action_10
action_5 (12) = happyShift action_11
action_5 (8) = happyGoto action_12
action_5 (9) = happyGoto action_8
action_5 (10) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (11) = happyShift action_10
action_6 (12) = happyShift action_11
action_6 (8) = happyGoto action_7
action_6 (9) = happyGoto action_8
action_6 (10) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (14) = happyShift action_18
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (17) = happyShift action_17
action_8 _ = happyReduce_9

action_9 (15) = happyShift action_16
action_9 _ = happyReduce_12

action_10 (11) = happyShift action_10
action_10 (12) = happyShift action_11
action_10 (10) = happyGoto action_15
action_10 _ = happyReduce_15

action_11 (11) = happyShift action_10
action_11 (12) = happyShift action_11
action_11 (10) = happyGoto action_14
action_11 _ = happyReduce_16

action_12 (14) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (12) = happyShift action_23
action_13 (18) = happyShift action_24
action_13 (5) = happyGoto action_21
action_13 (6) = happyGoto action_22
action_13 _ = happyReduce_1

action_14 _ = happyReduce_13

action_15 _ = happyReduce_14

action_16 (16) = happyShift action_20
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (11) = happyShift action_10
action_17 (12) = happyShift action_11
action_17 (8) = happyGoto action_19
action_17 (9) = happyGoto action_8
action_17 (10) = happyGoto action_9
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_10

action_20 _ = happyReduce_11

action_21 _ = happyReduce_2

action_22 (12) = happyShift action_23
action_22 (18) = happyShift action_24
action_22 (5) = happyGoto action_27
action_22 (6) = happyGoto action_22
action_22 _ = happyReduce_3

action_23 (13) = happyShift action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (13) = happyShift action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (11) = happyShift action_30
action_25 (7) = happyGoto action_29
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (11) = happyShift action_10
action_26 (12) = happyShift action_11
action_26 (8) = happyGoto action_28
action_26 (9) = happyGoto action_8
action_26 (10) = happyGoto action_9
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_4

action_28 (14) = happyShift action_33
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (14) = happyShift action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (17) = happyShift action_31
action_30 _ = happyReduce_7

action_31 (11) = happyShift action_30
action_31 (7) = happyGoto action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_6

action_33 _ = happyReduce_5

action_34 _ = happyReduce_8

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ChainNTerm happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 ((happy_var_1,[(happy_var_1,happy_var_3)])
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 5 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ChainNTerm happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 ((happy_var_1, groupProductions ([(happy_var_1,happy_var_3)]++happy_var_5))
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1] ++ happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ChainNTerm happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_1,happy_var_3)
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 6 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (("_",happy_var_3)
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyTerminal (ChainTerm happy_var_1))
	 =  HappyAbsSyn7
		 ([([Term happy_var_1],1.0)]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (ChainTerm happy_var_1))
	 =  HappyAbsSyn7
		 ([([Term happy_var_1],1.0)]++happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]++happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  9 happyReduction_11
happyReduction_11 (HappyTerminal (Nprob happy_var_3))
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ((happy_var_1,happy_var_3::Double)
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ((happy_var_1,1.0)
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  10 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_2)
	(HappyTerminal (ChainNTerm happy_var_1))
	 =  HappyAbsSyn10
		 ([(NoTerm happy_var_1)]++happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_2)
	(HappyTerminal (ChainTerm happy_var_1))
	 =  HappyAbsSyn10
		 ([(Term happy_var_1)]++happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 (HappyTerminal (ChainTerm happy_var_1))
	 =  HappyAbsSyn10
		 ([(Term happy_var_1)]
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyTerminal (ChainNTerm happy_var_1))
	 =  HappyAbsSyn10
		 ([(NoTerm happy_var_1)]
	)
happyReduction_16 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 19 19 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ChainTerm happy_dollar_dollar -> cont 11;
	ChainNTerm happy_dollar_dollar -> cont 12;
	Colon -> cont 13;
	SemiColon -> cont 14;
	Prob -> cont 15;
	Nprob happy_dollar_dollar -> cont 16;
	Pipe -> cont 17;
	UnderScore -> cont 18;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 19 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Symbol =NoTerm String | Term String
    deriving(Show,Eq)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])

groupProductions:: [Prod] -> [Prod]
groupProductions prods = [ foldl (\(a1,a2) (_,b2) -> (x,b2++a2)) (x,[]) (filter (\a -> (fst a) == x) prods) | x<-heads ]
    where
        heads = Data.List.nub (map (fst) prods)

main = do 
    contents <- getLine
    putStrLn (show (parseCalc (alexScanTokens  contents)))
    main

grammar1="Exp : Exp '+' Exp | Exp '*' Exp | '(' Exp ')' | NUM ; NUM : '0' | '1' | '2' | '3' | '4' | '100' | '1000' ; _ : ' ' | '\n' | '\t' ;"
--Ejemplo 2
grammar2="Exp : Exp '+' Exp %prob 0.4 ; Exp : Exp '*' Exp %prob 0.4 ; Exp : '(' Exp ')' %prob 0.1 | NUM %prob 0.1 ;"
--Otros ejemplos
grammar3="A : BC %prob 0.1| ABC %prob 0.2; A : CB ; C: '3' | B %prob 0.3; B : '1' '|' '2' '|' '3' %prob 0.3 | '1' '|' B '2' B '|' '3' %prob 0.3 ; _: ' ' | '7'; "

grammar4="S: 'a'; "
grammar5="Binas : '1' Binas; Binas : '0' Binas; Binas : '0' | '1';"
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc13656_0/ghc_2.h" #-}














































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
