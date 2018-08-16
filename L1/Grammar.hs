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

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,182) ([1792,9345,14337,9224,0,49536,0,65520,32,0,0,0,0,0,0,8192,32800,0,33031,4,2104,36,0,0,0,13,32768,2047,32769,16515,18,1052,402,0,1152,0,0,0,8192,1,0,0,0,384,24576,48,64512,2111,0,0,0,0,1,1536,11,65472,195,16448,256,512,2050,4096,16400,32768,128,2,1028,16,8224,128,256,1025,2048,8200,16384,64,1,514,8,4112,64,32896,512,1024,4100,0,32768,4,0,36,0,288,0,0,0,0,4096,16400,32768,16515,2,1052,18,8416,144,1792,1153,0,2048,0,0,0,0,6,0,48,64512,3072,0,0,0,0,0,0,0,0,0,32256,1024,61440,8195,32768,31,1,252,8,2016,64,16128,512,30720,4096,49152,32771,0,0,4,0,32,0,256,0,2048,0,0,0,0,0,0,0,0,0,16832,2336,0,0,0,12384,0,16380,8,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Expresion","List","ElementList","BExpresion","AExpresion","num","'T'","'F'","'*'","'/'","'//'","'%'","'+'","'-'","'=='","'!='","'<'","'>'","'<='","'>='","'!'","'&&'","'||'","'('","')'","'^'","'['","']'","','","'#'","'e'","%eof"]
        bit_start = st * 35
        bit_end = (st + 1) * 35
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..34]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (9) = happyShift action_4
action_0 (10) = happyShift action_5
action_0 (11) = happyShift action_6
action_0 (17) = happyShift action_7
action_0 (24) = happyShift action_8
action_0 (27) = happyShift action_13
action_0 (30) = happyShift action_14
action_0 (33) = happyShift action_15
action_0 (4) = happyGoto action_10
action_0 (5) = happyGoto action_11
action_0 (7) = happyGoto action_2
action_0 (8) = happyGoto action_12
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_4
action_1 (10) = happyShift action_5
action_1 (11) = happyShift action_6
action_1 (17) = happyShift action_7
action_1 (24) = happyShift action_8
action_1 (27) = happyShift action_9
action_1 (7) = happyGoto action_2
action_1 (8) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (18) = happyShift action_45
action_2 (19) = happyShift action_46
action_2 (25) = happyShift action_47
action_2 (26) = happyShift action_48
action_2 _ = happyReduce_1

action_3 (12) = happyShift action_26
action_3 (13) = happyShift action_27
action_3 (14) = happyShift action_28
action_3 (15) = happyShift action_29
action_3 (16) = happyShift action_30
action_3 (17) = happyShift action_31
action_3 (18) = happyShift action_32
action_3 (19) = happyShift action_33
action_3 (20) = happyShift action_34
action_3 (21) = happyShift action_35
action_3 (22) = happyShift action_36
action_3 (23) = happyShift action_37
action_3 (29) = happyShift action_38
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_31

action_5 _ = happyReduce_17

action_6 _ = happyReduce_18

action_7 (9) = happyShift action_4
action_7 (17) = happyShift action_7
action_7 (27) = happyShift action_44
action_7 (8) = happyGoto action_43
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (9) = happyShift action_4
action_8 (10) = happyShift action_5
action_8 (11) = happyShift action_6
action_8 (17) = happyShift action_7
action_8 (24) = happyShift action_8
action_8 (27) = happyShift action_9
action_8 (7) = happyGoto action_42
action_8 (8) = happyGoto action_3
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (9) = happyShift action_4
action_9 (10) = happyShift action_5
action_9 (11) = happyShift action_6
action_9 (17) = happyShift action_7
action_9 (24) = happyShift action_8
action_9 (27) = happyShift action_9
action_9 (7) = happyGoto action_24
action_9 (8) = happyGoto action_25
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (35) = happyAccept
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (16) = happyShift action_39
action_11 (18) = happyShift action_40
action_11 (19) = happyShift action_41
action_11 _ = happyReduce_3

action_12 (12) = happyShift action_26
action_12 (13) = happyShift action_27
action_12 (14) = happyShift action_28
action_12 (15) = happyShift action_29
action_12 (16) = happyShift action_30
action_12 (17) = happyShift action_31
action_12 (18) = happyShift action_32
action_12 (19) = happyShift action_33
action_12 (20) = happyShift action_34
action_12 (21) = happyShift action_35
action_12 (22) = happyShift action_36
action_12 (23) = happyShift action_37
action_12 (29) = happyShift action_38
action_12 _ = happyReduce_2

action_13 (9) = happyShift action_4
action_13 (10) = happyShift action_5
action_13 (11) = happyShift action_6
action_13 (17) = happyShift action_7
action_13 (24) = happyShift action_8
action_13 (27) = happyShift action_13
action_13 (30) = happyShift action_14
action_13 (5) = happyGoto action_23
action_13 (7) = happyGoto action_24
action_13 (8) = happyGoto action_25
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (9) = happyShift action_4
action_14 (10) = happyShift action_5
action_14 (11) = happyShift action_6
action_14 (17) = happyShift action_7
action_14 (24) = happyShift action_8
action_14 (27) = happyShift action_13
action_14 (30) = happyShift action_14
action_14 (31) = happyShift action_22
action_14 (5) = happyGoto action_18
action_14 (6) = happyGoto action_19
action_14 (7) = happyGoto action_20
action_14 (8) = happyGoto action_21
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (27) = happyShift action_17
action_15 (30) = happyShift action_14
action_15 (5) = happyGoto action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_7

action_17 (27) = happyShift action_17
action_17 (30) = happyShift action_14
action_17 (5) = happyGoto action_23
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_11

action_19 (31) = happyShift action_73
action_19 (32) = happyShift action_74
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (18) = happyShift action_45
action_20 (19) = happyShift action_46
action_20 (25) = happyShift action_47
action_20 (26) = happyShift action_48
action_20 _ = happyReduce_13

action_21 (12) = happyShift action_26
action_21 (13) = happyShift action_27
action_21 (14) = happyShift action_28
action_21 (15) = happyShift action_29
action_21 (16) = happyShift action_30
action_21 (17) = happyShift action_31
action_21 (18) = happyShift action_32
action_21 (19) = happyShift action_33
action_21 (20) = happyShift action_34
action_21 (21) = happyShift action_35
action_21 (22) = happyShift action_36
action_21 (23) = happyShift action_37
action_21 (29) = happyShift action_38
action_21 _ = happyReduce_12

action_22 _ = happyReduce_8

action_23 (28) = happyShift action_72
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (18) = happyShift action_45
action_24 (19) = happyShift action_46
action_24 (25) = happyShift action_47
action_24 (26) = happyShift action_48
action_24 (28) = happyShift action_71
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_26
action_25 (13) = happyShift action_27
action_25 (14) = happyShift action_28
action_25 (15) = happyShift action_29
action_25 (16) = happyShift action_30
action_25 (17) = happyShift action_31
action_25 (18) = happyShift action_32
action_25 (19) = happyShift action_33
action_25 (20) = happyShift action_34
action_25 (21) = happyShift action_35
action_25 (22) = happyShift action_36
action_25 (23) = happyShift action_37
action_25 (28) = happyShift action_70
action_25 (29) = happyShift action_38
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (9) = happyShift action_4
action_26 (17) = happyShift action_7
action_26 (27) = happyShift action_44
action_26 (8) = happyGoto action_69
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (9) = happyShift action_4
action_27 (17) = happyShift action_7
action_27 (27) = happyShift action_44
action_27 (8) = happyGoto action_68
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (9) = happyShift action_4
action_28 (17) = happyShift action_7
action_28 (27) = happyShift action_44
action_28 (8) = happyGoto action_67
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (9) = happyShift action_4
action_29 (17) = happyShift action_7
action_29 (27) = happyShift action_44
action_29 (8) = happyGoto action_66
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (9) = happyShift action_4
action_30 (17) = happyShift action_7
action_30 (27) = happyShift action_44
action_30 (8) = happyGoto action_65
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (9) = happyShift action_4
action_31 (17) = happyShift action_7
action_31 (27) = happyShift action_44
action_31 (8) = happyGoto action_64
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (9) = happyShift action_4
action_32 (17) = happyShift action_7
action_32 (27) = happyShift action_44
action_32 (8) = happyGoto action_63
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (9) = happyShift action_4
action_33 (17) = happyShift action_7
action_33 (27) = happyShift action_44
action_33 (8) = happyGoto action_62
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (9) = happyShift action_4
action_34 (17) = happyShift action_7
action_34 (27) = happyShift action_44
action_34 (8) = happyGoto action_61
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (9) = happyShift action_4
action_35 (17) = happyShift action_7
action_35 (27) = happyShift action_44
action_35 (8) = happyGoto action_60
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (9) = happyShift action_4
action_36 (17) = happyShift action_7
action_36 (27) = happyShift action_44
action_36 (8) = happyGoto action_59
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (9) = happyShift action_4
action_37 (17) = happyShift action_7
action_37 (27) = happyShift action_44
action_37 (8) = happyGoto action_58
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (9) = happyShift action_4
action_38 (17) = happyShift action_7
action_38 (27) = happyShift action_44
action_38 (8) = happyGoto action_57
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (27) = happyShift action_17
action_39 (30) = happyShift action_14
action_39 (5) = happyGoto action_56
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (27) = happyShift action_17
action_40 (30) = happyShift action_14
action_40 (5) = happyGoto action_55
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (27) = happyShift action_17
action_41 (30) = happyShift action_14
action_41 (5) = happyGoto action_54
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_27

action_43 _ = happyReduce_39

action_44 (9) = happyShift action_4
action_44 (17) = happyShift action_7
action_44 (27) = happyShift action_44
action_44 (8) = happyGoto action_53
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (9) = happyShift action_4
action_45 (10) = happyShift action_5
action_45 (11) = happyShift action_6
action_45 (17) = happyShift action_7
action_45 (24) = happyShift action_8
action_45 (27) = happyShift action_9
action_45 (7) = happyGoto action_52
action_45 (8) = happyGoto action_3
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (9) = happyShift action_4
action_46 (10) = happyShift action_5
action_46 (11) = happyShift action_6
action_46 (17) = happyShift action_7
action_46 (24) = happyShift action_8
action_46 (27) = happyShift action_9
action_46 (7) = happyGoto action_51
action_46 (8) = happyGoto action_3
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (9) = happyShift action_4
action_47 (10) = happyShift action_5
action_47 (11) = happyShift action_6
action_47 (17) = happyShift action_7
action_47 (24) = happyShift action_8
action_47 (27) = happyShift action_9
action_47 (7) = happyGoto action_50
action_47 (8) = happyGoto action_3
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (9) = happyShift action_4
action_48 (10) = happyShift action_5
action_48 (11) = happyShift action_6
action_48 (17) = happyShift action_7
action_48 (24) = happyShift action_8
action_48 (27) = happyShift action_9
action_48 (7) = happyGoto action_49
action_48 (8) = happyGoto action_3
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (25) = happyShift action_47
action_49 _ = happyReduce_29

action_50 _ = happyReduce_28

action_51 (18) = happyFail []
action_51 (19) = happyFail []
action_51 (25) = happyShift action_47
action_51 (26) = happyShift action_48
action_51 _ = happyReduce_22

action_52 (18) = happyFail []
action_52 (19) = happyFail []
action_52 (25) = happyShift action_47
action_52 (26) = happyShift action_48
action_52 _ = happyReduce_21

action_53 (12) = happyShift action_26
action_53 (13) = happyShift action_27
action_53 (14) = happyShift action_28
action_53 (15) = happyShift action_29
action_53 (16) = happyShift action_30
action_53 (17) = happyShift action_31
action_53 (28) = happyShift action_70
action_53 (29) = happyShift action_38
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_5

action_55 _ = happyReduce_6

action_56 _ = happyReduce_4

action_57 _ = happyReduce_34

action_58 (12) = happyShift action_26
action_58 (13) = happyShift action_27
action_58 (14) = happyShift action_28
action_58 (15) = happyShift action_29
action_58 (16) = happyShift action_30
action_58 (17) = happyShift action_31
action_58 (29) = happyShift action_38
action_58 _ = happyReduce_26

action_59 (12) = happyShift action_26
action_59 (13) = happyShift action_27
action_59 (14) = happyShift action_28
action_59 (15) = happyShift action_29
action_59 (16) = happyShift action_30
action_59 (17) = happyShift action_31
action_59 (29) = happyShift action_38
action_59 _ = happyReduce_25

action_60 (12) = happyShift action_26
action_60 (13) = happyShift action_27
action_60 (14) = happyShift action_28
action_60 (15) = happyShift action_29
action_60 (16) = happyShift action_30
action_60 (17) = happyShift action_31
action_60 (29) = happyShift action_38
action_60 _ = happyReduce_24

action_61 (12) = happyShift action_26
action_61 (13) = happyShift action_27
action_61 (14) = happyShift action_28
action_61 (15) = happyShift action_29
action_61 (16) = happyShift action_30
action_61 (17) = happyShift action_31
action_61 (29) = happyShift action_38
action_61 _ = happyReduce_23

action_62 (12) = happyShift action_26
action_62 (13) = happyShift action_27
action_62 (14) = happyShift action_28
action_62 (15) = happyShift action_29
action_62 (16) = happyShift action_30
action_62 (17) = happyShift action_31
action_62 (29) = happyShift action_38
action_62 _ = happyReduce_20

action_63 (12) = happyShift action_26
action_63 (13) = happyShift action_27
action_63 (14) = happyShift action_28
action_63 (15) = happyShift action_29
action_63 (16) = happyShift action_30
action_63 (17) = happyShift action_31
action_63 (29) = happyShift action_38
action_63 _ = happyReduce_19

action_64 (12) = happyShift action_26
action_64 (13) = happyShift action_27
action_64 (14) = happyShift action_28
action_64 (15) = happyShift action_29
action_64 (29) = happyShift action_38
action_64 _ = happyReduce_38

action_65 (12) = happyShift action_26
action_65 (13) = happyShift action_27
action_65 (14) = happyShift action_28
action_65 (15) = happyShift action_29
action_65 (29) = happyShift action_38
action_65 _ = happyReduce_37

action_66 (29) = happyShift action_38
action_66 _ = happyReduce_36

action_67 (29) = happyShift action_38
action_67 _ = happyReduce_35

action_68 (29) = happyShift action_38
action_68 _ = happyReduce_33

action_69 (29) = happyShift action_38
action_69 _ = happyReduce_32

action_70 _ = happyReduce_40

action_71 _ = happyReduce_30

action_72 _ = happyReduce_10

action_73 _ = happyReduce_9

action_74 (9) = happyShift action_4
action_74 (10) = happyShift action_5
action_74 (11) = happyShift action_6
action_74 (17) = happyShift action_7
action_74 (24) = happyShift action_8
action_74 (27) = happyShift action_13
action_74 (30) = happyShift action_14
action_74 (5) = happyGoto action_75
action_74 (7) = happyGoto action_76
action_74 (8) = happyGoto action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_14

action_76 (18) = happyShift action_45
action_76 (19) = happyShift action_46
action_76 (25) = happyShift action_47
action_76 (26) = happyShift action_48
action_76 _ = happyReduce_16

action_77 (12) = happyShift action_26
action_77 (13) = happyShift action_27
action_77 (14) = happyShift action_28
action_77 (15) = happyShift action_29
action_77 (16) = happyShift action_30
action_77 (17) = happyShift action_31
action_77 (18) = happyShift action_32
action_77 (19) = happyShift action_33
action_77 (20) = happyShift action_34
action_77 (21) = happyShift action_35
action_77 (22) = happyShift action_36
action_77 (23) = happyShift action_37
action_77 (29) = happyShift action_38
action_77 _ = happyReduce_15

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 ((Boolean happy_var_1)
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn4
		 ((Numerical happy_var_1)
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Listing happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Listing (( happy_var_1) ++ ( happy_var_3))
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Boolean (happy_var_1 /= happy_var_3)
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Boolean (happy_var_1 == happy_var_3)
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  4 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Numerical (fromIntegral(length(happy_var_2)))
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  5 happyReduction_8
happyReduction_8 _
	_
	 =  HappyAbsSyn5
		 ([]
	)

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 ([(Listing happy_var_1)]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 ([(Numerical happy_var_1)]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([(Boolean happy_var_1)]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ [(Listing happy_var_3)]
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ [(Numerical happy_var_3)]
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ [(Boolean happy_var_3)]
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn7
		 (True
	)

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn7
		 (False
	)

happyReduce_19 = happySpecReduce_3  7 happyReduction_19
happyReduction_19 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 == happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 /= happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 == happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  7 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 /= happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 < happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 > happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 <= happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 >= happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  7 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (not happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 && happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 || happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  7 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  8 happyReduction_31
happyReduction_31 (HappyTerminal (Num happy_var_1))
	 =  HappyAbsSyn8
		 (read happy_var_1::Double
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  8 happyReduction_32
happyReduction_32 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 * happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  8 happyReduction_33
happyReduction_33 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 / happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  8 happyReduction_34
happyReduction_34 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 ^ (round happy_var_3 ::Int)
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  8 happyReduction_35
happyReduction_35 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (fromIntegral (happy_var_1 `div'` happy_var_3)
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  8 happyReduction_36
happyReduction_36 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 `mod'` happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  8 happyReduction_37
happyReduction_37 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 + happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  8 happyReduction_38
happyReduction_38 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 - happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  8 happyReduction_39
happyReduction_39 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (-happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  8 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Num happy_dollar_dollar -> cont 9;
	Truel -> cont 10;
	Falsel -> cont 11;
	Mul -> cont 12;
	Div -> cont 13;
	IDiv -> cont 14;
	Mod -> cont 15;
	Suml -> cont 16;
	Diffl -> cont 17;
	Equals -> cont 18;
	Different -> cont 19;
	Minor -> cont 20;
	Greater -> cont 21;
	MinorE -> cont 22;
	GreaterE -> cont 23;
	Notl -> cont 24;
	Andl -> cont 25;
	Orl -> cont 26;
	OBrace -> cont 27;
	CBrace -> cont 28;
	Pot -> cont 29;
	LSquare -> cont 30;
	RSquare -> cont 31;
	Coma -> cont 32;
	HashTag -> cont 33;
	Exists -> cont 34;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 35 tk tks = happyError' (tks, explist)
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

data EvaluationResult = Boolean Bool | Numerical Double | Listing [EvaluationResult]
    deriving(Show,Eq,Ord)
main = do 
    contents <- getLine
    putStrLn (show (parseCalc (alexScanTokens  contents)))
    main
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
