import Text.Pandoc
import Text.JSON.Generic
import Data.Map as M hiding (lookup)


extractCodeblock :: Block -> [(String, String)]
extractCodeblock cb@(CodeBlock (id, classes, namevals) contents) =
    case lookup "filename" namevals of
      Just f -> [(f, contents)]
      Nothing -> [("","")]
extractCodeblock x = [("","")]

extractCodeblocks :: Pandoc -> [(String, String)]
extractCodeblocks = queryWith extractCodeblock

mergeWithNewline :: String -> String -> String
mergeWithNewline x y
    | x == "" && y == "" = ""
    | otherwise = x ++ "\n" ++ y

mergeBlocks :: [(String, String)] -> M.Map String String
mergeBlocks x = fromListWith mergeWithNewline x

main = interact (show . mergeBlocks . extractCodeblocks . decodeJSON )