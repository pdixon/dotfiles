import Text.Pandoc

inlineToString :: [Inline] -> String
inlineToString [] = ""
inlineToString [x] = inlineToString' x
inlineToString (x:xs) = inlineToString' x ++ inlineToString xs

inlineToString' :: Inline -> String
inlineToString' (Str u) = u 
inlineToString' (Space) = " "
inlineToString' _ = "" 

extractHeader :: Block -> [String]
extractHeader (Header n x)
    | n == 1 = [inlineToString x]
    | n == 3 = [inlineToString x]
extractHeader _ = []

extractHeaders :: Pandoc -> [String]
extractHeaders = queryWith extractHeader

readDoc :: String -> Pandoc
readDoc = readRST defaultParserState

main = interact (unlines . extractHeaders . readDoc)