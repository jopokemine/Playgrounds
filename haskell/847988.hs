--
-- MATHFUN
-- Template for the Haskell assignment program (replace this comment)
-- Add your student number
--

--
-- Types
--
-- Define Album type here

import Data.Ord
import Data.List
import Data.Function
import Text.Read
import Data.List.Split
import System.IO
import Control.Monad

type Album = (String, String, Int, Int)

testData :: [Album]
testData = [("Greatest Hits", "Queen", 1981, 6300000), ("Gold: Greatest Hits", "ABBA", 1992, 5400000), ("Sgt. Pepper's Lonely Hearts Club Band", "The Beatles", 1967, 5340000), ("21", "Adele", 2011, 5110000), ("(What's the Story) Morning Glory?", "Oasis", 1995, 4940000), ("Thriller", "Michael Jackson", 1982, 4470000), ("The Dark Side of the Moon", "Pink Floyd", 1973, 4470000), ("Brothers in Arms", "Dire Straits", 1985, 4350000), ("Bad", "Michael Jackson", 1987, 4140000), ("Rumours", "Fleetwood Mac", 1977, 4090000), ("Greatest Hits II", "Queen", 1991, 3990000), ("Back to Black", "Amy Winehouse", 2006, 3940000), ("The Immaculate Collection", "Madonna", 1990, 3700000), ("25", "Adele", 2015, 3500000), ("Stars", "Simply Red", 1991, 3450000), ("Come On Over", "Shania Twain", 1998, 3430000), ("x", "Ed Sheeran", 2014, 3380000), ("Legend", "Bob Marley", 1984, 3380000), ("Bat Out of Hell", "Meat Loaf", 1977, 3370000), ("Back to Bedlam", "James Blunt", 2004, 3360000), ("Urban Hymns", "The Verve", 1997, 3340000), ("Bridge over Troubled Water", "Simon & Garfunkel", 1970, 3260000), ("1", "The Beatles", 2000, 3230000), ("Spirit", "Leona Lewis", 2007, 3170000), ("Crazy Love", "Michael Bublé", 2009, 3130000), ("No Angel", "Dido", 2000, 3090000), ("White Ladder", "David Gray", 1998, 3020000), ("The Fame", "Lady Gaga", 2009, 2990000), ("Only by the Night", "Kings of Leon", 2008, 2980000), ("A Rush of Blood to the Head", "Coldplay", 2002, 2960000), ("Talk on Corners", "The Corrs", 1997, 2960000), ("Spice", "Spice Girls", 1996, 2960000), ("Life for Rent", "Dido", 2003, 2900000), ("Beautiful World", "Take That", 2006, 2880000), ("The Joshua Tree", "U2", 1987, 2880000), ("Hopes and Fears", "Keane", 2004, 2860000), ("The War of the Worlds", "Jeff Wayne", 1978, 2800000), ("X&Y", "Coldplay", 2005, 2790000), ("Jagged Little Pill", "Alanis Morissette", 1995, 2780000), ("Tubular Bells", "Mike Oldfield", 1973, 2760000), ("Scissor Sisters", "Scissor Sisters", 2004, 2760000), ("...But Seriously", "Phil Collins", 1989, 2750000), ("Tracy Chapman", "Tracy Chapman", 1988, 2710000), ("Parachutes", "Coldplay", 2000, 2710000), ("The Man Who", "Travis", 1999, 2687500), ("Greatest Hits", "ABBA", 1975, 2606000), ("I've Been Expecting You", "Robbie Williams", 1998, 2586500), ("Come Away with Me", "Norah Jones", 2002, 2556650), ("Graceland", "Paul Simon", 1986, 2500000), ("Ladies & Gentlemen: The Best of", "George Michael", 1998, 2500000)]

--
--
--  Your functional code goes here
--


addSpaces :: String -> Int -> String
addSpaces str spaces
    | length str < spaces = str ++ (concat $ replicate (spaces - length str) " ")
    | otherwise = str

