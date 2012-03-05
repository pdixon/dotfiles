import System
import System.Console.GetOpt

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

listFile :: (String, String) -> IO()
listFile (f,_) = putStrLn f 

data Options = Options {
      optInput :: IO String,
      optAction :: (String, String) -> IO()
    }

defaultOptions :: Options
defaultOptions = Options {
                   optInput = getContents,
                   optAction = writeBlocks
                 }

options :: [OptDescr (Options -> IO Options)]
options = [
    Option ['V'] ["version"] (NoArg showVersion) "show version number",
    Option ['i'] ["input"] (ReqArg readInput "FILE") "input file to read",
    Option ['l'] ["list"] (NoArg setList) "list embedded files"
  ]

showVersion :: Options -> IO Options
showVersion _ = do
  putStrLn "tangle 0.1"
  exitWith ExitSuccess

readInput arg opt = return opt { optInput = readFile arg }
setList opt = return opt { optAction = listFile }

tangleOpts :: [String] -> IO Options
tangleOpts argv =
    case getOpt RequireOrder options argv of
      (o,[],[] ) -> foldl (>>=) (return defaultOptions) o
      (_,_,errs) -> ioError (userError (concat errs ++ usageInfo header options))
    where header = "Usage: tangle [OPTION...]"

main = do
  args <- getArgs
  opts <- tangleOpts args
  contents <- optInput opts
  let blocks = getBlocks (decodeJSON contents)
      act = optAction opts
  mapM_ act blocks
