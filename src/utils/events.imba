export def handleClick e
	const element = e.target
	element.classList.toggle('clicked')
	setTimeout(&, 500) do() element.classList.toggle('clicked')