formatAlbum :: Album -> String
formatAlbum (name, artist, year, sales) = addSpaces name 40 ++ addSpaces artist 19 ++ addSpaces (show year) (10) ++ addSpaces (show sales) (10) ++ "\n"

-- DEMO 1

albumsToString :: [Album] -> String
albumsToString [] = ""
albumsToString (x:xs) = formatAlbum x ++ albumsToString xs

-- DEMO 2

top10 :: [Album] -> [Album]
top10 albums = take 10 albums

-- DEMO 3

albumsBetweenYears :: [Album] -> Int -> Int -> String
albumsBetweenYears [] dateMin dateMax = []
albumsBetweenYears (x:xs) dateMin dateMax
    | (x:xs) == [] = ""
    | otherwise = dateSearch x dateMin dateMax ++ albumsBetweenYears xs dateMin dateMax

dateSearch :: Album -> Int -> Int -> String
dateSearch (name, artist, year, sales) dateMin dateMax
    | year >= dateMin && year <= dateMax = formatAlbum (name, artist, year, sales)
    | otherwise = ""

-- DEMO 4

albumsWithPrefix :: [Album] -> String -> String
albumsWithPrefix [] prefix = ""
albumsWithPrefix (x:xs) prefix
    | (x:xs) == [] = ""
    | otherwise = prefixSearch x prefix prefix ++ albumsWithPrefix xs prefix

prefixSearch :: Album -> String -> String -> String
prefixSearch ([], artist, year, sales) permPrefix prefix
    | prefix == [] = permPrefix ++ formatAlbum([], artist, year, sales)
    | otherwise = ""
prefixSearch (name, artist, year, sales) permPrefix [] = permPrefix ++ formatAlbum(name, artist, year, sales)
prefixSearch ((x:xs), artist, year, sales) permPrefix (y:ys)
    | x == y = prefixSearch (xs, artist, year, sales) permPrefix ys
    | otherwise = ""

-- DEMO 5

salesFiguresOfArtist :: [Album] -> String -> Int
salesFiguresOfArtist [] _ = 0
salesFiguresOfArtist (x:xs) artist
    | (x:xs) == [] = 0
    | otherwise = salesSearch x artist + salesFiguresOfArtist xs artist

salesSearch :: Album -> String -> Int
salesSearch (name, artist, year, sales) searchArtist
    | artist == searchArtist = sales
    | otherwise = 0

-- DEMO 6 --

artist :: Album -> String
artist (_, artist, _, _) = artist

artists = map artist

has :: [String] -> String -> Bool
has [] _ = False
has (x:xs) a
    | x == a = True
    | otherwise = has xs a

unique :: [String] -> [String]
unique [] = []
unique (x:xs)
    | has xs x = unique xs
    | otherwise = x : unique xs

checkArtistMatch :: String -> String -> Int
checkArtistMatch _ "" = 0
checkArtistMatch "" _ = 0
checkArtistMatch artist1 artist2
    | artist1 == artist2 = 1
    | otherwise = 0

checkArtistEntries :: String -> [String] -> Int
checkArtistEntries _ [] = 0
checkArtistEntries "" _ = 0
checkArtistEntries inArtist (x:xs)
    | (x:xs) == [] = 0
    | otherwise = (checkArtistMatch inArtist x) + (checkArtistEntries inArtist xs)

checkAllArtistsAlbums :: [String] -> [String] -> String
checkAllArtistsAlbums [] _ = ""
checkAllArtistsAlbums _ [] = ""
checkAllArtistsAlbums (x:xs) allArtists
    | (x:xs) == [] = ""
    | allArtists == [] = ""
    | otherwise = addSpaces (x) (19) ++ show (checkArtistEntries x allArtists) ++ "\n" ++ checkAllArtistsAlbums xs allArtists

-- DEMO 7 --

checkSales :: Album -> Int
checkSales (name, artist, year, sales) = sales

