export def handleClick e
	const button = getButton e
	button.classList.toggle('clicked')
	setTimeout(&, 300) do() button.classList.toggle('clicked')

def getButton e
	if e.target.tagName == 'BUTTON'  
		e.target 
	elif e.target.tagName == 'svg'
		e.target.parentNode
	else
		e.target.parentNode.parentNode