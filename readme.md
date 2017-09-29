
This script is a redo of the epoch salvage system which, in my opinion, was good for tires and glass, nothing more. This changes that. Now you can completely dissassmble a vehicle into the components you need to fix any other vehicle (plus many other components as well!) and will then remove them from the database. This is not magic, you will have to put in the work, take the risk and pray you dont get eaten along the way!

What does this do exactly? Glad you asked! You can now reduce a vehicle into parts! All of them (and I mean ALL). Never again will you run across your favorite vehicle and not be able to drive off because you forgot your engine parts at home. That skoda 100m back can be your life saver (and I dont mean by means of driving off), just get to your nearest chop shop, get your toolbox and crowbar handy, and get rid of that ugly POS! You will be left with one less eye sore and a score of parts to drive your baby home! All parts are acquirable through scrapping. This means: Tires, Glass, FuelTank, Engine, Scrap Metal plus some cool new stuff: 1 & 2 inch pipes, metal sheets, scrap electronics, floppy wire (and many more to be added!). Maybe you are down on your luck and need a weapon, well that DshKM could be yours after a scrapping(still to be implemented)!

Things to do:

Fix breaking the dissambly chain leading to broken action(thanks @Runewulv)

Add weapon salvage with chance

Possibly change from loot in crate to loot on ground

add some trolling possibilities

Add a config file for the many options to come!

Install:

go to my github and download the repository

my github link https://github.com/Arstan13/EpochScrapper

Now it is assumed you have already installed one of the many better written, better made, more useful scripts out there so we are going to skip the custom compiles/variables/self-actions

add my snippets for fn_selfActions and Variables to your (more than likely) custom ones

drag and drop the scrapper folder into your scripts folder in your mission file!

and thats it! Too easy right!? If you still have trouble at this point, let me know. Got an idea? LET ME KNOW!

Im definitely in the need of information on what vehicles have what weapons on them, I need this info to make it so you could scrap it! Your helping me only leads to more awesome function for you so please consider it!

// OLD THREAD INFO \\
Start scrapping entire vehicles, tired of hunting warehouse to warehouse, construction complex to complex? Fear no more, you can salvage tires and windows but not fuel tank parts or engine parts? This changes that!

THIS IS A WIP! I have brought it a long way, but Ive got a lot more I want to do with this. As of right now, you can walk up to a vehicle that is unlocked, unoccupied(i hope) and not already blown dafuq up and reduce it into parts. This will allow you to salvage scrap, tank parts and engine parts (eventually rotors with aircraft when I get there). Its instantaneous (for now) and drops all loot into a box. All loot has a chance to generate, with failures actually damaging the parts you were working on, too much bad luck and vehicle WILL BLOW UP! Once you hit success, the amount of loot in the box is not locked, it will spawn a configured random amount each time. (there is a very rare chance you can succeed and get an empty box, laughed my batoutie off when it happend, on the toDO list). If you are interested, the install is below.

Install
This basically assumes you have installed one of the other, various, better, more important, better written mods already and therefore already have a custom compiles/variables/fn_selfActions. So we are going to skip that part and move onto the other stuff.

Pretty straightforward. Drag and drop the scrapper folder into your scripts folder (or change the filepaths if you migrate it elsewhere) apply the additional snippets in variables and selfActions to your files.

Variables are configurable and this is easily expandable to cover so many more vehicles. My plan is to eventually cover all the vehicles in Epoch and Overwatch.