getNewIndex :: [Album] -> Int -> Int -> Int
getNewIndex albumdata newSales index
    | length albumdata > 0 && checkSales(head albumdata) < newSales = index
    | length albumdata > 0 && checkSales(head albumdata) > newSales = getNewIndex(drop 1 albumdata) newSales (index + 1)
    | length albumdata > 0 = index
    | otherwise = index

addNth :: Int -> Album -> [Album] -> [Album]
addNth _ _ [] = []
addNth n newVal (x:xs)
    | n == -1 = newVal:xs
    | n == 0 = x:newVal:xs
    | otherwise = x:addNth (n-1) newVal xs


addNewAlbum :: [Album] -> Album -> String
addNewAlbum albumdata (name, artist, year, sales) = albumsToString(addNth ((getNewIndex albumdata sales 0)-1) (name, artist, year, sales) albumdata)

-- DEMO 8 --

checkArtistAlbumMatch :: Album -> String -> String -> Bool
checkArtistAlbumMatch (name, artist, year, sales) name2 artist2
    | name == name2 && artist == artist2 = True
    | otherwise = False

addSales :: Album -> Int -> Album
addSales (name, artist, year, sales) saleIncrease
    | sales + saleIncrease < 0 = (name, artist, year, 0)
    | otherwise = (name, artist, year, sales + saleIncrease)

addToSales :: [Album] -> String -> String -> Int -> [Album]
addToSales albums "" _ _ = albums
addToSales albums _ "" _ = albums
addToSales albums _ _ 0 = albums
addToSales [] _ _ _ = []
addToSales (x:xs) name artist addedSales
    | (x:xs) == [] = []
    | checkArtistAlbumMatch x name artist == True = addSales x addedSales : xs
    | otherwise = x : (addToSales xs name artist addedSales)

-- Below breaks if you take out the x
sortAlbums x = reverse (sortBy (compare `on` getLast) x)

getLast (_,_,_,a) = a

