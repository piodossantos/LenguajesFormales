import qualified Data.Map 

data JSON= GString String|
    GNumber Double|
    GBoolean Bool|
    GList [JSON] |
    GNull|
    GObject (Data.Map.Map String JSON)
    deriving (Eq,Ord)

instance Show JSON where
    show (GString s)=s
    show (GNumber n)=show n
    show (GBoolean b) = if b then "true" else "false"
    show (GNull) = "null"
    show (GList x) = "["++ (tail $ concat $ map (\y-> "," ++ show y) x) ++ "]"
    show (GObject x)
        |Data.Map.size x ==0="{}"
        |otherwise = "{"++ (tail $ concat $ Prelude.map (\y-> "," ++ show ( fst  y) ++ ":" ++ show  (snd y) ) (Data.Map.toList x)) ++"}"

a= GObject (Data.Map.fromList [("esto_anda",GNull),("esto_tmbn",GBoolean True)])