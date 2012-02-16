import Text.Pandoc
import Text.JSON.Generic
import Data.Map as M hiding (lookup)

extractCodeblock :: Block -> [(String, String)]
extractCodeblock cb@(CodeBlock (id, classes, namevals) contents) =
    case lookup "filename" namevals of
      Just f -> [(f, contents)]
      Nothing -> []
extractCodeblock x = []

extractCodeblocks :: Pandoc -> [(String, String)]
extractCodeblocks = queryWith extractCodeblock

appendNewline :: (String, String) -> (String, String)
appendNewline (a, b)
              | b == "" = (a, b)
              | otherwise = (a, b ++ "\n")

mergeBlocks :: [(String, String)] -> [(String, String)]
mergeBlocks = M.assocs . fromListWith (++)

getBlocks :: Pandoc -> [(String, String)]
getBlocks x = mergeBlocks $ Prelude.map appendNewline $ extractCodeblocks x

writeBlocks :: (String, String) -> IO()
writeBlocks (f, c) = writeFile f c

main = do
  contents <- getContents
  let doc = decodeJSON contents
      blocks = getBlocks doc
  mapM_ writeBlocks blocks
