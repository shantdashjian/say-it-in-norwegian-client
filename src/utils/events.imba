export def handleClick e
	const element = if e.target.tagName == 'BUTTON' then e.target else e.target.parentNode
	element.classList.toggle('clicked')
	setTimeout(&, 500) do() element.classList.toggle('clicked')