-- Demo function to test basic functionality (without persistence - i.e.
-- testData doesn't change and nothing is saved/loaded to/from albums file).

demo :: Int -> IO ()
demo 1 = putStrLn (albumsToString testData)
demo 2 = putStrLn (albumsToString (top10 testData))
demo 3 = putStrLn (albumsBetweenYears testData 2000 2008)
demo 4 = putStrLn (albumsWithPrefix testData "Th")
demo 5 = putStrLn (show (salesFiguresOfArtist testData "Queen"))
demo 6 = putStrLn (checkAllArtistsAlbums (unique ( artists ( testData ) )) (artists ( testData ) ) )
demo 7 = putStrLn (addNewAlbum (init testData) ("Progress","Take That",2010,2700000))
demo 8 = putStrLn (albumsToString( sortAlbums (addToSales testData "21" "Adele" 400000 )))
-- Below is for the textual menu IO. main function runs below function
demo _ = do
        putStrLn (albumsToString testData)
        menuOptions True

--
--
-- Your user interface (and loading/saving) code goes here
--
--

main :: IO ()
main = demo 0

menuOptions :: Bool -> IO ()
menuOptions showMenu
    | showMenu == True = do
        putStrLn ("Enter 1 to display all albums")
        putStrLn ("Enter 2 to display top 10 albums")
        putStrLn ("Enter 3 to display albums between two dates")
        putStrLn ("Enter 4 to display albums with certain prefix")
        putStrLn ("Enter 5 to display sales figures of certain artist")
        putStrLn ("Enter 6 to display how many albums each artist has in the top 50")
        putStrLn ("Enter 7 to add a new album and display the new top 50")
        putStrLn ("Enter 8 to add a certain number of sales to a certain artist's album")
        putStrLn ("Enter x to close the menu.")
        putStrLn ("") -- Add in empty line to make it look nicer
        input <- getLine
        if input == "x"
            then putStrLn("Goodbye")
            else do
                handleMenuInput input
                menuOptions True
    | otherwise = do
        putStrLn ("") -- Add in empty line to make it look nicer
        input <- getLine
        if input == "x"
            then putStrLn("Goodbye")
            else do
                handleMenuInput input
                menuOptions True

handleMenuInput :: String -> IO ()
handleMenuInput input
    | input == "1" = putStrLn (albumsToString testData)
    | input == "2" = putStrLn (albumsToString (top10 testData))
    | input == "3" = handleInput3
    | input == "4" = handleInput4
    | input == "5" = handleInput5
    | input == "6" = putStrLn (checkAllArtistsAlbums (unique ( artists ( testData ) )) (artists ( testData ) ) )
    | input == "7" = handleInput7
    | input == "8" = handleInput8
    | input == "0" = putStrLn ("Goodbye")
    | otherwise = do
        putStr("Please enter a number between 1 and 8.")
        menuOptions False

handleInput3 :: IO ()
handleInput3 = do
    putStr ("Enter first year: ")
    year1 <- getLine
    if isInteger year1 == True && (read year1 :: Int) >= 0
        then do
            putStr ("\nEnter second year: ")
            year2 <- getLine
            if isInteger (year2) == True && (read year2 :: Int) >= 0
            then do
                if (read year2 :: Int) > (read year1 :: Int)
                    then putStrLn ("\n" ++ albumsBetweenYears testData (read year1 :: Int) (read year2 :: Int))
                    else putStrLn ("\n" ++ albumsBetweenYears testData (read year2 :: Int) (read year1 :: Int))
            else do
                putStrLn ("Second year invalid, please enter valid inputs")
                handleInput3
        else do
            putStrLn ("First year invalid, please enter valid inputs")
            handleInput3

isInteger :: String -> Bool
isInteger str
    | (readMaybe str :: Maybe Int) == Nothing = False
    | otherwise = True

handleInput4 :: IO ()
handleInput4 = do
    putStr ("Enter a prefix (Case Sensitive!): ")
    prefix <- getLine
    putStrLn ("\n" ++ albumsWithPrefix testData prefix)

handleInput5 :: IO ()
handleInput5 = do
    putStr ("Enter an artist (Case Sensitive!): ")
    artist <- getLine
    putStrLn (show (salesFiguresOfArtist testData artist))

handleInput7 :: IO ()
handleInput7 = do
    putStr ("Enter Album Name: ")
    album <- getLine
    if album == ""
        then do
            putStrLn ("You must have an album name. Please enter valid inputs.")
            handleInput7
        else do
            putStr ("\nEnter Artist Name: ")
            artist <- getLine
            if artist == ""
                then do
                    putStrLn ("You must have an artist name. Please enter valid inputs.")
                    handleInput7
                else do
                    putStr ("\nEnter Release Year: ")
                    year <- getLine
                    if isInteger year == True && (read year :: Int) > 0
                        then do
                            putStr ("\nEnter Sales: ")
                            sales <- getLine
                            if isInteger sales == True && (read sales :: Int) > 0
                                then putStrLn ("\n" ++ addNewAlbum (init testData) (album, artist, (read year :: Int), (read sales :: Int)))
                                else do
                                    putStrLn ("Invalid number of sales. Please enter valid inputs.")
                                    handleInput7
                        else do
                            putStrLn ("Invalid year. Please enter valid inputs.")
                            handleInput7


handleInput8 :: IO ()
handleInput8 = do
    putStr ("Enter Album Name (Case Sensitive!): ")
    album <- getLine
    putStr ("\nEnter Artist Name (Case Sensitive!): ")
    artist <- getLine
    putStr ("\nEnter amount of sales to be added (Negative numbers will subtract from sales): ")
    sales <- getLine
    if isInteger sales == True
        then putStr ("\n" ++ albumsToString(sortAlbums(addToSales testData album artist (read sales :: Int))))
        else do
            putStrLn ("Invalid number of sales. Please enter valid inputs.")
            handleInput8
