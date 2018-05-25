import Data.Map
data JSON= GString String|
    GNumber Double|
    GBoolean Bool|
    GList [JSON] |
    GNull|
    GObject (Map String JSON)
    deriving (Show,Eq)