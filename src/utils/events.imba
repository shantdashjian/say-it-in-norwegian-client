import Snowflakes from 'magic-snowflakes'

export def handleClick e, snow?
	const button = getButton e
	button.classList.toggle('clicked')
	setTimeout(&, 300) do() 
		button.classList.toggle('clicked')
		button.blur()
	if snow? 
		let snowflakes = new Snowflakes({
			color: '#5ECDEF', # Default: "#5ECDEF"
			container: document.body, # Default: document.body
			count: 300, # 100 snowflakes. Default: 50
			minOpacity: 0.1, # From 0 to 1. Default: 0.6
			maxOpacity: 0.95, # From 0 to 1. Default: 1
			minSize: 10, # Default: 10
			maxSize: 30, # Default: 25
			rotation: true, # Default: true
			speed: 1, # The property affects the speed of falling. Default: 1
			wind: false, # Without wind. Default: true
			zIndex: 100, # Default: 9999,
			autoResize: true # Default: true
		})
		setTimeout(&,8000) do() 
			snowflakes.stop()
			snowflakes.destroy()

def getButton e
	if e.target.tagName == 'BUTTON'  
		e.target 
	elif e.target.tagName == 'svg'
		e.target.parentNode
	else
		e.target.parentNode.parentNode