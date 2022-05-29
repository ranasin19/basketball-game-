-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local tapCount = 0

local background = display.newImageRect( "poll.jpg", 360, 585 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tap = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tap:setFillColor( 0, 0, 0 )

local ruler = display.newImageRect( "ruler.png", 240, 50 )
ruler.x = display.contentCenterX
ruler.y = display.contentHeight-25

local basketball = display.newImageRect( "basketball.png", 60, 60 )
basketball.x = display.contentCenterX
basketball.y = display.contentCenterY
basketball.alpha = 0.8

local physics = require( "physics" )
physics.start()

physics.addBody( ruler, "static" )
physics.addBody( basketball, "dynamic", { radius=50, bounce=0.3 } )

local function pushbasketball()
	basketball:applyLinearImpulse( 0, -0.75, basketball.x, basketball.y )
	tapCount = tapCount + 1
	tap.text = tapCount
end

basketball:addEventListener( "tap", pushbasketball )
